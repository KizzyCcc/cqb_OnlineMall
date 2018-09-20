package pers.cqb.mall.action;

import com.opensymphony.xwork2.ActionSupport;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import pers.cqb.mall.entity.ForderEntity;

@Controller("sendAction")
@Scope("prototype")
public class SendAction extends BaseAction {
    public String ulogin() {
        return "ulogin";
    }

    @Override
    public String execute() throws Exception {
        return "send";
    }

    public String user_send() {
        return "send";
    }

}
