package com.tw.service;

import com.tw.dao.LoginLogDao;
import com.tw.dao.UserDao;
import com.tw.domain.LoginLog;
import com.tw.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.ServletContextAware;

import javax.servlet.ServletContext;
import java.io.Serializable;
import java.util.List;

@Service
public class UserService extends BasicService{


    @Autowired
    private UserDao userDao;

    @Autowired
    private LoginLogDao loginLogDao;

    public UserDao getUserDao() {
        return userDao;
    }

    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

    public LoginLogDao getLoginLogDao() {
        return loginLogDao;
    }

    public void setLoginLogDao(LoginLogDao loginLogDao) {
        this.loginLogDao = loginLogDao;
    }

    /**
     * 根据用户名查找User对象
     * @param name
     * @return
     */
    public User getUserByName(String name){
        return userDao.getUserByName(name);
    }

    /**
     * 用户登录成功操作
     */
    public Serializable loginSuccess(LoginLog loginLog){
        return loginLogDao.save(loginLog);
    }

    public List<User> loadAll(){
        return userDao.loadAll();
    }

}
