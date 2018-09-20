package pers.cqb.mall.entity;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "category", schema = "testdb", catalog = "")
public class CategoryEntity {
    private int id;
    private String type;
    private String hot;
    private AccountEntity accountEntity;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "type")
    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @Basic
    @Column(name = "hot")
    public String getHot() {
        return hot;
    }

    public void setHot(String hot) {
        this.hot = hot;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "account_id")
    public AccountEntity getAccountEntity() { return accountEntity; }

    public void setAccountEntity(AccountEntity accountEntity) {
        this.accountEntity = accountEntity;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        CategoryEntity that = (CategoryEntity) o;
        return id == that.id &&
                Objects.equals(type, that.type) &&
                Objects.equals(hot, that.hot);
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, type, hot);
    }
}
