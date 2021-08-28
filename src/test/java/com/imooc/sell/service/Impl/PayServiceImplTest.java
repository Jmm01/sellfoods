package com.imooc.sell.service.Impl;

import com.imooc.sell.dto.OrderDTO;
import com.imooc.sell.service.OrderService;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import static org.junit.jupiter.api.Assertions.*;

@RunWith(SpringRunner.class)
@SpringBootTest
@Slf4j
public class PayServiceImplTest {
    @Autowired
    private PayServiceImpl payService;

    @Autowired
    private OrderService orderService;

    @Test
    public void create() {
        OrderDTO orderDTO = orderService.findById("1628748982478222792");
        payService.create(orderDTO);
    }
    @Test
    public void refund(){
        OrderDTO orderDTO = orderService.findById("1628748982478222792");
        payService.refund(orderDTO);
    }
}