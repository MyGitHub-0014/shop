<%--
  Created by IntelliJ IDEA.
  User: yc950710
  Date: 2020/2/27
  Time: 13:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>搜索列表页(有品牌)</title>
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
        // 判断跳转页是否在区间内
        function check() {
            var flag = true
            if($("#pageNow").val()<=0){
                $("#pageNow").val(1)
            }
            if($("#pageNow").val()>${productForPageBean.pageCount}){
                $("#pageNow").val(${productForPageBean.pageCount})
            }
            return flag;
        }
    </script>
    <script type="text/javascript">
        $(function () {
            $("[name='addCart']").click(function () {
                var count = $(this).parent().prev().find("[name='count']").text()
                var pid = $(this).attr("id")
                $.ajax({
                    url:"${pageContext.request.contextPath}/cart/addCart.do",
                    data:{
                        count:count,
                        pid:pid
                    },
                    success:function (data) {
                        if(data!=""){
                            alert("添加购物车成功")
                        }else {
                            alert("添加购物车失败")
                        }
                    }
                })
            })
        })
    </script>
</head>

<body>

<!--header-->
<!--logo search weweima-->
<%@ include file="goodsFast.jsp"%>
<!--nav-->
<%@ include file="nav.jsp"%>

<!--内容开始-->
<!--筛选结果-->
<c:forEach var="categoryExt" items="${allCategory}" varStatus="vs">
    <c:if test="${productForPageBean.cid==categoryExt.cid}">
        <c:set var="cname" value="${categoryExt.cname}"></c:set>
        <c:forEach var="categorySeconds" items="${categoryExt.categorySeconds}">
            <c:if test="${productForPageBean.csid == categorySeconds.csid}">
                <c:set var="csname" value="${categorySeconds.csname}"></c:set>
            </c:if>
        </c:forEach>
    </c:if>
</c:forEach>
<div class="screening-results w1200">
    <p class="tiao">找到共 ${productForPageBean.rowCount} 条</p>
    <div class="results">
        <p class="re-p1 f-l">
            全部结果：${cname} > ${csname}
        </p>
        <div class="re-search f-l">
            <input type="text" placeholder="三只松鼠" class="f-l" />
            <button></button>
            <div style="clear:both;"></div>
        </div>
        <p class="re-p2 f-r">
            <a href="#">清空筛选条件</a>
        </p>
        <div style="clear:both;"></div>
    </div>
</div>
<!--品牌-->
<div class="hover-brand">
    <p class="ho-pingpai f-l">品牌</p>
    <ul class="f-l">
        <li><a href="#"><img src="${pageContext.request.contextPath}/images/hover-br-li-tu1.gif" /></a></li>
        <li><a href="#"><img src="${pageContext.request.contextPath}/images/hover-br-li-tu2.gif" /></a></li>
        <li><a href="#"><img src="${pageContext.request.contextPath}/images/hover-br-li-tu3.gif" /></a></li>
        <li><a href="#"><img src="${pageContext.request.contextPath}/images/hover-br-li-tu4.gif" /></a></li>
        <li><a href="#"><img src="${pageContext.request.contextPath}/images/hover-br-li-tu5.gif" /></a></li>
        <li><a href="#"><img src="${pageContext.request.contextPath}/images/hover-br-li-tu6.gif" /></a></li>
        <li><a href="#"><img src="${pageContext.request.contextPath}/images/hover-br-li-tu7.gif" /></a></li>
        <li><a href="#"><img src="${pageContext.request.contextPath}/images/hover-br-li-tu8.gif" /></a></li>
        <li><a href="#"><img src="${pageContext.request.contextPath}/images/hover-br-li-tu9.gif" /></a></li>
        <li><a href="#"><img src="${pageContext.request.contextPath}/images/hover-br-li-tu10.gif" /></a></li>
        <li><a href="#"><img src="${pageContext.request.contextPath}/images/hover-br-li-tu11.gif" /></a></li>
        <li><a href="#"><img src="${pageContext.request.contextPath}/images/hover-br-li-tu12.gif" /></a></li>
        <li><a href="#"><img src="${pageContext.request.contextPath}/images/hover-br-li-tu13.gif" /></a></li>
        <li><a href="#"><img src="${pageContext.request.contextPath}/images/hover-br-li-tu14.gif" /></a></li>
        <li><a href="#"><img src="${pageContext.request.contextPath}/images/hover-br-li-tu15.gif" /></a></li>
        <li><a href="#"><img src="${pageContext.request.contextPath}/images/hover-br-li-tu16.gif" /></a></li>
        <li><a href="#"><img src="${pageContext.request.contextPath}/images/hover-br-li-tu17.gif" /></a></li>
        <li><a href="#"><img src="${pageContext.request.contextPath}/images/hover-br-li-tu18.gif" /></a></li>
        <div style="clear:both;"></div>
    </ul>
    <div class="duoxuan f-r">
        <button ppgd="">多选</button>
        <a href="JavaScript:;" ppgd="">更多 ∨</a>
    </div>
    <div style="clear:both;"></div>
