package com.imooc.sell.VO;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

import java.io.Serializable;
import java.util.List;

//商品，包含类目
@Data
public class ProductVo implements Serializable {
    private static final long serialVersionUID = -7918339823760897287L;

    //categoryname方便后端区分与商品name，加了这个注解可以使返回前端是name
    @JsonProperty("name")
    private String categoryName;

    @JsonProperty("type")
    private Integer categoryType;

    @JsonProperty("foods")
    private List<ProductInfoVo> productInfoVoList;


}
