package pers.cqb.mall.service;

import java.util.List;

public interface BaseService<T> {
    void save(T t);
    void update(T t);
    void delete(int id);
    T get(int id);
    List<T> query();
}
