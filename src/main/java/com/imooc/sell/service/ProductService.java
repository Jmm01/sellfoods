package com.imooc.sell.service;

import com.imooc.sell.dataobject.ProductInfo;
import com.imooc.sell.dto.CartDTO;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;

import java.util.List;

//商品
public interface ProductService  {

    ProductInfo getById(String productId);

    //查询所有在架商品
    List<ProductInfo> findUpAll();
    //分页查询
    Page<ProductInfo> findAll(PageRequest pageRequest);
    //保存商品信息
    ProductInfo save(ProductInfo productInfo);
    //加库存,前端传进来只有id和数量的CartDTO对象列表
    void increaseStock(List<CartDTO> cartDTOList);
    //减库存
    void decreaseStock(List<CartDTO> cartDTOList);
    //上架
    ProductInfo onSale(String productId);
    //下架
    ProductInfo offSale(String productId);

}
