<%--
  Created by IntelliJ IDEA.
  User: yc950710
  Date: 2020/3/5
  Time: 11:34
  To change this template use File | Settings | File Templates.
  我的订单
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>我的订单</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/shopping-mall-index.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/zhonglin.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/zhongling2.js"></script>
    <script type="text/javascript">
        // 判断跳转页是否在区间内
        function check() {
            var flag = true
            if($("#pageNow").val()<=0){
                $("#pageNow").val(1)
            }
            if($("#pageNow").val()>${orderForPageBean.pageCount}){
                $("#pageNow").val(${orderForPageBean.pageCount})
            }
            return flag;
        }

    </script>
    <style>
        a{
            color: black;
        }
        a:hover{
            color: green;
        }

    </style>
</head>

<body style="position:relative;">
<!--header-->
<!--logo search weweima-->
<!--nav-->
<%@ include file="goodsFast.jsp"%>
<%@ include file="nav.jsp"%>

<!--内容开始-->
<div class="personal w1200">
    <div class="personal-left f-l">
        <div class="personal-l-tit">
            <h3>个人中心</h3>
        </div>
        <ul>
            <li class="current-li per-li1"><a href="#">消息中心<span>></span></a></li>
            <li class="per-li2"><a href="#">个人资料<span>></span></a></li>
            <li class="per-li3"><a href="#">我的订单<span>></span></a></li>
            <li class="per-li4"><a href="#">我的预约<span>></span></a></li>
            <li class="per-li5"><a href="#">购物车<span>></span></a></li>
            <li class="per-li6"><a href="#">管理收货地址<span>></span></a></li>
            <li class="per-li7"><a href="#">店铺收藏<span>></span></a></li>
            <li class="per-li8"><a href="#">购买记录<span>></span></a></li>
            <li class="per-li9"><a href="#">浏览记录<span>></span></a></li>
            <li class="per-li10"><a href="#">会员积分<span>></span></a></li>
        </ul>
    </div>
    <div class="order-right f-r">
        <div class="order-hd">
            <dl class="f-l">
                <dt>
                    <a href="#"><img src="${pageContext.request.contextPath}/images/data-tu2.gif" /></a>
                </dt>
                <dd>
                    <h3><a href="#">RH了</a></h3>
                    <p>zhao601884596</p>
                </dd>
                <div style="clear:both;"></div>
            </dl>
            <div class="ord-dai f-l">
                <p>待付款<span>1</span></p>
                <p>待发货<span>1</span></p>
                <p>待收货<span>1</span></p>
                <p>待评价<span>1</span></p>
            </div>
            <div style="clear:both;"></div>
        </div>
        <div class="order-md">
            <div class="md-tit">
                <h3>我的订单</h3>
            </div>
            <div class="md-hd">
                <P class="md-p1"></P>
                <p class="md-p2">商品信息</p>
                <p class="md-p3">规格</p>
                <p class="md-p4">单价（元）</p>
                <p class="md-p5">金额（元）</p>
            </div>
            <c:forEach var="orderExt" items="${orderForPageBean.list}">
                <input type="hidden" id="sta" value="${orderExt.state}">
                <c:choose>
                    <c:when test="${orderExt.state==0}"><c:set var="status" value="待付款"></c:set></c:when>
                    <c:when test="${orderExt.state==1}"><c:set var="status" value="待发货"></c:set></c:when>
                    <c:when test="${orderExt.state==2}"><c:set var="status" value="待收货"></c:set></c:when>
                    <c:when test="${orderExt.state==3}"><c:set var="status" value="已收货"></c:set></c:when>
                </c:choose>
                <div class="md-info">
                    <div class="dai">
                        <input type="checkbox" name="hobby" value=""></input><span>${status}</span>
                    </div>

                <c:forEach var="orderItemExts" items="${orderExt.orderItemExts}">
                        <div class="dai-con">
                        <dl class="dl1">
                            <dt>
                                <input type="checkbox" name="hobby" value="" class="f-l"></input>
                                <a href="#" class="f-l"><img style="width: 80px;height: 80px" src="${pageContext.request.contextPath}/${orderItemExts.product.image}" /></a>
                                <div style="clear:both;"></div>
                            </dt>
                            <dd>
                                <p>${orderItemExts.product.pName} ${fn:substring(orderItemExts.product.pDesc,0 ,30 )}...</p>
                                <span>X ${orderItemExts.count}</span>
                            </dd>
                            <div style="clear:both;"></div>
                        </dl>
                        <div class="dai-right f-l">
                            <P class="d-r-p1">颜色：蓝色<br />尺码：XL</P>
                            <p class="d-r-p2">¥ ${orderItemExts.product.shopPrice}</p>
                            <p class="d-r-p3">¥ ${orderItemExts.subTotal}</p>
                        </div>
                        <div style="clear:both;"></div>
                    </div>
                </c:forEach>
                </div>
                <div style="margin-bottom: 30px">
                    <div style="float: right;">
                        <a href="${pageContext.request.contextPath}/order/toConfirmReceipt.do?oid=${orderExt.oid}&details=1">商品详情</a>&nbsp;&nbsp;&nbsp;&nbsp;
                        <c:choose>
                            <c:when test="${orderExt.state==0}">
                                <a href="${pageContext.request.contextPath}/order/updateMyOrders.do?oid=${orderExt.oid}&state=-1&pageNow=${orderForPageBean.pageNow}" name="del">删除</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/order/toPays.do?oid=${orderExt.oid}">付款</a>&nbsp;&nbsp;&nbsp;&nbsp;
                            </c:when>
                            <c:when test="${orderExt.state==1}">
                                <a href="#">提醒发货</a>
                            </c:when>
                            <c:when test="${orderExt.state==2}">
                                <a href="${pageContext.request.contextPath}/order/toConfirmReceipt.do?oid=${orderExt.oid}">确认收货</a>&nbsp;&nbsp;&nbsp;&nbsp;
                            </c:when>
                            <c:when test="${orderExt.state==3}">
                                <a href="${pageContext.request.contextPath}/order/updateMyOrders.do?oid=${orderExt.oid}&state=-1&pageNow=${orderForPageBean.pageNow}" name="del">删除</a>&nbsp;&nbsp;&nbsp;&nbsp;
                            </c:when>
                        </c:choose>

                        总计：<span style="color: red">￥${orderExt.total}</span>&nbsp;&nbsp;&nbsp;&nbsp;
                        订单号：${orderExt.oid}&nbsp;&nbsp;&nbsp;&nbsp;
                    </div>
                </div>
            </c:forEach>

            <!--分页-->
                <div class="paging" style="margin-top: 60px">
                    <div class="pag-left f-l">

                            <%--上一页--%>
                        <c:if test="${orderForPageBean.pageNow ne 1 }">
                            <a href="${pageContext.request.contextPath}/order/toMyOrders.do?pageNow=${orderForPageBean.pageNow-1}&uid=${sessionScope.user.uid}" class="about left-r f-l"><</a>
                        </c:if>
                        <ul class="left-m f-l">

                                <%--前6页--%>
                            <c:if test="${orderForPageBean.pageNow le 6 }">
                                <c:forEach var="i" begin="1" end="${orderForPageBean.pageCount le 6?orderForPageBean.pageCount:6}" step="1" varStatus="vs">
                                    <li ${orderForPageBean.pageNow==i?"class='current'":""}><a href="${pageContext.request.contextPath}/order/toMyOrders.do?pageNow=${i}&uid=${sessionScope.user.uid}">${i}</a></li>
                                </c:forEach>
                            </c:if>

                            <!-- 第7页到倒数6页 -->
                            <c:if test="${orderForPageBean.pageNow gt 6 && orderForPageBean.pageNow le orderForPageBean.pageCount-6 }">
                                <c:forEach var="i" begin="${orderForPageBean.pageNow-2 }" end="${orderForPageBean.pageNow }" step="1">
                                    <li ${orderForPageBean.pageNow==i?"class='current'":""}><a href="${pageContext.request.contextPath}/order/toMyOrders.do?pageNow=${i}&uid=${sessionScope.user.uid}">${i}</a></li>
                                </c:forEach>
                                <c:forEach var="i" begin="${orderForPageBean.pageNow+1 }" end="${orderForPageBean.pageNow+3 }" step="1">
                                    <li ${orderForPageBean.pageNow==i?"class='current'":""}><a href="${pageContext.request.contextPath}/order/toMyOrders.do?pageNow=${i}&uid=${sessionScope.user.uid}">${i}</a></li>
                                </c:forEach>
                            </c:if>

                                <%--总页数大于等于12才执行--%>
                            <c:if test="${orderForPageBean.pageCount ge 12}">
                                <!-- 后五页 -->
                                <c:if test="${orderForPageBean.pageNow gt orderForPageBean.pageCount-6 && orderForPageBean.pageNow le orderForPageBean.pageCount }">
                                    <c:forEach var="i" begin="${orderForPageBean.pageCount-5 }" end="${orderForPageBean.pageCount }" step="1">
                                        <li ${orderForPageBean.pageNow==i?"class='current'":""}><a href="${pageContext.request.contextPath}/order/toMyOrders.do?pageNow=${i}&uid=${sessionScope.user.uid}">${i}</a></li>
                                    </c:forEach>
                                </c:if>
                            </c:if>

                            <li><a href="#">...</a></li>
                            <li><a href="${pageContext.request.contextPath}/order/toMyOrders.do?pageNow=${orderForPageBean.pageCount}&uid=${sessionScope.user.uid}">${orderForPageBean.pageCount}</a></li>
                            <div style="clear:both;"></div>
                        </ul>

                        <!-- 下一页 -->
                        <c:if test="${orderForPageBean.pageNow ne orderForPageBean.pageCount}">
                            <a href="${pageContext.request.contextPath}/order/toMyOrders.do?pageNow=${orderForPageBean.pageNow+1}&uid=${sessionScope.user.uid}" class="about left-l f-l">></a>
                        </c:if>
                        <div style="clear:both;"></div>

                    </div>
                    <form action="${pageContext.request.contextPath}/order/toMyOrders.do?uid=${sessionScope.user.uid}" method="post">
                        <div class="pag-right f-l">
                            <div class="jump-page f-l">
                                到第<input type="number" name="pageNow" id="pageNow" value="${orderForPageBean.pageNow}" />页
                            </div>
                            <button class="f-l" id="button" onclick="return check()">确定</button>
                            <div style="clear:both;"></div>
                        </div>
                    </form>


                    <div style="clear:both;"></div>
                </div>

        </div>

    </div>
    <div style="clear:both;"></div>
