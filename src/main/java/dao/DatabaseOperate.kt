package dao

import pojo.DeskChange
import pojo.StaffPersonal
import pojo.StaffWork

/**
 * @author Kayll
 * @date 2018/11/3 18:42
 */
interface DatabaseOperate {
    fun loginForRegist(account: String, password: String): Boolean
    fun loginForMain(account: String, password: String): Boolean
    fun selectStaffWork(email: String): StaffWork?
    fun updateStaffPersonal(staffPersonal: StaffPersonal): Int
    fun insertStaffWork(staffWork: StaffWork): Int
    fun updateStaffPersonalWorkId(): Int
    fun insertDeskChange(deskChange: DeskChange): Int
}
