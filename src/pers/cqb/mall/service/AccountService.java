package pers.cqb.mall.service;
import pers.cqb.mall.entity.AccountEntity;

public interface AccountService extends BaseService<AccountEntity> {
    //public void delectByIds(String ids);
    AccountEntity login(String login, String pass);
}
