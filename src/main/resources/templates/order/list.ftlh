<html>
    <#include "../common/header.ftlh">
<body>
    <div id="wrapper" class="toggled">
<#--        边栏-->
        <#include "../common/nav.ftlh">
<#--        主要内容-->
        <div id="page-content-wrapper">
            <div class="container-fluid">
                <div class="row clearfix">
                    <div class="col-md-12 column">
                        <table class="table table-bordered table-condensed">
                            <thead>
                            <tr>
                                <th>订单id</th>
                                <th>姓名</th>
                                <th>手机号</th>
                                <th>地址</th>
                                <th>金额</th>
                                <th>订单状态</th>
                                <th>支付状态</th>
                                <th>创建时间</th>
                                <th colspan="2">操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <#list orderDTOPage.content as orderDTO>
                                <tr>
                                    <td>${orderDTO.orderId}</td>
                                    <td>${orderDTO.buyerName}</td>
                                    <td>${orderDTO.buyerPhone}</td>
                                    <td>${orderDTO.buyerAddress}</td>
                                    <td>${orderDTO.orderAmount}</td>
                                    <td>${orderDTO.orderStatusEnum.getMessage()}</td>
                                    <td>${orderDTO.payStatusEnum.getMessage()}</td>
                                    <td>${orderDTO.creatTime}</td>
                                    <td>${orderDTO.orderId}</td>
                                    <td><a href="http://localhost:8080/sell/seller/order/detail?orderId=${orderDTO.orderId}">详情</a></td>
                                    <td>
                                        <#if orderDTO.getOrderStatusEnum().getMessage() == "新订单">
                                            <a href="http://localhost:8080/sell/seller/order/cancel?orderId=${orderDTO.orderId}">取消</a>
                                        </#if>
                                    </td>
                                </tr>
                            </#list>
                            </tbody>
                        </table>

                    </div>
                    <#--            分页-->
                    <div class="col-md-12 column">
                        <ul class="pagination pull-right">
                            <#--                    上一页的设置和链接-->
                            <#if currentPage lte 1>
                                <li class="disabled"><a href="#">上一页</a></li>
                            <#else>
                                <li><a href="http://localhost:8080/sell/seller/order/list?page=${currentPage-1}&size=${size}">上一页</a></li>
                            </#if>

                            <#--                    根据数据总条数来实现分页页数-->
                            <#list 1..orderDTOPage.getTotalPages() as index>
                                <#if currentPage == index>
                                    <li class="disabled"><a href="#">${index}</a></li>
                                <#else>
                                    <li><a href="http://localhost:8080/sell/seller/order/list?page=${index}&size=${size}">${index}</a></li>
                                </#if>
                            </#list>
                            <#--                    下一页的设置和链接-->
                            <#if currentPage gte orderDTOPage.getTotalPages()>
                                <li class="disabled"><a href="#">下一页</a></li>
                            <#else>
                                <li><a href="http://localhost:8080/sell/seller/order/list?page=${currentPage+1}&size=${size}">下一页</a></li>
                            </#if>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

<#--    弹窗-->

    <div class="modal fade" id="myModal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title" id="myModalLabel">
                        提醒
                    </h4>
                </div>
                <div class="modal-body">
                    你有新的订单
                </div>
                <div class="modal-footer">
<#--                    点击关闭后音乐暂停-->
                    <button onclick="javascript:document.getElementById('notice').pause()" type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button onclick="location.reload()" type="button" class="btn btn-primary">查看新的订单</button>
                </div>
            </div>
        </div>
    </div>
<#--播放音乐,loop是循环播放 -->
<audio id="notice" loop="loop">
    <source src="/sell/mp3/song.mp3"  type="audio/mpeg"/>
    <video autoplay muted></video>
</audio>
<script src="https://cdn.bootcdn.net/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/3.3.5/js/bootstrap.min.js"></script>
<#--    websocket消息推送-->
<script>
    var websocket = null;
    if('WebSocket' in window){
        websocket = new WebSocket('ws://sellfoods.natapp1.cc/sell/webSocket');
    }else{
        alert('该浏览器不支持websocket');
    }

    websocket.onopen = function (event){
        console.log('建立连接');
    }
    websocket.onclose = function (event){
        console.log('连接关闭');
    }
    websocket.onmessage = function (event) {
        console.log('收到消息：' + event.data)
        //收到消息后，可以弹窗提醒，播放音乐...
        $('#myModal').modal('show');
        document.getElementById('notice').play();

    }
    websocket.onerror = function () {
        alert('websocket通信发生错误！');
    }
    websocket.onbeforeunload = function () {
        websocket.close();
    }
</script>

</body>
</html>