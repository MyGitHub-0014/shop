<%--
  Created by IntelliJ IDEA.
  User: yc950710
  Date: 2020/3/3
  Time: 12:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>确认订单</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/shopping-mall-index.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/zhonglin.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/zhongling2.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#phone").change(function () {
                var pattern = /^1[3-9][\d]{9}$/
                if(!pattern.test($(this).val())){
                    $("#phoneMsg").text("手机号格式不正确")
                    $("#phoneMsg").css("color","red")
                    $("#sub").attr("disabled",true)
                }else{
                    $("#sub").attr("disabled",false)
                }
            })
        })
    </script>
</head>

<body style="position:relative;">

<!--header-->
<!--logo search weweima-->
<%@ include file="goodsFast.jsp"%>

<!--内容开始-->
<form action="${pageContext.request.contextPath}/order/toPay.do" method="post">
    <div class="payment-interface w1200">
    <div class="pay-info">
        <div class="info-tit">
            <h3>选择收货地址</h3>
        </div>
        <ul class="pay-dz">
            <table>
                <tr><td>收货人：</td><td><input type="text" name="name" value="${sessionScope.user.userName}" size="120px" required></td></tr>
                <tr><td>联系方式：</td><td><input type="tel" name="phone" id="phone" value="${sessionScope.user.phone}" size="120px" required><span id="phoneMsg"></span></td></tr>
                <tr><td>收货地址：</td><td><input type="text" name="addr" value="${sessionScope.user.addr}" size="120px" required></td></tr>
            </table>
            <div style="clear:both;"></div>
        </ul>
    </div>
    <div class="pay-info">
        <div class="info-tit" style="border-bottom:0;">
            <h3>订单信息</h3>
        </div>
    </div>

    <div class="cart-con-info">
            <div class="cart-con-tit" style="margin:20px 0 5px;">
                <p class="p1" style="width:400px;">
                    <%--<input type="checkbox" value="" name="hobby"></input>--%>
                    <span>商家：爱尚微购自营店</span>
                </p>
                <p class="p3" style="width:145px;">规格</p>
                <p class="p4" style="width:130px;">数量</p>
                <p class="p5">单价（元）</p>
                <p class="p6" style="width:173px;">金额（元）</p>
            </div>
            <c:forEach var="cartItem" items="${cart.cartItems}">
                <div class="info-mid">
                    <div class="mid-tu f-l">
                        <a href="#"><img style="width: 80px;height: 80px" src="${pageContext.request.contextPath}/${cartItem.product.image}" /></a>
                    </div>
                    <div class="mid-font f-l" style="margin-right:40px; width: 233px">
                        <a href="#">${cartItem.product.pName}<br />${fn:substring(cartItem.product.pDesc,0 ,20 )}...</a>
                    </div>
                    <div class="mid-guige1 f-l" style="margin-right:40px;">
                        <p>颜色：蓝色</p>
                        <p>尺码：XL</p>
                    </div>
                    <div class="mid-sl f-l" style="margin-left: 52px">
                            ${cartItem.count}
                    </div>
                    <p class="mid-dj f-l" style="margin-left: 60px">¥ ${cartItem.product.shopPrice}</p>
                    <p class="mid-je f-l" style="margin:10px 120px 0px 0px;">¥ ${cartItem.subTotal}</p>

                    <div style="clear:both;"></div>
                </div>
            </c:forEach>
            <div class="info-tijiao">
                <p class="p1">实付款：<span>¥${cart.total}</span></p>
                <button class="btn" id="sub">提交订单</button>
            </div>
        </div>
</div>
</form>
<!--底部一块-->
<%@ include file="down.jsp"%>

