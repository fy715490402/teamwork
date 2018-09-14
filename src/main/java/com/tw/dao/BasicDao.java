package com.tw.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.transaction.annotation.Transactional;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;

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

    //    以下实现分页



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
