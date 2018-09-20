package pers.cqb.mall.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pers.cqb.mall.entity.AccountEntity;
import pers.cqb.mall.service.AccountService;

@Service("accountService")
@Transactional
public class AccountServiceImpl extends BaseServiceImpl<AccountEntity> implements AccountService {

    @Override
    public AccountEntity login(String login, String pass) {
        String hql = "from AccountEntity a where  a.login = :login and a.pass = :pass";
        return (AccountEntity) getSession().createQuery(hql)
                .setString("login", login)
                .setString("pass", pass)
                .uniqueResult();
    }
}
