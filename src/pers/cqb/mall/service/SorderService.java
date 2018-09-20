package pers.cqb.mall.service;

import pers.cqb.mall.entity.ForderEntity;
import pers.cqb.mall.entity.ProductEntity;
import pers.cqb.mall.entity.SorderEntity;

import java.util.List;

public interface SorderService extends BaseService<SorderEntity> {
    ForderEntity addSorder(ForderEntity forderEntity, ProductEntity productEntity);
    SorderEntity productToSorder(ProductEntity productEntity);
    ForderEntity updateSoeder(ForderEntity forderEntity, SorderEntity sorderEntity);
    SorderEntity findByPid(int pid);
    void updateByNumber(int number, int pid);
    List<Object> querySale(int num);
}
