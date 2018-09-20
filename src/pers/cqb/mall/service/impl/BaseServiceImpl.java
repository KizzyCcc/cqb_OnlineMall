package pers.cqb.mall.service.impl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pers.cqb.mall.service.BaseService;

import javax.annotation.Resource;
import java.lang.reflect.ParameterizedType;
import java.util.List;

@Service("baseService")
@Lazy
@Transactional
public class BaseServiceImpl<T> implements BaseService<T> {

    private Class clazz;
    @Resource
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public BaseServiceImpl() {
        //拿到泛型的参数类型
        ParameterizedType type = (ParameterizedType) this.getClass().getGenericSuperclass();
        clazz = (Class)type.getActualTypeArguments()[0];
    }

    protected Session getSession(){
        return sessionFactory.getCurrentSession();
    }



    @Override
    public void save(T t) {
        getSession().save(t);
    }

    @Override
    public void update(T t) {
        getSession().update(t);
    }

    @Override
    public void delete(int id) {
        System.out.println(clazz.getSimpleName());//查看类名xxxEntity
        String hql = "delete " + clazz.getSimpleName() + " as c where c.id = :id";
        getSession().createQuery(hql).setInteger("id", id).executeUpdate();

    }

    @Override
    public T get(int id) {
        return (T) getSession().get(clazz, id);
    }

    @Override
    public List<T> query() {
        String hql = "from " + clazz.getSimpleName();
        return getSession().createQuery(hql).list();
    }
}
