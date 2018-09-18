package com.tw.web.conversion;

import com.tw.domain.User;
import com.tw.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;

import javax.persistence.Access;
import java.util.HashSet;
import java.util.Set;

public class IdArrayToObjectSetConversion implements Converter<String[], Set> {

    @Autowired
    private UserService userService;

    public UserService getUserService() {
        return userService;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @Override
    public Set convert(String[] o) {
        Set set = new HashSet();
        for (int i=0;i<o.length;i++){
            User user = userService.getUserDao().get(o[i]);
            set.add(user);
        }
        return set;
    }
}
