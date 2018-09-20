package pers.cqb.mall.service;

import pers.cqb.mall.entity.ForderEntity;

public interface ForderService extends BaseService<ForderEntity> {
    double cluTotal(ForderEntity forderEntity);
}
