package com.tw.web.conversion;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.TypeDescriptor;
import org.springframework.core.convert.converter.ConditionalGenericConverter;
import org.springframework.orm.hibernate5.HibernateTemplate;

import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

/**
 *  将String数组转换成Set集合
 *  String数组中元素为实体类的Id
 */
public class ArrayToSetConverter implements ConditionalGenericConverter {

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
       set.add(new ConvertiblePair(String[].class,Set.class));
       set.add(new ConvertiblePair(String.class,Set.class));
       return set;
    }

    @Override
    public Object convert(Object source, TypeDescriptor sourceType, TypeDescriptor targetType) {
        //System.out.println("***************start convert*****************");
        Set objects = new HashSet<>();

        /*
            getElementTypeDescriptor()：如果此类型是数组，则返回数组的组件类型。如果此类型是流，则返回流的组件类型。
            如果此类型是一个集合，并且它是参数化的，则返回集合的元素类型。如果集合没有参数化，返回null，表示没有声明元素类型。
         */
        entityClass = targetType.getElementTypeDescriptor().getType();

        /*
            判断source是字符串还是字符串数组
         */
        String[] ids = null;
        if (sourceType.getType().equals(String.class)){
            ids = new String[]{(String) source};
        }else {
            ids = (String[]) source;
        }
        for (int i=0;i<ids.length;i++){
            objects.add(hibernateTemplate.get(entityClass,ids[i]));
        }
//        Iterator iterator=objects.iterator();
//        while (iterator.hasNext()){
//            System.out.println(iterator.next());
//        }
        return objects;
    }

    @Override
    public boolean matches(TypeDescriptor sourceType, TypeDescriptor targetType) {
        if(sourceType.getType().equals(String[].class)||sourceType.getType().equals(String.class)&&Set.class.isAssignableFrom(targetType.getType())){
            return true;
        }
        return false;
    }
}
