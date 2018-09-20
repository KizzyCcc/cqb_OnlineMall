package pers.cqb.mall.action;

import com.opensymphony.xwork2.ModelDriven;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import pers.cqb.mall.entity.*;

import java.util.ArrayList;
import java.util.List;

@Controller("forderAction")
@Scope("prototype")
public class ForderAction extends BaseAction<ForderEntity> implements ModelDriven<ForderEntity> {
    private ForderEntity forderEntity;

    @Override
    public ForderEntity getModel() {
        forderEntity = (ForderEntity) session.get("forder");
        return forderEntity;
    }

    public String test() {
        if(session.get("forder") != null) {
            ForderEntity forderEntity = (ForderEntity) session.get("forder");
            for(SorderEntity sorderEntity : forderEntity.getSorders()) {
                System.out.println(sorderEntity.getNumber());
            }
        } else
            System.out.println("forder is null.");
        return "success";
    }

    public String save() {
        //forderEntity = (ForderEntity) session.get("forder");
        forderEntity.setUserEntity((UserEntity) session.get("user"));
        //forderEntity.setStatusEntity(statusService.get(1));
        forderService.save(forderEntity);

        for(SorderEntity sorderEntity : forderEntity.getSorders()) {
            if(sorderService.findByPid(sorderEntity.getProductEntity().getId()) == null) {
                sorderService.save(sorderEntity);
            } else {
                int pid = sorderEntity.getProductEntity().getId();
                int num = sorderEntity.getNumber() + sorderService.findByPid(pid).getNumber();
                sorderService.updateByNumber(num, pid);
            }
        }

        session.put("oldForder", forderEntity);
        session.put("forder", new ForderEntity());
        return "bank";
    }

    public String clear() {
        session.put("forder", new ForderEntity());
        return "clear";
    }
}
