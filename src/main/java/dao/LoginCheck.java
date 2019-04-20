package dao;

import mapper.UserMapper;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Component;
import pojo.DeskChange;
import pojo.StaffPersonal;
import pojo.StaffWork;

import java.io.IOException;
import java.io.InputStream;
import java.math.BigInteger;
import java.security.MessageDigest;

/**
 * @author Kayll
 * @date 2018/10/29 19:03
 */
@Component
public class LoginCheck implements DatabaseOperate{

    @Override
    public  boolean loginForRegist(String account, String password){
        SqlSessionFactory sqlSessionFactory = null;
        SqlSession sqlSession = null;
        UserMapper userMapper = null;
        int a = 0;
        String resource = "mybatis/mybatis.cfg.xml";
        InputStream inputStream;
        try {
            inputStream = Resources.getResourceAsStream(resource);
            sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
            sqlSession = sqlSessionFactory.openSession();
            userMapper = sqlSession.getMapper(UserMapper.class);
            a=userMapper.loginCheckByIdcardNum(account);
            sqlSession.commit();
        } catch (IOException e) {
            e.printStackTrace();
            sqlSession.rollback();
        }finally {
            if(sqlSession!=null){
                sqlSession.close();
            }
        }
        if(a==1){
            if(password.equals(account.subSequence(account.length()-6,account.length()))){
                return true;
            }
        }
        return false;
    }
    @Override
    public  boolean loginForMain(String account, String password){
        String passwordResult = null;
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("spring/applicationContext.xml");
        UserMapper userMapper = applicationContext.getBean(UserMapper.class);
        passwordResult=userMapper.loginCheckByEmail(account);
        System.out.println("操作了数据库");
        if (password != null && getMD5String(password).equals(passwordResult)) {
            return true;
        }
        return false;
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
        return 0;
    }
}
