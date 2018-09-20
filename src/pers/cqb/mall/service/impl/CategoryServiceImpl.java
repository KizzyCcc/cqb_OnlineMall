package pers.cqb.mall.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pers.cqb.mall.entity.CategoryEntity;
import pers.cqb.mall.service.CategoryService;
import java.util.List;

@Service("categoryService")
@Transactional
public class CategoryServiceImpl extends BaseServiceImpl<CategoryEntity> implements CategoryService {

    @Override
    public List<CategoryEntity> queryJoinAccount(String type, int page, int size) {
        String hql = "from CategoryEntity c left join fetch c.accountEntity where c.type like :type";
        List<CategoryEntity> list = getSession().createQuery(hql)
                .setString("type", "%" + type + "%")
                .setFirstResult((page-1) * size)
                .setMaxResults(size)
                .list();
        return list;
    }

    @Override
    public int getCount(String type) {
        String hql = "select count(*) from CategoryEntity  c where c.type like :type";
        int count = ((Long) getSession().createQuery(hql).setString("type", "%" + type + "%").uniqueResult()).intValue();
        return count;
    }

    @Override
    public void deleteByIds(String ids) {
        String hql = "delete from CategoryEntity c where  c.id in (" + ids + ")";
        getSession().createQuery(hql).executeUpdate();
    }

    @Override
    public List<CategoryEntity> queryByHot(String hot) {
        String hql = "from CategoryEntity c left join fetch c.accountEntity where c.hot = :hot";

        List<CategoryEntity> list = getSession().createQuery(hql).setString("hot", hot).list();
        return list;
    }
}
