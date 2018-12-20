package dao;

import mapper.UserMapper;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Component;
import pojo.*;

/**
 * @author Kayll
 * @date 2018/11/3 8:58
 */
@Component
public class Insert implements DatabaseOperate{

    @Override
    public boolean loginForRegist(String account, String password) {
        return false;
    }

    @Override
    public boolean loginForMain(String account, String password) {
        return false;
    }

    @Override
    public StaffWork selectStaffWork(String email) {
        return null;
    }

    @Override
    public int updateStaffPersonal(StaffPersonal staffPersonal) {
        return 0;
    }

    @Override
    public int insertDeskChange(DeskChange deskChange) {
        int resultCode = 0;
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("spring/applicationContext.xml");
        UserMapper userMapper = applicationContext.getBean(UserMapper.class);
        resultCode = userMapper.insertDeskChange(deskChange);
        return resultCode;
    }

    public int insertResign(Resign resign){
        int resultCode = 0;
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("spring/applicationContext.xml");
        UserMapper userMapper = applicationContext.getBean(UserMapper.class);
        resultCode = userMapper.insertResign(resign);
        return resultCode;
    }

    public int insertAppeal(Appeal appeal){
        int resultCode = 0;
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("spring/applicationContext.xml");
        UserMapper userMapper = applicationContext.getBean(UserMapper.class);
        resultCode = userMapper.insertAppeal(appeal);
        return resultCode;
    }
}
