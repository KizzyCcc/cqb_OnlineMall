package pers.cqb.mall.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pers.cqb.mall.entity.ForderEntity;
import pers.cqb.mall.entity.ProductEntity;
import pers.cqb.mall.entity.SorderEntity;
import pers.cqb.mall.service.SorderService;

import java.util.List;

@Service("sorderService")
@Transactional
public class SorderServiceImpl extends BaseServiceImpl<SorderEntity> implements SorderService {
    @Override
    public ForderEntity addSorder(ForderEntity forderEntity, ProductEntity productEntity) {
        boolean isHave = false;
        SorderEntity sorderEntity = productToSorder(productEntity);
        for(SorderEntity old : forderEntity.getSorders()) {
            if(old.getProductEntity().getId() == sorderEntity.getProductEntity().getId()) {
                old.setNumber(old.getNumber() + sorderEntity.getNumber());
                isHave = true;
                break;
            }
        }
        if(!isHave) {
            //sorderEntity.setForderEntity(forderEntity);
            forderEntity.getSorders().add(sorderEntity);
        }
        return forderEntity;
    }

    @Override
    public SorderEntity productToSorder(ProductEntity productEntity) {
        SorderEntity sorderEntity = new SorderEntity();
        sorderEntity.setName(productEntity.getName());
        sorderEntity.setNumber(1);
        sorderEntity.setPrice(productEntity.getPrice().doubleValue());
        sorderEntity.setProductEntity(productEntity);
        return sorderEntity;
    }

    @Override
    public ForderEntity updateSoeder(ForderEntity forderEntity, SorderEntity sorderEntity) {
        for(SorderEntity soeder : forderEntity.getSorders()) {
            if(soeder.getProductEntity().getId() == sorderEntity.getProductEntity().getId()) {
                soeder.setNumber(sorderEntity.getNumber());
            }
        }
        return forderEntity;
    }

    @Override
    public SorderEntity findByPid(int pid) {
        String hql = "from SorderEntity s where s.productEntity.id = :pid";
        return (SorderEntity) getSession()
                .createQuery(hql)
                .setInteger("pid", pid)
                .uniqueResult();
    }

    @Override
    public void updateByNumber(int number, int pid) {
        String hql = "update SorderEntity s set s.number = :number where s.productEntity.id = :pid";
        getSession().createQuery(hql)
                .setInteger("number", number)
                .setInteger("pid", pid)
                .executeUpdate();
    }

    @Override
    public List<Object> querySale(int num) {
        String hql = "select s.name, s.number from SorderEntity s ";
        return getSession().createQuery(hql)
                .setFirstResult(0)
                .setMaxResults(num)
                .list();
    }
}