</div>

<!--品牌 更多-->
<div class="re-brand">
    <div class="brand-top">
        <div class="br-t">
            <p class="pingpai f-l">品牌</p>
            <div class="br-abc f-l">
                <p class="moren f-l">默认</p>
                <ul class="f-l">
                    <li><a href="#">A</a></li>
                    <li><a href="#">B</a></li>
                    <li><a href="#">C</a></li>
                    <li><a href="#">D</a></li>
                    <li><a href="#">E</a></li>
                    <li><a href="#">F</a></li>
                    <li><a href="#">G</a></li>
                    <li><a href="#">H</a></li>
                    <li><a href="#">I</a></li>
                    <li><a href="#">J</a></li>
                    <li><a href="#">K</a></li>
                    <li><a href="#">L</a></li>
                    <li><a href="#">M</a></li>
                    <li><a href="#">N</a></li>
                    <li><a href="#">O</a></li>
                    <li><a href="#">P</a></li>
                    <li><a href="#">Q</a></li>
                    <li><a href="#">R</a></li>
                    <li><a href="#">S</a></li>
                    <li><a href="#">T</a></li>
                    <li><a href="#">U</a></li>
                    <li><a href="#">V</a></li>
                    <li><a href="#">W</a></li>
                    <li><a href="#">X</a></li>
                    <li><a href="#">Y</a></li>
                    <li><a href="#">Z</a></li>
                    <div style="clear:both;"></div>
                </ul>
                <a href="#" class="qita f-l">其他</a>
                <div style="clear:both;"></div>
            </div>
            <div style="clear:both;"></div>
        </div>
        <div class="br-b">
            <ul>
                <li>
                    <input type="checkbox" name="hobby" ></input>
                    <span>小老板</span>
                </li>
                <li>
                    <input type="checkbox" name="hobby" ></input>
                    <span>乐事/Lay's </span>
                </li>
                <li>
                    <input type="checkbox" name="hobby" ></input>
                    <span>周黑鸭/ZHOU...</span>
                </li>
                <li>
                    <input type="checkbox" name="hobby" ></input>
                    <span>喜之郎/STRONG</span>
                </li>
                <li>
                    <input type="checkbox" name="hobby" ></input>
                    <span>费列罗/FERRERO</span>
                </li>
                <li>
                    <input type="checkbox" name="hobby" ></input>
                    <span>好丽友/orion</span>
                </li>
                <li>
                    <input type="checkbox" name="hobby" ></input>
                    <span>莱家/Loacker </span>
                </li>
                <li>
                    <input type="checkbox" name="hobby" ></input>
                    <span>稻香村/dao...</span>
                </li>
                <li>
                    <input type="checkbox" name="hobby" ></input>
                    <span>友臣/YOUCHEN</span>
                </li>
                <li>
                    <input type="checkbox" name="hobby" ></input>
                    <span>好想你</span>
                </li>
                <li>
                    <input type="checkbox" name="hobby" ></input>
                    <span>黄飞红/HUANG...</span>
                </li>
                <li>
                    <input type="checkbox" name="hobby" ></input>
                    <span>可康/COCON</span>
                </li>
                <li>
                    <input type="checkbox" name="hobby" ></input>
                    <span>张君雅</span>
                </li>
                <li>
                    <input type="checkbox" name="hobby" ></input>
                    <span>德芙/Dove</span>
                </li>
                <li>
                    <input type="checkbox" name="hobby" ></input>
                    <span>利奥/Oreo</span>
                </li>
                <li>
                    <input type="checkbox" name="hobby" ></input>
                    <span>士力架/SNICKERS</span>
                </li>
                <li>
                    <input type="checkbox" name="hobby" ></input>
                    <span>汉斯/Hunt's</span>
                </li>
                <li>
                    <input type="checkbox" name="hobby" ></input>
                    <span>多力多滋</span>
                </li>
                <li>
                    <input type="checkbox" name="hobby" ></input>
                    <span>百草味/Be ...</span>
                </li>
                <li>
                    <input type="checkbox" name="hobby" ></input>
                    <span>丽芝士/Richeese</span>
                </li>
                <li>
                    <input type="checkbox" name="hobby" ></input>
                    <span>百吉福/MILKANA</span>
                </li>
                <li>
                    <input type="checkbox" name="hobby" ></input>
                    <span>利葡/LiPO</span>
                </li>
                <li>
                    <input type="checkbox" name="hobby" ></input>
                    <span>友谊牌/Tipo</span>
                </li>
                <li>
                    <input type="checkbox" name="hobby" ></input>
                    <span>百草味/Be ...</span>
                </li>
                <li>
                    <input type="checkbox" name="hobby" ></input>
                    <span>丽芝士/Richeese</span>
                </li>
                <li>
                    <input type="checkbox" name="hobby" ></input>
                    <span>百吉福/MILKANA</span>
                </li>
                <li>
                    <input type="checkbox" name="hobby" ></input>
                    <span>利葡/LiPO</span>
                </li>
                <li>
                    <input type="checkbox" name="hobby" ></input>
                    <span>友谊牌/Tipo</span>
                </li>
                <li>
                    <input type="checkbox" name="hobby" ></input>
                    <span>百草味/Be ...</span>
                </li>
                <li>
                    <input type="checkbox" name="hobby" ></input>
                    <span>丽芝士/Richeese</span>
                </li>
                <li>
                    <input type="checkbox" name="hobby" ></input>
                    <span>百吉福/MILKANA</span>
                </li>
                <li>
                    <input type="checkbox" name="hobby" ></input>
                    <span>利葡/LiPO</span>
                </li>
                <li>
                    <input type="checkbox" name="hobby" ></input>
                    <span>友谊牌/Tipo</span>
                </li>
                <li>
                    <input type="checkbox" name="hobby" ></input>
                    <span>百草味/Be ...</span>
                </li>
                <li>
                    <input type="checkbox" name="hobby" ></input>
                    <span>丽芝士/Richeese</span>
                </li>
                <li>
                    <input type="checkbox" name="hobby" ></input>
                    <span>百吉福/MILKANA</span>
                </li>
                <li>
                    <input type="checkbox" name="hobby" ></input>
                    <span>利葡/LiPO</span>
                </li>
                <li>
                    <input type="checkbox" name="hobby" ></input>
                    <span>友谊牌/Tipo</span>
                </li>
                <li>
                    <input type="checkbox" name="hobby" ></input>
                    <span>百草味/Be ...</span>
                </li>
                <li>
                    <input type="checkbox" name="hobby" ></input>
                    <span>丽芝士/Richeese</span>
                </li>
                <li>
                    <input type="checkbox" name="hobby" ></input>
                    <span>百吉福/MILKANA</span>
                </li>
                <li>
                    <input type="checkbox" name="hobby" ></input>
                    <span>利葡/LiPO</span>
                </li>
                <li>
                    <input type="checkbox" name="hobby" ></input>
                    <span>友谊牌/Tipo</span>
                </li>
                <li>
                    <input type="checkbox" name="hobby" ></input>
                    <span>百草味/Be ...</span>
                </li>
                <li>
                    <input type="checkbox" name="hobby" ></input>
                    <span>丽芝士/Richeese</span>
                </li>
                <li>
                    <input type="checkbox" name="hobby" ></input>
                    <span>百吉福/MILKANA</span>
                </li>
                <li>
                    <input type="checkbox" name="hobby" ></input>
                    <span>利葡/LiPO</span>
                </li>
                <li>
                    <input type="checkbox" name="hobby" ></input>
                    <span>友谊牌/Tipo</span>
                </li>
                <div style="clear:both;"></div>
            </ul>
        </div>
    </div>
    <div class="brand-bt">
        <button>确定</button>
        <button class="quxiao" quxiao1="">取消</button>
    </div>
