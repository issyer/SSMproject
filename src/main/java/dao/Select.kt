package dao

import mapper.UserMapper
import org.springframework.context.ApplicationContext
import org.springframework.context.support.ClassPathXmlApplicationContext
import org.springframework.stereotype.Component
import pojo.*

/**
 * @author Kayll
 * @date 2018/11/2 20:32
 */
@Component
class Select : DatabaseOperate {
    override fun loginForRegist(account: String, password: String): Boolean {
        return false
    }

    override fun loginForMain(account: String, password: String): Boolean {
        return false
    }

    override fun selectStaffWork(email: String): StaffWork {
        val staffWork: StaffWork
        val applicationContext = ClassPathXmlApplicationContext("spring/applicationContext.xml")
        val userMapper = applicationContext.getBean(UserMapper::class.java)
        staffWork = userMapper.selectStaffWork(email)
        return staffWork
    }

    override fun updateStaffPersonal(staffPersonal: StaffPersonal): Int {
        return 0
    }

    override fun insertDeskChange(deskChange: DeskChange): Int {
        return 0
    }


    fun selectDeskChange(workid: String): List<DeskChange> {
        val deskChange: List<DeskChange>
        val applicationContext = ClassPathXmlApplicationContext("spring/applicationContext.xml")
        val userMapper = applicationContext.getBean(UserMapper::class.java)
        deskChange = userMapper.selectDeskChange(workid)
        return deskChange
    }

    fun selectDeskChange2(workid: String): List<DeskChange> {
        val deskChange: List<DeskChange>
        val applicationContext = ClassPathXmlApplicationContext("spring/applicationContext.xml")
        val userMapper = applicationContext.getBean(UserMapper::class.java)
        deskChange = userMapper.selectDeskChange2(workid)
        return deskChange
    }

    fun selectResign(workid: String): List<Resign> {
        val resigns: List<Resign>
        val applicationContext = ClassPathXmlApplicationContext("spring/applicationContext.xml")
        val userMapper = applicationContext.getBean(UserMapper::class.java)
        resigns = userMapper.selectResign(workid)
        return resigns
    }

    fun selectResign2(workid: String): List<Resign> {
        val resigns: List<Resign>
        val applicationContext = ClassPathXmlApplicationContext("spring/applicationContext.xml")
        val userMapper = applicationContext.getBean(UserMapper::class.java)
        resigns = userMapper.selectResign2(workid)
        return resigns
    }

    fun selectAppeal(workid: String): List<Appeal> {
        val appeals: List<Appeal>
        val applicationContext = ClassPathXmlApplicationContext("spring/applicationContext.xml")
        val userMapper = applicationContext.getBean(UserMapper::class.java)
        appeals = userMapper.selectAppeal(workid)
        return appeals
    }

    fun selectAppeal2(workid: String): List<Appeal> {
        val appeals: List<Appeal>
        val applicationContext = ClassPathXmlApplicationContext("spring/applicationContext.xml")
        val userMapper = applicationContext.getBean(UserMapper::class.java)
        appeals = userMapper.selectAppeal2(workid)
        return appeals
    }

    fun selectNotice(): List<Notice> {
        val notice: List<Notice>
        val applicationContext = ClassPathXmlApplicationContext("spring/applicationContext.xml")
        val userMapper = applicationContext.getBean(UserMapper::class.java)
        notice = userMapper.selectNotice()
        return notice
    }

    fun selectNoticeContent(id: Int): Notice {
        val applicationContext = ClassPathXmlApplicationContext("spring/applicationContext.xml")
        val userMapper = applicationContext.getBean(UserMapper::class.java)
        return userMapper.selectNoticeContent(id)
    }
}
