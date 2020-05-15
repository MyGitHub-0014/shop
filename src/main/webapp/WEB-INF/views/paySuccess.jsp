
<%--
  Created by IntelliJ IDEA.
  User: yc950710
  Date: 2020/3/3
  Time: 16:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>支付成功</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/shopping-mall-index.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/zhonglin.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/zhongling2.js"></script>
</head>

<body style="position:relative;">

<!--header-->
<!--logo search weweima-->
<%@ include file="goodsFast.jsp"%>

<!--内容开始-->
<div class="payment w1200">
    <div class="payment-hd">
        <h3 class="success">支付成功</h3>
    </div>
    <div class="payment-bd">

        <c:forEach var="orderItem" items="${orderExt.orderItemExts}">
            <dl class="dl-hd">
                <dt><a href="#"><img style="width: 123px;height: 122px" src="${pageContext.request.contextPath}/${orderItem.product.image}" /></a></dt>
                <dd>
                    <h3><a href="#">${orderItem.product.pName}</a></h3>
                    <P>${fn:substring(orderItem.product.pDesc, 0,30 )}...</P>
                    <p style="color:red;"> 数量：${orderItem.count} 单价：${orderItem.product.shopPrice}</p>
                    <p style="color: red"> 小计金额：${orderItem.subTotal}</p>
                </dd>
                <div style="clear:both;"></div>
            </dl>
        </c:forEach>

        <ul class="ul-bd">
            <li><span>送货至</span><p>${orderExt.addr}</p></li>
            <li><span>总计</span><p><i style="color: red">¥${orderExt.total}</i></p></li>
            <li><span>卖家名称</span><p>爱尚微购</p></li>
            <li><span>收货信息</span><p>${orderExt.addr}, ${orderExt.name}， ${orderExt.phone}</p></li>
            <li><span>成交时间</span><p><fmt:formatDate value="${orderExt.orderTime}" pattern="yyyy-MM-dd HH:MM:SS"></fmt:formatDate></p></li>
            <li><span>订单号</span><p>${orderExt.oid}</p></li>
        </ul>
    </div>
    <div class="payment-ft">
        <button class="btn2" onclick="location.href='${pageContext.request.contextPath}/order/toMyOrders.do?uid=${sessionScope.user.uid}'">我的订单</button>
    </div>
</div>

<!--底部一块-->
<%@ include file="down.jsp"%>
</body>
</html>

