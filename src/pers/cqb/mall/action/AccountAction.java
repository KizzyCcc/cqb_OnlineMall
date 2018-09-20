package pers.cqb.mall.action;

import com.opensymphony.xwork2.ModelDriven;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import pers.cqb.mall.entity.AccountEntity;

@Controller("accountAction")
@Scope("prototype")
public class AccountAction extends BaseAction<AccountEntity> implements ModelDriven<AccountEntity> {
    private AccountEntity accountEntity;

    @Override
    public AccountEntity getModel() {
        accountEntity = new AccountEntity();
        return accountEntity;
    }

    public String query() {
        jsonList = accountService.query();
        return "jsonList";
    }

    public String login() {
        accountEntity = accountService.login(accountEntity.getLogin(), accountEntity.getPass());
        if(accountEntity == null) {
            session.put("account_error", "用户名或密码错误");
            return "login";
        } else {
            session.put("account", accountEntity);
            session.put("account_error", "");
            return "welcome";
        }
    }

    public String cancel() {
        session.remove("account");
        return "login";
    }
}
