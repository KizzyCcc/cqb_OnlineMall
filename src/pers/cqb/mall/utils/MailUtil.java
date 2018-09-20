package pers.cqb.mall.utils;

import pers.cqb.mall.entity.ForderEntity;
import pers.cqb.mall.entity.UserEntity;

public interface MailUtil {
    void send_mail(UserEntity user, ForderEntity forder) throws Exception;
}
