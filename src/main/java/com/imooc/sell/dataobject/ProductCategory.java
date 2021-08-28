package com.imooc.sell.dataobject;

import lombok.Data;
import lombok.Getter;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.Proxy;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.util.Date;


/**
 * 类目
 */

@Entity
@Proxy(lazy = false)
//动态更新时间
@DynamicUpdate
//包含get，set，tostring等方法
@Data
public class ProductCategory {

    //类目id,主键并且是自增的
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer categoryId;

    //类目名字
    private String categoryName;

    //类目编号
    private Integer categoryType;

    //创建时间
    private Date createTime;
    //更新时间
    private Date updateTime;

    public ProductCategory() { }

    public ProductCategory(String categoryName, Integer categoryType) {
        this.categoryName = categoryName;
        this.categoryType = categoryType;
    }
}
