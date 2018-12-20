package dao;

import mapper.UserMapper;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Component;
import pojo.DeskChange;
import pojo.StaffPersonal;
import pojo.StaffWork;

import java.util.HashMap;
import java.util.Map;

/**
 * @author Kayll
 * @date 2018/11/3 8:58
 */
@Component
public class Update implements DatabaseOperate{
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
        int resultCode = 0;
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("spring/applicationContext.xml");
        UserMapper userMapper = applicationContext.getBean(UserMapper.class);
        resultCode = userMapper.updateStaffPersonal(staffPersonal);
        return resultCode;
    }

    @Override
    public int insertDeskChange(DeskChange deskChange) {
        return 0;
    }

    public int updatePassword(String workId, String password){
        int resultCode = 0;
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("spring/applicationContext.xml");
        UserMapper userMapper = applicationContext.getBean(UserMapper.class);
        resultCode = userMapper.updatePassword(workId,password);
        return resultCode;
    }

}
