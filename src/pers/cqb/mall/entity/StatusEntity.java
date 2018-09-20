package pers.cqb.mall.entity;

import javax.persistence.*;
import java.util.*;

@Entity
@Table(name = "status", schema = "testdb", catalog = "")
public class StatusEntity {
    private int id;
    private String status;
    //private List<ForderEntity> forders = new ArrayList<>();

    public StatusEntity(){}
    public StatusEntity(String status) {
        this.status = status;
    }

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "status")
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

//    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "statusEntity")
//    public List<ForderEntity> getForders() {
//        return forders;
//    }
//
//    public void setForders(List<ForderEntity> forders) {
//        this.forders = forders;
//    }
}
