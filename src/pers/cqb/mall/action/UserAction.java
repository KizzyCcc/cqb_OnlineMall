package pers.cqb.mall.action;

import com.opensymphony.xwork2.ModelDriven;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import pers.cqb.mall.entity.CategoryEntity;
import pers.cqb.mall.entity.ForderEntity;
import pers.cqb.mall.entity.UserEntity;
import pers.cqb.mall.utils.Impl.MailUtilImpl;
import pers.cqb.mall.utils.MailUtil;

import java.io.ByteArrayInputStream;
import java.util.List;

@Controller("userAction")
@Scope("prototype")
public class UserAction extends BaseAction<UserEntity> implements ModelDriven<UserEntity> {
    private UserEntity userEntity;
    private String goURL;
    private double money;
    private double bal;
    private double total;

    public double getBal() {
        return bal;
    }

    public void setBal(double bal) {
        this.bal = bal;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public double getMoney() {
        return money;
    }

    public void setMoney(double money) {
        this.money = money;
    }

    public void setGoURL(String goURL) {
        this.goURL = goURL;
    }

    @Override
    public UserEntity getModel() {
        userEntity = new UserEntity();
        return userEntity;
    }

    public String getGoURL() {
        return goURL;
    }

    public String login() {
        userEntity = userService.login(userEntity.getLogin(), userEntity.getPass());
        if(userEntity != null) {
            session.put("user", userEntity);

            if(session.get("goURL") == null) {
                System.out.println("goURL is null");
                return "index";
            }
            else {
                goURL = "" + session.get("goURL");
                System.out.println(goURL);
                return "goURL";
            }
        }
        else {
            session.put("error", "用户名或密码错误");
            return "login";
        }
    }
    public String update() {
        if(money != 0)
            System.out.println(money);
        else
            System.out.println("money is null.");
        UserEntity user = (UserEntity) session.get("user");
        user.setBalance(user.getBalance() + money);
        userService.update(user);
//        userService.update(userEntity);
        session.put("pay_error", " ");
        return "update";
    }

    public String save() {
        userService.save(userEntity);
        session.put("user", userEntity);
        return "save";
    }

    public String pay() throws Exception {
        if(total < bal) {
            UserEntity user = (UserEntity) session.get("user");
            user.setBalance(user.getBalance() - total);
            userService.update(user);
            ForderEntity forder = (ForderEntity) session.get("oldForder");
            forder.setStatusEntity(statusService.get(1));
            System.out.println(forder.getId()+"   "+forder.getStatusEntity().getId());
            forderService.update(forder);
            MailUtil send_mail = new MailUtilImpl();
            send_mail.send_mail(user, forder);
            return "pay_success";
        } else {
            session.put("pay_error", "余额不足，请先充值");
            return "pay_error";
        }
    }

    public String cancel() {
        if(session.get("forder") != null)
            session.remove("forder");
        if(session.get("oldForder") != null)
            session.remove("oldForder");
        session.remove("user");
        return "cancel";
    }

    public String checkLogin() {
        List<UserEntity> list = userService.query();
        System.out.println(userEntity.getLogin());
        for(UserEntity user : list) {
            if(user.getLogin().equals(userEntity.getLogin())) {
                inputStream = new ByteArrayInputStream("0".getBytes());
                return "stream";
            }
        }
        inputStream = new ByteArrayInputStream("1".getBytes());
        return "stream";
    }

    public String checkPhone() {
        List<UserEntity> list = userService.query();
        for (UserEntity user : list) {
            if (user.getPhone().equals(userEntity.getPhone())) {
                inputStream = new ByteArrayInputStream("0".getBytes());
                return "stream";
            }
        }
        inputStream = new ByteArrayInputStream("1".getBytes());
        return "stream";
    }

    public String checkMail() {
        List<UserEntity> list = userService.query();
        for (UserEntity user : list) {
            if (user.getEmail().equals(userEntity.getEmail())) {
                inputStream = new ByteArrayInputStream("0".getBytes());
                return "stream";
            }
        }
        inputStream = new ByteArrayInputStream("1".getBytes());
        return "stream";
    }
}
