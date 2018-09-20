package pers.cqb.mall.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pers.cqb.mall.entity.UserEntity;
import pers.cqb.mall.service.UserService;

@Service("userService")
@Transactional
public class UserServiceImpl extends BaseServiceImpl<UserEntity> implements UserService {

    @Override
    public UserEntity login(String login, String pass) {
        String hql = "from UserEntity u where u.login = :login and u.pass = :pass";
        return (UserEntity) getSession().createQuery(hql)
                .setString("login", login)
                .setString("pass", pass)
                .uniqueResult();
    }
}