</div>

<!--底部一块-->
<%@ include file="down.jsp"%>

<!--查看物流 弹窗-->
<div class="view-logistics">
    <div class="view-bg"></div>
    <div class="view-con">
        <div class="view-tit">
            <h3>物流信息</h3>
            <a href="JavaScript:;" guanbi="">
                <img src="${pageContext.request.contextPath}/images/close-select-city.gif" />
            </a>
            <div style="clear:both;"></div>
        </div>
        <div class="view-bd">
            <ul>
                <li class="bd-pdl-li after"><span>1</span>2015-08-06　周四　　14:06:53您的订单开始处理</li>
                <li class="after"><span>2</span>14:08:44您的订单待配货</li>
                <li><span>3</span>14:16:04您的包裹已出库</li>
                <li><span>4</span>14:16:03商家正通知快递公司揽件</li>
                <li><span>5</span>21:47:54【惠州市】圆通速递 广东省惠州市惠东县收件员 已揽件</li>
                <li class="bd-pdb-li"><span>6</span>22:13:51广东省惠州市惠东县公司 已发出</li>
                <li class="bd-pdl-li"><span>7</span>2015-08-07　周五　　04:57:33广州转运中心公司 已收入</li>
                <li><span>8</span>04:58:54广州转运中心公司 已发出</li>
                <li><span>9</span>2015-08-08周六22:46:43重庆转运中心公司 已收入</li>
                <li class="bd-pdb-li"><span>10</span>23:01:49【重庆市】重庆转运中心 已发出</li>
                <li class="bd-pdl-li"><span>11</span>2015-08-09　周日　　00:57:11【重庆市】快件已到达 重庆市南岸区</li>
                <li><span>12</span>11:14:52重庆市南岸区 已收入</li>
                <li><span>13</span>11:14:52【重庆市】重庆市南岸区派件员：李天生 13330284757正在为您派件</li>
                <li class="bd-bd-li"><span>14</span>15:53:14【重庆市】重庆市南岸区公司 已签收 签收人：保安，感谢使用圆通速递，期待再次为您服务</li>
            </ul>
            <p class="sign">您的包裹已被签收！</p>
        </div>
    </div>
</div>

</body>
</html>