</div>

<!--品牌热销-->
<div class="brand-sales">
    <dl>
        <dt>本品牌热销</dt>
        <dd>
            <a href="#">坚果礼品</a>
            <a href="#">碧根果</a>
            <a href="#">松子</a>
            <a href="#">夏威夷果</a>
            <a href="#">核桃</a>
            <a href="#">葡萄干</a>
            <a href="#">花生</a>
            <a href="#">豆类制品</a>
            <a href="#">杏仁</a>
            <a href="#">枣类</a>
            <a href="#">瓜子</a>
            <a href="#">其他坚果</a><a href="#">坚果礼品</a>
            <a href="#">碧根果</a>
            <a href="#">松子</a>
            <a href="#">夏威夷果</a>
            <a href="#">核桃</a>
            <a href="#">葡萄干</a>
            <a href="#">花生</a>
            <a href="#">豆类制品</a>
            <a href="#">杏仁</a>
            <a href="#">枣类</a>
            <a href="#">瓜子</a>
            <a href="#">其他坚果</a>
            <a href="#">坚果礼品</a>
            <a href="#">碧根果</a>
            <a href="#">松子</a>
            <a href="#">夏威夷果</a>
            <a href="#">核桃</a>
            <a href="#">葡萄干</a>
            <a href="#">花生</a>
            <a href="#">豆类制品</a>
            <a href="#">杏仁</a>
            <a href="#">枣类</a>
            <a href="#">瓜子</a>
            <a href="#">其他坚果</a>
            <a href="#">坚果礼品</a>
            <a href="#">碧根果</a>
            <a href="#">松子</a>
            <a href="#">夏威夷果</a>
            <a href="#">核桃</a>
            <a href="#">葡萄干</a>
            <a href="#">花生</a>
            <a href="#">豆类制品</a>
            <a href="#">杏仁</a>
            <a href="#">枣类</a>
            <a href="#">瓜子</a>
            <a href="#">其他坚果</a>
        </dd>
        <div style="clear:both;"></div>
    </dl>
    <dl style="border-bottom:none;">
        <dt>大家都在选</dt>
        <dd>
            <a href="#">坚果礼品</a>
            <a href="#">碧根果</a>
            <a href="#">松子</a>
            <a href="#">夏威夷果</a>
            <a href="#">核桃</a>
            <a href="#">葡萄干</a>
            <a href="#">花生</a>
            <a href="#">豆类制品</a>
            <a href="#">杏仁</a>
            <a href="#">枣类</a>
            <a href="#">瓜子</a>
            <a href="#">其他坚果</a>
        </dd>
        <div style="clear:both;"></div>
    </dl>
