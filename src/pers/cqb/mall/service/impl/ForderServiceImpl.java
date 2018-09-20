package pers.cqb.mall.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pers.cqb.mall.entity.ForderEntity;
import pers.cqb.mall.entity.SorderEntity;
import pers.cqb.mall.service.ForderService;

@Service("forderService")
@Transactional
public class ForderServiceImpl extends BaseServiceImpl<ForderEntity> implements ForderService {
    @Override
    public double cluTotal(ForderEntity forderEntity) {
        double total = 0;
        for(SorderEntity sorderEntity : forderEntity.getSorders()) {
            total += sorderEntity.getNumber()*sorderEntity.getPrice();
        }
        return total;
    }
}
