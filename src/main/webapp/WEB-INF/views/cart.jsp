<%--
  Created by IntelliJ IDEA.
  User: yc950710
  Date: 2020/3/2
  Time: 13:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>购物车</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/shopping-mall-index.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/zhonglin.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/zhongling2.js"></script>
    <%--去除number箭头--%>
    <style>
        input::-webkit-outer-spin-button,
        input::-webkit-inner-spin-button {
            -webkit-appearance: none;
        }
        input[type="number"]{
            -moz-appearance: textfield;
        }
    </style>
    <script type="text/javascript">
        $(function () {
            // 修改商品数量
            $("[name='count']").change(function () {
                if($(this).val()!=""){
                    if($(this).val()<0){
                        $(this).val(1)
                    }
                    if($(this).val()>10){
                        $(this).val(10)
                    }
                    var count = $(this).val()
                    var pid = $(this).attr("id")
                    changeCount(count,pid)
                    var shopPrice = Number($("#"+pid+"dj").find("span").text());
                    $("#"+pid+"je").text(shopPrice*count)
                }
            })
            // 修改加减按钮
            $("[name='changeCountBtn']").click(function () {
                var count = $(this).parent().find("[name='count']").val()
                if(count>10){
                    $(this).parent().find("[name='count']").val(10)
                }
                var pid = $(this).parent().find("[name='count']").attr("id")
                //修改商品数量
                changeCount(count,pid);
            })
            // 删除购物项
            $("[name='delCartItem']").click(function () {
                var pid = $(this).attr("id")
                if(confirm("确认删除该商品？")){
                    $.ajax({
                        url:"${pageContext.request.contextPath}/cart/delCartItem.do",
                        data:{
                            pid:pid,
                        },
                        success:function (data) {
                            if(data!=""){
                                $("#total").text(data)
                                $("#div"+pid).remove()
                                $("#num").text("${fn:length(cart.cartItems)-1}")
                            }
                        }
                    })
                }
            })
            // 清空购物车
            $("#clear").click(function () {
                if(confirm("确认清空？")){
                    $.ajax({
                        url:"${pageContext.request.contextPath}/cart/clear.do",
                        success:function (data) {
                            if(data!=""){
                                $("#all").remove()
                                $("#total").text("0.0")
                                $("#num").text("0")
                                $("#settlement").remove()
                                $("#msg").text("购物车空空如也，快去添加商品吧").css("color","red")
                            }
                        }
                    })
                }
            })
            if("${sessionScope.cart.cartItems.size()}"==0){
                $("#msg").text("购物车空空如也，快去添加商品吧").css("color","red")
                $("#settlement").remove()
                return false
            }
        })

        //更改总金额
        function changeCount(count,pid) {
            $.ajax({
                url:"${pageContext.request.contextPath}/cart/changeCount.do",
                data:{
                    count:count,
                    pid:pid
                },
                success:function (data) {
                    if (data!=""){
                        $("#total").text(data)
                    }
                }
            })
        }

        //判断是否已登陆
        function sub() {
            if("${user}"!=""){
                //已登录
                window.location.href="${pageContext.request.contextPath}/order/toConfirmOrder.do"
            }else{
                //未登录
                window.location.href="${pageContext.request.contextPath}/user/toLogin.do"
                return false
            }
        }
    </script>
</head>

<body style="position:relative;">

<!--header-->
<!--logo search weweima-->
<%@ include file="goodsFast.jsp"%>


