package com.tw.web.conversion;

import com.tw.dao.UserDao;
import com.tw.domain.User;
import com.tw.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;

public class StringToUserConversion implements Converter<String,User> {

    @Autowired
    private UserDao userDao;

    public UserDao getUserDao() {
        return userDao;
    }

    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

    @Override
    public User convert(String s) {
        return userDao.get(s);
    }
}
