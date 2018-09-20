package pers.cqb.mall.service;

import pers.cqb.mall.entity.CategoryEntity;

import java.util.List;

public interface CategoryService extends BaseService<CategoryEntity>{
    List<CategoryEntity> queryJoinAccount(String type, int page, int size);
    int getCount(String type);
    void deleteByIds(String ids);
    List<CategoryEntity> queryByHot(String hot);
}
