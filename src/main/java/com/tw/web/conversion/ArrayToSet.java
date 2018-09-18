package com.tw.web.conversion;

import com.tw.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.TypeDescriptor;
import org.springframework.core.convert.converter.ConditionalGenericConverter;
import org.springframework.core.convert.converter.GenericConverter;
import org.springframework.orm.hibernate5.HibernateTemplate;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

public class ArrayToSet implements ConditionalGenericConverter {

    @Autowired
    private HibernateTemplate hibernateTemplate;

    public HibernateTemplate getHibernateTemplate() {
        return hibernateTemplate;
    }

    /**
     * Set集合中的实体类类型
     */
    private Class entityClass;

    public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
        this.hibernateTemplate = hibernateTemplate;
    }

    @Override
    public Set<ConvertiblePair> getConvertibleTypes() {
       Set<ConvertiblePair> set = new HashSet<>();
       set.add(new ConvertiblePair(String[].class,Set<>.class));
       return set;
    }

    @Override
    public Object convert(Object source, TypeDescriptor sourceType, TypeDescriptor targetType) {
        Set objects = new HashSet<>();

        ParameterizedType type = (ParameterizedType) targetType.getType().getGenericSuperclass();
        Type[] types = type.getActualTypeArguments();
        entityClass = (Class) types[0];
        String[] ids = (String[]) source;
        for (int i=0;i<ids.length;i++){
            objects.add(hibernateTemplate.get(entityClass,ids[i]));
        }
        Iterator iterator=objects.iterator();
        while (iterator.hasNext()){
            System.out.println(iterator.next());
        }
        return objects;
    }

    @Override
    public boolean matches(TypeDescriptor sourceType, TypeDescriptor targetType) {
        System.out.println(targetType.getObjectType().getGenericSuperclass());
        System.out.println(sourceType);
        if(sourceType.getType().equals(String[].class)&&Set.class.isAssignableFrom(targetType.getType())){
            System.out.println("*************true**************");
            return true;
        }
        return false;
    }
}