<!--内容开始-->
<div class="cart-content w1200">
    <ul class="cart-tit-nav">
        <li class="current"><a href="#">全部商品   <span id="num">${fn:length(cart.cartItems)}</span></a></li>
        <div style="clear:both;"></div>
    </ul>
    <div class="cart-con-tit">
        <p class="p1">
            <%--<input type="checkbox" value="" name="hobby"></input>
            <span>全选</span>--%>
        </p>
        <p class="p2">商品信息</p>
        <p class="p3">规格</p>
        <p class="p4">数量</p>
        <p class="p5">单价（元）</p>
        <p class="p6">金额（元）</p>
        <p class="p7">操作</p>
    </div>

    <span id="msg">
        <span id="all">
            <c:forEach var="cartItem" items="${cart.cartItems}">
                <div class="cart-con-info" id="div${cartItem.product.pid}">
                    <div class="info-top">
                        <%--<input type="checkbox" value="" name="hobby"></input>--%>
                        <span>商家：爱尚微购自营店</span>
                    </div>
                    <div class="info-mid">
                        <%--<input type="checkbox" value="" name="hobby" class="mid-ipt f-l"></input>--%>
                        <div class="mid-tu f-l">
                            <a href="#"><img style="width: 80px;height: 80px" src="${pageContext.request.contextPath}/${cartItem.product.image}" /></a>
                        </div>
                        <div class="mid-font f-l" style="width: 233px">
                            <a href="#">${cartItem.product.pName}<br />${fn:substring(cartItem.product.pDesc,0 ,20 )}...</a>
                            <span>满赠</span>
                        </div>
                        <div class="mid-guige f-l">
                            <p>颜色：蓝色</p>
                            <p>尺码：XL</p>
                            <a href="JavaScript:;" class="xg" xg="xg1">修改</a>
                            <div class="guige-xiugai" xg-g="xg1">
                                <div class="xg-left f-l">
                                    <dl>
                                        <dt>颜  色</dt>
                                        <dd>
                                            <a href="JavaScript:;" class="current">黑色</a>
                                            <a href="JavaScript:;">白色</a>
                                        </dd>
                                        <div style="clear:both;"></div>
                                    </dl>
                                    <dl>
                                        <dt>尺  码</dt>
                                        <dd>
                                            <a href="JavaScript:;" class="current">M</a>
                                            <a href="JavaScript:;">L</a>
                                            <a href="JavaScript:;">XL</a>
                                        </dd>
                                        <div style="clear:both;"></div>
                                    </dl>
                                    <a href="JavaScript:;" class="qd">确定</a>
                                    <a href="JavaScript:;" class="qx" qx="xg1">取消</a>
                                </div>
                                <div class="xg-right f-l">
                                    <a href="#"><img src="${pageContext.request.contextPath}/images/dai2.gif" /></a>
                                </div>
                                <div style="clear:both;"></div>
                            </div>
                        </div>
                        <div class="mid-sl f-l">
                            <a href="JavaScript:;" name="changeCountBtn" class="sl-left">-</a>
                            <input type="number" id="${cartItem.product.pid}" name="count" value="${cartItem.count}" />
                            <a href="JavaScript:;" name="changeCountBtn" class="sl-right">+</a>
                        </div>
                        <p class="mid-dj f-l" id="${cartItem.product.pid}dj">¥ <span>${cartItem.product.shopPrice}</span></p>
                        <p class="mid-je f-l" id="${cartItem.product.pid}je">¥ <span>${cartItem.subTotal}</span></p>
                        <div class="mid-chaozuo f-l">
                            <a href="#">移入收藏夹</a>
                            <a href="javaScript:;" name="delCartItem" id="${cartItem.product.pid}">删除</a>
                        </div>
                        <div style="clear:both;"></div>
                    </div>
                </div>
            </c:forEach>
        </span>
    </span>

    <div class="cart-con-footer">
        <div class="quanxuan f-l">
            <%--<input type="checkbox" value="" name="hobby"></input>
            <span>全选</span>--%>
            <a href="javaScript:;" id="clear">清空购物车</a>
            <a href="#">加入收藏夹</a>
            <p>（此处始终在屏幕下方）</p>
        </div>
        <div class="jiesuan f-r" id="settlement">
            <div class="jshj f-l">
                <p>合计（不含运费）</p>
                <p class="jshj-p2">
                    ￥：<span id="total">${cart.total}</span>
                </p>
            </div>
            <a href="${pageContext.request.contextPath}/order/toConfirmOrder.do" class="js-a1 f-l" onclick="return sub()">结算</a>
            <div style="clear:both;"></div>
        </div>
        <div style="clear:both;"></div>
    </div>
</div>

<!--底部一块-->
<%@ include file="down.jsp"%>
</body>
</html>

