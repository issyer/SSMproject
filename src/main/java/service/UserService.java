package service;

import dao.Insert;
import dao.Select;
import dao.Update;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
import pojo.*;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * @author Kayll
 * @date 2018/11/2 20:14
 */
@Component("userService")
public class UserService implements UserServiceInterface{
    @Autowired
    private Select select = null;
    @Autowired
    private Update update = null;
    @Autowired
    private Insert insert = null;
    @Autowired
    StaffWork staffWork = null;
    @Override
    public  StaffWork getUser(String email){
        String time = null;
        staffWork = select.selectStaffWork(email);
        System.out.println(staffWork.getName());
        time = staffWork.getEntryTime();
        SimpleDateFormat dfs = new SimpleDateFormat("yyyy-MM-dd");
        Date begin= new Date();
        Date end = new Date();
        Date d = new Date();
        String dateNowStr = dfs.format(d);
        try {
            begin = dfs.parse(time);
            end = dfs.parse(dateNowStr);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        long between=(end.getTime()-begin.getTime())/1000;//除以1000是为了转换成秒
        long day=between/(24*3600);
        long month = day/30;
        long year = month/12;
        day -=30*month;
        month -= 12*year;
        staffWork.setEntryTime(year+"年"+month+"月"+day+"天");
        return staffWork;
    }

    @Override
    public int registUser(StaffPersonal staffPersonal) {
        return update.updateStaffPersonal(staffPersonal);
    }

    @Override
    public int deskChangeApply(DeskChange deskChange) {
        Date applyTime = new Date();
        SimpleDateFormat dfs = new SimpleDateFormat("yyyy-MM-dd");
        String dateNowStr = dfs.format(applyTime);
        deskChange.setDate(dateNowStr);
        return insert.insertDeskChange(deskChange);
    }

    @Override
    public List<DeskChange> getDeskChangeList(String workid) {
        return select.selectDeskChange(workid);
    }

    @Override
    public List<DeskChange> getDeskChangeList2(String workid) {
        return select.selectDeskChange2(workid);
    }

    @Override
    public int resignApply(Resign resign) {
        Date applyTime = new Date();
        SimpleDateFormat dfs = new SimpleDateFormat("yyyy-MM-dd");
        String dateNowStr = dfs.format(applyTime);
        resign.setDate(dateNowStr);
        return insert.insertResign(resign);
    }

    @Override
    public List<Resign> getResignList(String workid) {
        return select.selectResign(workid);
    }

    @Override
    public List<Resign> getResignList2(String workid) {
        return select.selectResign2(workid);
    }

    @Override
    public int attendanceAppeal(Appeal appeal) {
        Date applyTime = new Date();
        SimpleDateFormat dfs = new SimpleDateFormat("yyyy-MM-dd");
        String dateNowStr = dfs.format(applyTime);
        appeal.setDate(dateNowStr);
        return insert.insertAppeal(appeal);
    }

    @Override
    public List<Appeal> getAppealList(String workid) {
        return select.selectAppeal(workid);
    }

    @Override
    public List<Appeal> getAppealList2(String workid) {
        return select.selectAppeal2(workid);
    }

    @Override
    public List<Notice> getNoticeList() {
        return select.selectNotice();
    }

    @Override

    public Notice getNoticeContent(int id) {
        return select.selectNoticeContent(id);
    }

    @Override
    public int updateStaffWorkPassword(String workId, String password) {
        String p2 = getMD5String(password);
        return update.updatePassword(workId,p2);
    }

    public  String getMD5String(String str) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            md.update(str.getBytes());
            return new BigInteger(1, md.digest()).toString(16);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
