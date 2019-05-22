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
    override fun insertStaffWork(staffWork: StaffWork): Int {
        TODO("not implemented") //To change body of created functions use File | Settings | File Templates.
    }


    override fun updateStaffPersonalWorkId(): Int {
        var resultCode = 0
        val applicationContext = ClassPathXmlApplicationContext("spring/applicationContext.xml")
        val userMapper = applicationContext.getBean<UserMapper>(UserMapper::class.java)
        resultCode = userMapper.updateStaffPersonalWorkId()!!
        return resultCode
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

    fun updateDeskChange(applyresult:String, id:Int):Int{
        var resultCode = 0
        val applicationContext = ClassPathXmlApplicationContext("spring/applicationContext.xml")
        val userMapper = applicationContext.getBean<UserMapper>(UserMapper::class.java)
        resultCode = userMapper.updateDeskChange(applyresult, id)!!
        return resultCode
    }
    fun updateResign(applyresult:String, workId:String):Int{
        var resultCode = 0
        val applicationContext = ClassPathXmlApplicationContext("spring/applicationContext.xml")
        val userMapper = applicationContext.getBean<UserMapper>(UserMapper::class.java)
        resultCode = userMapper.updateResign(applyresult, workId)!!
        return resultCode
    }

    fun updateWorkday(applyresult:String, id:Int):Int{
        var resultCode = 0
        val applicationContext = ClassPathXmlApplicationContext("spring/applicationContext.xml")
        val userMapper = applicationContext.getBean<UserMapper>(UserMapper::class.java)
        resultCode = userMapper.updateWorkday(applyresult, id)!!
        return resultCode
    }
    fun updateStaffWorkPower(workId:String, jobhead:Int,departmenthead:Int,hr:Int):Int{
        var resultCode = 0
        val applicationContext = ClassPathXmlApplicationContext("spring/applicationContext.xml")
        val userMapper = applicationContext.getBean<UserMapper>(UserMapper::class.java)
        resultCode = userMapper.updateStaffWorkPower(workId,jobhead,departmenthead,hr)!!
        return resultCode
    }
}
