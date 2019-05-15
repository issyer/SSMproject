package dao

import mapper.UserMapper
import org.springframework.context.support.ClassPathXmlApplicationContext
import org.springframework.stereotype.Component
import pojo.DeskChange
import pojo.StaffPersonal
import pojo.StaffWork

/**
 * @author Kayll
 * @date 2018/11/3 8:58
 */
@Component
class Update : DatabaseOperate {
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
        var resultCode = 0
        val applicationContext = ClassPathXmlApplicationContext("spring/applicationContext.xml")
        val userMapper = applicationContext.getBean<UserMapper>(UserMapper::class.java)
        resultCode = userMapper.updateStaffPersonal(staffPersonal)!!
        return resultCode
    }

    override fun insertDeskChange(deskChange: DeskChange): Int {
        return 0
    }

    fun updatePassword(workId: String, password: String): Int {
        var resultCode = 0
        val applicationContext = ClassPathXmlApplicationContext("spring/applicationContext.xml")
        val userMapper = applicationContext.getBean<UserMapper>(UserMapper::class.java)
        resultCode = userMapper.updatePassword(workId, password)!!
        return resultCode
    }

}
