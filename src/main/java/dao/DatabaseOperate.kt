package dao

import pojo.DeskChange
import pojo.StaffPersonal
import pojo.StaffWork

/**
 * @author Kayll
 * @date 2018/11/3 18:42
 */
interface DatabaseOperate {
    public fun loginForRegist(account: String, password: String): Boolean
    public fun loginForMain(account: String, password: String): Boolean
    public fun selectStaffWork(email: String): StaffWork?
    public fun updateStaffPersonal(staffPersonal: StaffPersonal): Int
    public fun insertDeskChange(deskChange: DeskChange): Int
}
