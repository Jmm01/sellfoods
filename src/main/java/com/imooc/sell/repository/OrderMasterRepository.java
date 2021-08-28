package com.imooc.sell.repository;

import com.imooc.sell.dataobject.OrderDetail;
import com.imooc.sell.dataobject.OrderMaster;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface OrderMasterRepository extends JpaRepository<OrderMaster,String> {
   //按照买家的openID来查询，分页查询
    Page<OrderMaster> findByBuyerOpenid(String buyerOpenid, Pageable pageable);

}
