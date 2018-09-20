package pers.cqb.mall.service;

import pers.cqb.mall.entity.UserEntity;

import javax.jws.soap.SOAPBinding;

public interface UserService extends BaseService<UserEntity> {
    UserEntity login(String login, String pass);
}
