package com.tw.test;

import com.tw.domain.Department;
import com.tw.domain.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import java.util.HashSet;
import java.util.Set;

public class Test {

    public static void main(String[] args) {
        SessionFactory sessionFactory=null;
        Session session=null;
        try {
            sessionFactory=new Configuration().configure("conf/hibernate.cfg.xml").buildSessionFactory();
            /*session=sessionFactory.openSession();
            Transaction transaction=session.beginTransaction();
            Department department=new Department();
            department.setName("ee");
            session.save(department);
            transaction.commit();*/
        }finally {
           // session.close();
            sessionFactory.close();
        }
    }

}
