package dao;

import pojo.DeskChange;
import pojo.StaffPersonal;
import pojo.StaffWork;

/**
 * @author Kayll
 * @date 2018/11/3 18:42
 */
public interface DatabaseOperate {
    public boolean loginForRegist(String account, String password);
    public boolean loginForMain(String account, String password);
    public StaffWork selectStaffWork(String email);
    public int updateStaffPersonal(StaffPersonal staffPersonal);
    public int insertDeskChange(DeskChange deskChange);
}
