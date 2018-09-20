package pers.cqb.mall.action;

import com.opensymphony.xwork2.ModelDriven;
import net.sf.json.JSONObject;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import pers.cqb.mall.entity.ProductEntity;

import java.io.ByteArrayInputStream;
import java.util.HashMap;
import java.util.List;

@Controller("productAction")
@Scope("prototype")
public class ProductAction extends BaseAction<ProductEntity> implements ModelDriven<ProductEntity> {
    private ProductEntity productEntity;

    @Override
    public ProductEntity getModel() {
        productEntity = new ProductEntity();
        return productEntity;
    }
    /*********************功能测试***********************/
    public String test() {
        return "Io";
    }

    /*********************项目代码***********************/
    public String queryJoinCategory() {
        pageMap = new HashMap<>();
        //System.out.println(productEntity.getName());
        List<ProductEntity> list = productService.queryJoinCategory(productEntity.getName(), page, rows);
        pageMap.put("rows", list);
        long count = productService.getCount(productEntity.getName());
        pageMap.put("total", count);
        JSONObject json = JSONObject.fromObject(pageMap);
        //String result = json.toString();
        //System.out.println(result);
        return "jsonMap";
    }

    public String deleteByIds() {
        //System.out.println(ids);
        productService.deleteByIds(ids);
        inputStream = new ByteArrayInputStream("true".getBytes());
        return "stream";
    }

    public void save() {
        //System.out.println(productEntity.getCategoryEntity().getId()+"***************");
        String pic = fileUpload.uploadFile(fileImage);
        productEntity.setPic(pic);
        System.out.println(pic);
        productService.save(productEntity);
    }

    public void update() {
        //System.out.println(productEntity.getName()+"***************");
        String pic = fileUpload.uploadFile(fileImage);
        productEntity.setPic(pic);
        productService.update(productEntity);
        //System.out.println("*****结束*****");
    }

    public String queryByType() {
        List<ProductEntity> list = productService.queryByType(productEntity.getCategoryEntity().getId());
        session.put("typeList", list);
        return "type";
    }

    public String queryByName() {
        List<ProductEntity> list = productService.queryByName(productEntity.getName());
        session.put("searchList", list);
        return "search";
    }
}
