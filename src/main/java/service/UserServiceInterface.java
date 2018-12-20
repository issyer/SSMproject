package service;

import pojo.*;

import java.util.List;

/**
 * @author Kayll
 * @date 2018/11/3 18:33
 */
public interface UserServiceInterface {
    public StaffWork getUser(String email);
    public int registUser(StaffPersonal staffPersonal);

    public int deskChangeApply(DeskChange deskChange);
    public List<DeskChange> getDeskChangeList(String workid);
    public List<DeskChange> getDeskChangeList2(String workid);

    public int resignApply(Resign resign);
    public List<Resign> getResignList(String workid);
    public List<Resign> getResignList2(String workid);

    public int attendanceAppeal(Appeal appeal);
    public List<Appeal> getAppealList(String workid);
    public List<Appeal> getAppealList2(String workid);

    public List<Notice> getNoticeList();
    public Notice getNoticeContent(int id);

    public int updateStaffWorkPassword(String email, String password);
}
