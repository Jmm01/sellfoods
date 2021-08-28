package com.imooc.sell.constant;

//redis常量
public interface RedisConstant {

    //设置token存入时的前缀
    String TOKEN_PREFIX = "token_%s";

    //设置过期时间为2小时
    Integer EXPIRE = 7200;
}
