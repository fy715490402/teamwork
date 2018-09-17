package com.tw.web.listener;

import com.tw.domain.User;
import com.tw.service.UserService;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.web.context.ServletContextAware;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.util.List;

public class InitDateBean implements InitializingBean,ServletContextAware {

    private static final String QUERY_ALL_USER="from User";

    @Autowired
    private SessionFactory sessionFactory ;

    private Session session;

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public void afterPropertiesSet() throws Exception {

    }

    @Override
    public void setServletContext(ServletContext servletContext) {
        session = sessionFactory.openSession();
        List<User> users = session.createQuery(QUERY_ALL_USER,User.class).list();
        if (session!=null&&session.isOpen()){
            session.close();
        }
        System.out.println(users.size());
        servletContext.setAttribute("users",users);
    }

}