<!--确认订单（新增地址）-->
<div class="confirmation-tanchuang" xgdz1="">
    <div class="tanchuang-bg"></div>
    <div class="tanchuang-con">
        <div class="tc-title">
            <h3>新增地址</h3>
            <a href="JavaScript:;" dz-guan=""><img src="${pageContext.request.contextPath}/images/close-select-city.gif" /></a>
            <div style="clear:both;"></div>
        </div>
        <ul class="tc-con2">
            <li class="tc-li1">
                <p class="l-p">所在地区<span>*</span></p>
                <div class="xl-dz">
                    <div class="dz-left f-l">
                        <p>新疆</p>
                        <ul>
                            <li class="current"><a href="#">新疆</a></li>
                            <li><a href="#">甘肃</a></li>
                            <li><a href="#">宁夏</a></li>
                            <li><a href="#">青海</a></li>
                            <li><a href="#">重庆</a></li>
                            <li><a href="#">长寿</a></li>
                        </ul>
                    </div>
                    <div class="dz-right f-l">
                        <p>乌鲁木齐</p>
                        <ul>
                            <li class="current"><a href="#">乌鲁木齐</a></li>
                            <li><a href="#">昌吉</a></li>
                            <li><a href="#">巴音</a></li>
                            <li><a href="#">郭楞</a></li>
                            <li><a href="#">伊犁</a></li>
                            <li><a href="#">阿克苏</a></li>
                            <li><a href="#">喀什</a></li>
                            <li><a href="#">哈密</a></li>
                            <li><a href="#">克拉玛依</a></li>
                            <li><a href="#">博尔塔拉</a></li>
                            <li><a href="#">吐鲁番</a></li>
                            <li><a href="#">和田</a></li>
                            <li><a href="#">石河子</a></li>
                            <li><a href="#">克孜勒苏</a></li>
                            <li><a href="#">阿拉尔</a></li>
                            <li><a href="#">五家渠</a></li>
                            <li><a href="#">图木舒克</a></li>
                            <li><a href="#">库尔勒</a></li>
                            <div style="clear:both;"></div>
                        </ul>
                    </div>
                    <div style="clear:both;"></div>
                </div>
                <div style="clear:both;"></div>
            </li>
            <li class="tc-li1">
                <p class="l-p">详细地址<span>*</span></p>
                <textarea class="textarea1" placeholder="请如实填写您的详细信息，如街道名称、门牌号、楼层号和房间号。"></textarea>
                <div style="clear:both;"></div>
            </li>
            <li class="tc-li1">
                <p class="l-p">邮政编码<span></span></p>
                <input type="text" />
                <div style="clear:both;"></div>
            </li>
            <li class="tc-li1">
                <p class="l-p">收货人姓名<span>*</span></p>
                <input type="text" />
                <div style="clear:both;"></div>
            </li>
            <li class="tc-li1">
                <p class="l-p">联系电话<span>*</span></p>
                <input type="text" />
                <div style="clear:both;"></div>
            </li>
        </ul>
        <button class="btn-pst2">保存</button>
    </div>
</div>

<!--修改地址-->
<div class="confirmation-tanchuang" xgdz2="">
    <div class="tanchuang-bg"></div>
    <div class="tanchuang-con">
        <div class="tc-title">
            <h3>新增地址</h3>
            <a href="JavaScript:;" dz-guan=""><img src="${pageContext.request.contextPath}/images/close-select-city.gif" /></a>
            <div style="clear:both;"></div>
        </div>
        <ul class="tc-con2">
            <li class="tc-li1">
                <p class="l-p">所在地区<span>*</span></p>
                <div class="xl-dz">
                    <div class="dz-left f-l">
                        <p>北京</p>
                        <ul>
                            <li class="current"><a href="#">新疆</a></li>
                            <li><a href="#">甘肃</a></li>
                            <li><a href="#">宁夏</a></li>
                            <li><a href="#">青海</a></li>
                            <li><a href="#">重庆</a></li>
                            <li><a href="#">长寿</a></li>
                        </ul>
                    </div>
                    <div class="dz-right f-l">
                        <p>天安门</p>
                        <ul>
                            <li class="current"><a href="#">乌鲁木齐</a></li>
                            <li><a href="#">昌吉</a></li>
                            <li><a href="#">巴音</a></li>
                            <li><a href="#">郭楞</a></li>
                            <li><a href="#">伊犁</a></li>
                            <li><a href="#">阿克苏</a></li>
                            <li><a href="#">喀什</a></li>
                            <li><a href="#">哈密</a></li>
                            <li><a href="#">克拉玛依</a></li>
                            <li><a href="#">博尔塔拉</a></li>
                            <li><a href="#">吐鲁番</a></li>
                            <li><a href="#">和田</a></li>
                            <li><a href="#">石河子</a></li>
                            <li><a href="#">克孜勒苏</a></li>
                            <li><a href="#">阿拉尔</a></li>
                            <li><a href="#">五家渠</a></li>
                            <li><a href="#">图木舒克</a></li>
                            <li><a href="#">库尔勒</a></li>
                            <div style="clear:both;"></div>
                        </ul>
                    </div>
                    <div style="clear:both;"></div>
                </div>
                <div style="clear:both;"></div>
            </li>
            <li class="tc-li1">
                <p class="l-p">详细地址<span>*</span></p>
                <textarea class="textarea1" placeholder="请如实填写您的详细信息，如街道名称、门牌号、楼层号和房间号。"></textarea>
                <div style="clear:both;"></div>
            </li>
            <li class="tc-li1">
                <p class="l-p">邮政编码<span></span></p>
                <input type="text" />
                <div style="clear:both;"></div>
            </li>
            <li class="tc-li1">
                <p class="l-p">收货人姓名<span>*</span></p>
                <input type="text" class="shxm" />
                <div style="clear:both;"></div>
            </li>
            <li class="tc-li1">
                <p class="l-p">联系电话<span>*</span></p>
                <input type="text" class="lxdh" />
                <div style="clear:both;"></div>
            </li>
        </ul>
        <button class="btn-pst2">保存</button>
    </div>
</div>
</body>
</html>

