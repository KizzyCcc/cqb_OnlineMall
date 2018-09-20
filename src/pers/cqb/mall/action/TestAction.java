package pers.cqb.mall.action;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import pers.cqb.mall.entity.UserEntity;

@Controller("testAction")
@Scope("prototype")
public class TestAction extends BaseAction<UserEntity> {
    public String test1(){
        return "success";
    }
    public String test2(){
        System.out.println("test2");
        return "test2";
    }
}
