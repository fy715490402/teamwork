package com.tw.dao;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.transaction.annotation.Transactional;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class BasicDao<T> {

    @Autowired
    private HibernateTemplate hibernateTemplate;

    //T的实体类型
    private Class entityClass;

    public BasicDao() {
        ParameterizedType type = (ParameterizedType) this.getClass().getGenericSuperclass();
        Type[] types = type.getActualTypeArguments();
        entityClass= (Class) types[0];
    }

    /**
     * 持久化对象
     * @param entity
     * @return
     */
    @Transactional
    public Serializable save(T entity){
        return hibernateTemplate.save(entity);
    }

    /**
     * 删除对象
     * @param entity
     */
    @Transactional
    public void remove(T entity){
        hibernateTemplate.delete(entity);
    }

    /**
     * 更新对象
     * @param entity
     */
    @Transactional
    public void update(T entity){
        hibernateTemplate.update(entity);
    }

    /**
     * 根据ID查找对象
     * @param id
     * @return
     */
    @Transactional(readOnly = true)
    public T get(Serializable id){
        return (T) hibernateTemplate.get(entityClass,id);
    }

    /**
     * 根据ID查找对象
     * @param id
     * @return
     */
    @Transactional(readOnly = true)
    public T load(Serializable id){
        return (T) hibernateTemplate.load(entityClass,id);
    }

    /**
     * 统计记录总数
     * @return
     */
    @Transactional(readOnly = true)
    public int count(){
        return hibernateTemplate.loadAll(entityClass).size();
    }

    public List<T> loadAll(){
        return hibernateTemplate.loadAll(entityClass);
    }

    //    以下实现分页

    /**
     *
     * @param hql select * from User where 子句 order by ..
     * @param pageSize
     * @param pageNo
     * @param objects
     * @return
     */
    public Page<T> pagedQuery(String hql,int pageSize,int pageNo,Object... objects){
        String queryCountStatement = "select count(*)"+removeSelect(removeOrders(hql));
        //数据库记录总数
        int count = hibernateTemplate.execute(session -> (Integer) session.createQuery(queryCountStatement).uniqueResult());
        if (count<1){
            return new Page<>();
        }
        List list = hibernateTemplate.execute(session -> {
            Query query = createQueryStatement(session,hql,objects);
            return query.setFirstResult((pageNo-1)*pageSize).setMaxResults(pageNo*pageSize-1).list();
        });
        return new Page<>(pageSize,count,pageNo,list);
    }

    private Query createQueryStatement(Session session,String hql,Object... objects){
        Query query = session.createQuery(hql);
        for (int i=0;i<objects.length;i++){
            query.setParameter(i,objects[i]);
        }
        return query;
    }

    /**
     * 删除HQL语句前的select
     * @param hql
     * @return
     */
    private static String removeSelect(String hql){
        int begin = hql.toLowerCase().indexOf("from");
        return hql.substring(begin);
    }

    /**
     * 删除order by 子句
     * @param hql
     * @return
     */
    private static String removeOrders(String hql){
        Pattern pattern = Pattern.compile("order\\s*by[\\w|\\W|\\s|\\S]*",Pattern.CASE_INSENSITIVE);
        Matcher matcher = pattern.matcher(hql);
        StringBuffer stringBuffer = new StringBuffer();
        if (matcher.find()){
            matcher.appendReplacement(stringBuffer,"");
        }
        matcher.appendTail(stringBuffer);
        return stringBuffer.toString();
    }


    public HibernateTemplate getHibernateTemplate() {
        return hibernateTemplate;
    }

    public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
        this.hibernateTemplate = hibernateTemplate;
    }

    public Class getEntityClass() {
        return entityClass;
    }

    public void setEntityClass(Class entityClass) {
        this.entityClass = entityClass;
    }
}
