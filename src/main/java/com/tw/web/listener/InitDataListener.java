package com.tw.web.listener;

import com.tw.domain.User;
import com.tw.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.util.List;

public class InitDataListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        ServletContext context = sce.getServletContext();
        WebApplicationContext webApplicationContext = WebApplicationContextUtils.getWebApplicationContext(context);
        UserService userService = webApplicationContext.getBean("userService",UserService.class);
        List<User> users = userService.loadAll();
        System.out.println(users.size());
        context.setAttribute("users",users);
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {

    }
}
