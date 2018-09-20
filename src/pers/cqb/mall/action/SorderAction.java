package pers.cqb.mall.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;
import net.sf.json.JSONArray;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import pers.cqb.mall.entity.ForderEntity;
import pers.cqb.mall.entity.ProductEntity;
import pers.cqb.mall.entity.SorderEntity;

import java.io.ByteArrayInputStream;
import java.util.ArrayList;
import java.util.List;

@Controller("sorderAction")
@Scope("prototype")
public class SorderAction extends BaseAction<SorderAction> {
    private ProductEntity productEntity;
    private SorderEntity sorderEntity;

    public void setProductEntity(ProductEntity productEntity) {
        this.productEntity = productEntity;
    }

    public ProductEntity getProductEntity() {
        return productEntity;
    }

    public SorderEntity getSorderEntity() {
        return sorderEntity;
    }

    public void setSorderEntity(SorderEntity sorderEntity) {
        this.sorderEntity = sorderEntity;
    }

    public String addSorder() {
        ProductEntity product = productService.get(productEntity.getId());
        if(session.get("forder") == null) {
            //创建新的购物车，存储到session中
            session.put("forder", new ForderEntity(new ArrayList<>()));
        }
        ForderEntity forderEntity = (ForderEntity) session.get("forder");
        forderEntity = sorderService.addSorder(forderEntity, product);
        forderEntity.setTotal(forderService.cluTotal(forderEntity));
        System.out.println(forderService.cluTotal(forderEntity));
        session.put("forder", forderEntity);
        return "success";
    }

    public String updateSorder() {
        ForderEntity forderEntity = (ForderEntity) session.get("forder");
        forderEntity = sorderService.updateSoeder(forderEntity, sorderEntity);
        forderEntity.setTotal(forderService.cluTotal(forderEntity));
        session.put("forder", forderEntity);
        inputStream = new ByteArrayInputStream(("" + forderEntity.getTotal()).getBytes());
        return "stream";
    }

    public String querySale() {
        List<Object> jsonList = new ArrayList<>();
        jsonList = sorderService.querySale(sorderEntity.getNumber());
//        JSONArray json = JSONArray.fromObject(list);
//        System.out.println(json.toString());
        ActionContext.getContext().getValueStack().push(jsonList);
        return "jsonList";
    }


}
