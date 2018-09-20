package pers.cqb.mall.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pers.cqb.mall.entity.ProductEntity;
import pers.cqb.mall.service.ProductService;

import java.util.List;

@Service("productService")
@Transactional
public class ProductServiceImpl extends BaseServiceImpl<ProductEntity> implements ProductService {
    @Override
    public List<ProductEntity> queryJoinCategory(String name, int page, int size) {
        String hql = "from ProductEntity p left join fetch p.categoryEntity where p.name like :name";
        List<ProductEntity> list = getSession().createQuery(hql)
                .setString("name", "%" + name + "%")
                .setMaxResults(size)
                .setFirstResult((page-1)*size)
                .list();
        return list;
    }

    @Override
    public long getCount(String name) {
        String hql = "select count(*) from ProductEntity p where p.name like :name";
        int count = ((Long) getSession().createQuery(hql).setString("name", "%" + name + "%").uniqueResult()).intValue();
        return count;
    }

    @Override
    public void deleteByIds(String ids) {
        String hql = "delete from ProductEntity p where p.id in (" + ids + ")";
        getSession().createQuery(hql).executeUpdate();
    }

    @Override
    public List<ProductEntity> queryByCategoryId(int cid) {
        String hql = "from ProductEntity p join fetch p.categoryEntity " +
                "where p.open = true and p.commend = true and p.categoryEntity.id = :cid";
        List<ProductEntity> list = getSession().createQuery(hql).setInteger("cid", cid)
                .setFirstResult(0)
                .setMaxResults(4)
                .list();
        return list;
    }

    @Override
    public List<ProductEntity> queryByType(int cid) {
        String hql = "from ProductEntity p join fetch p.categoryEntity " +
                "where p.categoryEntity.id = :cid";
        List<ProductEntity> list = getSession().createQuery(hql).setInteger("cid", cid).list();
        return list;
    }

    @Override
    public List<ProductEntity> queryByName(String name) {
        String hql = "from ProductEntity p left join fetch p.categoryEntity where p.name like " +
                ":name";
        List<ProductEntity> list = getSession().createQuery(hql).setString("name", "%" + name + "%").list();
        return list;
    }


}
