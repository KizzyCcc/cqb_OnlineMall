package pers.cqb.mall.service;

import pers.cqb.mall.entity.ProductEntity;

import java.util.List;

public interface ProductService extends BaseService<ProductEntity> {
    List<ProductEntity> queryJoinCategory(String name, int page, int size);
    long getCount(String name);
    void deleteByIds(String ids);
    List<ProductEntity> queryByCategoryId(int id);
    List<ProductEntity> queryByType(int cid);
    List<ProductEntity> queryByName(String name);
}
