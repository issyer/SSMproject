package dao

import mapper.UserMapper
import org.springframework.context.ApplicationContext
import org.springframework.context.support.ClassPathXmlApplicationContext
import org.springframework.stereotype.Component
import pojo.*

/**
 * @author Kayll
 * @date 2018/11/3 8:58
 */
@Component
class Insert : DatabaseOperate {
    override fun insertStaffWork(staffWork: StaffWork): Int {
        var resultCode = 0
        val applicationContext = ClassPathXmlApplicationContext("spring/applicationContext.xml")
        val userMapper = applicationContext.getBean(UserMapper::class.java)
        resultCode = userMapper.insertStaffWork(staffWork)!!
        return resultCode
    }

    override fun updateStaffPersonalWorkId(): Int {
        TODO("not implemented") //To change body of created functions use File | Settings | File Templates.
    }

    override fun loginForRegist(account: String, password: String): Boolean {
        return false
    }

    override fun loginForMain(account: String, password: String): Boolean {
        return false
    }

    override fun selectStaffWork(email: String): StaffWork? {
        return null
    }

    override fun updateStaffPersonal(staffPersonal: StaffPersonal): Int {
        return 0
    }

    override fun insertDeskChange(deskChange: DeskChange): Int {
        var resultCode = 0
        val applicationContext = ClassPathXmlApplicationContext("spring/applicationContext.xml")
        val userMapper = applicationContext.getBean(UserMapper::class.java)
        resultCode = userMapper.insertDeskChange(deskChange)!!
        return resultCode
    }

    fun insertResign(resign: Resign): Int {
        var resultCode = 0
        val applicationContext = ClassPathXmlApplicationContext("spring/applicationContext.xml")
        val userMapper = applicationContext.getBean(UserMapper::class.java)
        resultCode = userMapper.insertResign(resign)!!
        return resultCode
    }

    fun insertAppeal(appeal: Appeal): Int {
        var resultCode = 0
        val applicationContext = ClassPathXmlApplicationContext("spring/applicationContext.xml")
        val userMapper = applicationContext.getBean(UserMapper::class.java)
        resultCode = userMapper.insertAppeal(appeal)!!
        return resultCode
    }
}