</div>

<!--内容↓↑-->
<div class="shop-page-con w1200">
    <div class="shop-pg-left f-l" style="width:215px">
        <div class="shop-left-buttom" style="margin-top:0;">
            <div class="sp-tit1">
                <h3>商品推荐</h3>
            </div>
            <%--热门--%>
            <ul class="shop-left-ul">
                <c:forEach var="isHots" items="${isHots}">
                    <li>
                        <div class="li-top">
                            <a href="#" class="li-top-tu"><img style="width:95px; height: 110px " src="${pageContext.request.contextPath}/${isHots.image}" /></a>
                            <p class="jiage"><span class="sp1">￥${isHots.shopPrice}</span><span class="sp2">￥${isHots.marketPrice}</span></p>
                        </div>
                        <p class="miaoshu">${isHots.pName}</p>
                        <div class="li-md">
                            <div class="md-l f-l">
                                <p class="md-l-l f-l" ap="" name="count">1</p>
                                <div class="md-l-r f-l">
                                    <a href="JavaScript:;" class="md-xs" at="">∧</a>
                                    <a href="JavaScript:;" class="md-xx" ab="">∨</a>
                                </div>
                                <div style="clear:both;"></div>
                            </div>
                            <div class="md-r f-l">
                                <button class="md-l-btn1">立即购买</button>
                                <button class="md-l-btn2" id="${isHots.pid}" name="addCart">加入购物车</button>
                            </div>
                            <div style="clear:both;"></div>
                        </div>
                        <p class="pingjia">88888评价</p>
                        <p class="weike">微克宅购自营</p>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>
    <div class="shop-pg-right f-r">
        <div class="shop-right-cmp" style="margin-top:0;">
            <ul class="shop-cmp-l f-l">
                <li class="current"><a href="#">综合 ↓</a></li>
                <li><a href="#">销量 ↓</a></li>
                <li><a href="#">新品 ↓</a></li>
                <li><a href="#">评价 ↓</a></li>
                <div style="clear:both;"></div>
            </ul>
            <div class="shop-cmp-m f-l">
                <span>价格</span><input type="text" /><span>-</span><input type="text" />
            </div>
            <div class="shop-cmp-r f-l">
                <ul class="f-l">
                    <li>
                        <input type="checkbox" name="hobby" value=""></input>
                        <span>包邮</span>
                    </li>
                    <li>
                        <input type="checkbox" name="hobby" value=""></input>
                        <span>进口</span>
                    </li>
                    <li>
                        <input type="checkbox" name="hobby" value=""></input>
                        <span>仅显示有货</span>
                    </li>
                    <li>
                        <input type="checkbox" name="hobby" value=""></input>
                        <span>满赠</span>
                    </li>
                    <li>
                        <input type="checkbox" name="hobby" value=""></input>
                        <span>满减</span>
                    </li>
                    <div style="clear:both;"></div>
                </ul>
                <button>确定</button>
            </div>
            <div style="clear:both;"></div>
        </div>
        <div class="shop-right-con">
            <ul class="shop-ul-tu shop-ul-tu1">
                <c:forEach items="${productForPageBean.list}" var="product" varStatus="vs">
                    <li style="margin-right:0;">
                        <div class="li-top">
                            <a href="${pageContext.request.contextPath}/product/toProductDetail.do?pid=${product.pid}" class="li-top-tu"><img style="width: 95px;height: 110px" src="${pageContext.request.contextPath}/${product.image}" /></a>
                            <p class="jiage"><span class="sp1">￥${product.shopPrice}</span><span class="sp2">￥${product.marketPrice}</span></p>
                        </div>
                        <p class="miaoshu">${product.pName}</p>
                        <div class="li-md">
                            <div class="md-l f-l">
                                <p class="md-l-l f-l" ap="" name="count">1</p>
                                <div class="md-l-r f-l">
                                    <a href="JavaScript:;" class="md-xs" at="">∧</a>
                                    <a href="JavaScript:;" class="md-xx" ab="">∨</a>
                                </div>
                                <div style="clear:both;"></div>
                            </div>
                            <div class="md-r f-l">
                                <button class="md-l-btn1">立即购买</button>
                                <button class="md-l-btn2" id="${product.pid}" name="addCart">加入购物车</button>
                            </div>
                            <div style="clear:both;"></div>
                        </div>
                        <p class="pingjia">88888评价</p>
                        <p class="weike">微克宅购自营</p>
                    </li>
                </c:forEach>
                <div style="clear:both;"></div>
            </ul>

            <!--分页-->
            <div class="paging">
                <div class="pag-left f-l">

                    <%--上一页--%>
                    <c:if test="${productForPageBean.pageNow ne 1 }">
                        <a href="${pageContext.request.contextPath}/product/toSearchProducts.do?&cid=${productForPageBean.cid}&csid=${productForPageBean.csid}&pageNow=${productForPageBean.pageNow-1}&isHot=1&pName=${productForPageBean.pName}" class="about left-r f-l"><</a>
                    </c:if>
                    <ul class="left-m f-l">

                    <%--前6页--%>
                        <c:if test="${productForPageBean.pageNow le 6 }">
                            <c:forEach var="i" begin="1" end="${productForPageBean.pageCount le 6?productForPageBean.pageCount:6}" step="1" varStatus="vs">
                                <li ${productForPageBean.pageNow==i?"class='current'":""}><a href="${pageContext.request.contextPath}/product/toSearchProducts.do?&cid=${productForPageBean.cid}&csid=${productForPageBean.csid}&pageNow=${i}&isHot=1">${i}</a></li>
                            </c:forEach>
                        </c:if>

                    <!-- 第7页到倒数6页 -->
                        <c:if test="${productForPageBean.pageNow gt 6 && productForPageBean.pageNow le productForPageBean.pageCount-6 }">
                            <c:forEach var="i" begin="${productForPageBean.pageNow-2 }" end="${productForPageBean.pageNow }" step="1">
                                <li ${productForPageBean.pageNow==i?"class='current'":""}><a href="${pageContext.request.contextPath}/product/toSearchProducts.do?&cid=${productForPageBean.cid}&csid=${productForPageBean.csid}&pageNow=${i}&isHot=1&pName=${productForPageBean.pName}">${i}</a></li>
                            </c:forEach>
                            <c:forEach var="i" begin="${productForPageBean.pageNow+1 }" end="${productForPageBean.pageNow+3 }" step="1">
                                <li ${productForPageBean.pageNow==i?"class='current'":""}><a href="${pageContext.request.contextPath}/product/toSearchProducts.do?&cid=${productForPageBean.cid}&csid=${productForPageBean.csid}&pageNow=${i}&isHot=1&pName=${productForPageBean.pName}">${i}</a></li>
                            </c:forEach>
                        </c:if>

                    <%--总页数大于等于12才执行--%>
                        <c:if test="${productForPageBean.pageCount ge 12}">
                            <!-- 后五页 -->
                            <c:if test="${productForPageBean.pageNow gt productForPageBean.pageCount-6 && productForPageBean.pageNow le productForPageBean.pageCount }">
                                <c:forEach var="i" begin="${productForPageBean.pageCount-5 }" end="${productForPageBean.pageCount }" step="1">
                                    <li ${productForPageBean.pageNow==i?"class='current'":""}><a href="${pageContext.request.contextPath}/product/toSearchProducts.do?&cid=${productForPageBean.cid}&csid=${productForPageBean.csid}&pageNow=${i}&isHot=1&pName=${productForPageBean.pName}">${i}</a></li>
                                </c:forEach>
                            </c:if>
                        </c:if>

                        <li><a href="#">...</a></li>
                        <li><a href="${pageContext.request.contextPath}/product/toSearchProducts.do?&cid=${productForPageBean.cid}&csid=${productForPageBean.csid}&pageNow=${productForPageBean.pageCount}&isHot=1&pName=${productForPageBean.pName}">${productForPageBean.pageCount}</a></li>
                        <div style="clear:both;"></div>
                    </ul>

                    <!-- 下一页 -->
                    <c:if test="${productForPageBean.pageNow ne productForPageBean.pageCount}">
                        <a href="${pageContext.request.contextPath}/product/toSearchProducts.do?&cid=${productForPageBean.cid}&csid=${productForPageBean.csid}&pageNow=${productForPageBean.pageNow+1}&isHot=1&pName=${productForPageBean.pName}" class="about left-l f-l">></a>
                    </c:if>
                    <div style="clear:both;"></div>

                </div>
                <form action="${pageContext.request.contextPath}/product/toSearchProducts.do?&cid=${productForPageBean.cid}&csid=${productForPageBean.csid}&isHot=1&pName=${productForPageBean.pName}" method="post">
                    <div class="pag-right f-l">
                        <div class="jump-page f-l">
                            到第<input type="number" name="pageNow" id="pageNow" value="${productForPageBean.pageNow}" />页
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
</body>
</html>

