package dao

import mapper.UserMapper
import org.apache.ibatis.io.Resources
import org.apache.ibatis.session.SqlSession
import org.apache.ibatis.session.SqlSessionFactory
import org.apache.ibatis.session.SqlSessionFactoryBuilder
import org.springframework.context.support.ClassPathXmlApplicationContext
import org.springframework.stereotype.Component
import pojo.DeskChange
import pojo.StaffPersonal
import pojo.StaffWork

import java.io.IOException
import java.io.InputStream
import java.math.BigInteger
import java.security.MessageDigest

/**
 * @author Kayll
 * @date 2018/10/29 19:03
 */
@Component
class LoginCheck : DatabaseOperate {


    override fun loginForRegist(account: String, password: String): Boolean {
        var sqlSessionFactory: SqlSessionFactory? = null
        var sqlSession: SqlSession? = null
        var userMapper: UserMapper? = null
        var a = 0
        val resource = "mybatis/mybatis.cfg.xml"
        val inputStream: InputStream
        try {
            inputStream = Resources.getResourceAsStream(resource)
            sqlSessionFactory = SqlSessionFactoryBuilder().build(inputStream)
            sqlSession = sqlSessionFactory!!.openSession()
            userMapper = sqlSession!!.getMapper(UserMapper::class.java)
            a = userMapper!!.loginCheckByIdcardNum(account)!!
            sqlSession.commit()
        } catch (e: IOException) {
            e.printStackTrace()
            sqlSession!!.rollback()
        } finally {
            sqlSession?.close()
        }
        if (a == 1) {
            if (password == account.subSequence(account.length - 6, account.length)) {
                return true
            }
        }
        return false
    }

    override fun loginForMain(account: String, password: String): Boolean {
        var passwordResult: String? = null
        val applicationContext = ClassPathXmlApplicationContext("spring/applicationContext.xml")
        val userMapper = applicationContext.getBean(UserMapper::class.java)
        passwordResult = userMapper.loginCheckByEmail(account)
        println("操作了数据库")
        return if (password != null && getMD5String(password) == passwordResult) {
            true
        } else false
    }

    fun getMD5String(str: String): String? {
        try {
            val md = MessageDigest.getInstance("MD5")
            md.update(str.toByteArray())
            return BigInteger(1, md.digest()).toString(16)
        } catch (e: Exception) {
            e.printStackTrace()
            return null
        }

    }

    override fun selectStaffWork(email: String): StaffWork? {
        return null
    }

    override fun updateStaffPersonal(staffPersonal: StaffPersonal): Int {
        return 0
    }

    override fun insertDeskChange(deskChange: DeskChange): Int {
        return 0
    }
}
