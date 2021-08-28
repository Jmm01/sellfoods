package com.imooc.sell.form;

import lombok.Data;

import javax.persistence.Id;
import java.math.BigDecimal;
import java.util.Date;

@Data
public class ProductForm {

    private String productId;
    //名称
    private String productName;
    //单价
    private BigDecimal productPrice;
    //库存
    private Integer productStock;
    //描述
    private String productDescription;
    //小图
    private String productIcon;

    //类目编号
    private Integer categoryType;
    //创建时间
    private Date creatTime;
}
