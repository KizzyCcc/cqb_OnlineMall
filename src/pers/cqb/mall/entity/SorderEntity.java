package pers.cqb.mall.entity;

import javax.persistence.*;
import java.math.BigDecimal;

@Entity
@Table(name = "sorder", schema = "testdb", catalog = "")
public class SorderEntity {
    private int id;
    private int number;
    private String name;
    private double price;
    private ProductEntity productEntity;
    //private ForderEntity forderEntity;

    public SorderEntity() {}
    public SorderEntity(String name, int number) {
        this.name = name;
        this.number = number;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "number")
    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    @Basic
    @Column(name = "name")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "price")
    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "pid")
    public ProductEntity getProductEntity() {
        return productEntity;
    }

    public void setProductEntity(ProductEntity productEntity) {
        this.productEntity = productEntity;
    }

//    @ManyToOne(fetch = FetchType.LAZY)
//    @JoinColumn(name = "fid")
//    public ForderEntity getForderEntity() {
//        return forderEntity;
//    }
//
//    public void setForderEntity(ForderEntity forderEntity) {
//        this.forderEntity = forderEntity;
//    }
}
