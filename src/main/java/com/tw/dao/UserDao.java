package com.tw.dao;

import com.tw.domain.User;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class UserDao extends BasicDao<User> {

    private static final String GET_USER_BY_NAME="from User where username=?";

    /**
     * 根据用户名获取用户
     * @param name
     * @return
     */
    @Transactional(readOnly = true)
    public User getUserByName(String name){
        /*return getHibernateTemplate().execute(new HibernateCallback<User>() {
            @Override
            public User doInHibernate(Session session) throws HibernateException {

            }
        });*/
        return getHibernateTemplate().execute(session -> session.createQuery(GET_USER_BY_NAME,User.class).setParameter(0,name).uniqueResult());
    }

}
