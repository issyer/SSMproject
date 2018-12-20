package dao;

import mapper.UserMapper;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Component;
import pojo.*;

import java.util.List;

/**
 * @author Kayll
 * @date 2018/11/2 20:32
 */
@Component
public class Select implements DatabaseOperate {
    @Override
    public boolean loginForRegist(String account, String password) {
        return false;
    }

    @Override
    public boolean loginForMain(String account, String password) {
        return false;
    }

    @Override
    public StaffWork selectStaffWork(String email){
        StaffWork staffWork ;
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("spring/applicationContext.xml");
        UserMapper userMapper = applicationContext.getBean(UserMapper.class);
        staffWork = userMapper.selectStaffWork(email);
        return staffWork;
    }

    @Override
    public int updateStaffPersonal(StaffPersonal staffPersonal) {
        return 0;
    }

    @Override
    public int insertDeskChange(DeskChange deskChange) {
        return 0;
    }


    public List<DeskChange> selectDeskChange(String workid){
        List<DeskChange> deskChange ;
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("spring/applicationContext.xml");
        UserMapper userMapper = applicationContext.getBean(UserMapper.class);
        deskChange = userMapper.selectDeskChange(workid);
        return deskChange;
    }
    public List<DeskChange> selectDeskChange2(String workid){
        List<DeskChange> deskChange ;
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("spring/applicationContext.xml");
        UserMapper userMapper = applicationContext.getBean(UserMapper.class);
        deskChange = userMapper.selectDeskChange2(workid);
        return deskChange;
    }

    public List<Resign> selectResign(String workid){
        List<Resign> resigns ;
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("spring/applicationContext.xml");
        UserMapper userMapper = applicationContext.getBean(UserMapper.class);
        resigns = userMapper.selectResign(workid);
        return resigns;
    }
    public List<Resign> selectResign2(String workid){
        List<Resign> resigns ;
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("spring/applicationContext.xml");
        UserMapper userMapper = applicationContext.getBean(UserMapper.class);
        resigns = userMapper.selectResign2(workid);
        return resigns;
    }

    public List<Appeal> selectAppeal(String workid){
        List<Appeal> appeals ;
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("spring/applicationContext.xml");
        UserMapper userMapper = applicationContext.getBean(UserMapper.class);
        appeals = userMapper.selectAppeal(workid);
        return appeals;
    }
    public List<Appeal> selectAppeal2(String workid){
        List<Appeal> appeals ;
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("spring/applicationContext.xml");
        UserMapper userMapper = applicationContext.getBean(UserMapper.class);
        appeals = userMapper.selectAppeal2(workid);
        return appeals;
    }

    public List<Notice> selectNotice(){
        List<Notice> notice ;
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("spring/applicationContext.xml");
        UserMapper userMapper = applicationContext.getBean(UserMapper.class);
        notice = userMapper.selectNotice();
        return notice;
    }

    public Notice selectNoticeContent(int id){
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("spring/applicationContext.xml");
        UserMapper userMapper = applicationContext.getBean(UserMapper.class);
        return userMapper.selectNoticeContent(id);
    }
}
