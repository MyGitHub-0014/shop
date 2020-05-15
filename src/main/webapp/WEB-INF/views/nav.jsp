<%--
  Created by IntelliJ IDEA.
  User: yc950710
  Date: 2020/3/3
  Time: 18:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--nav-->
<div class="nav-box">
    <div class="nav-kuai w1200">
        <div class="nav-kuaijie yjp-hover1 f-l">
            <a href="JavaScript:;" class="kj-tit1">商品分类快捷</a>
            <div class="kuaijie-box yjp-show1" style="display:none;">
                <c:forEach items="${allCategory}" var="categoryExt" begin="0" end="5">
                    <div class="kuaijie-info">
                        <dl class="kj-dl1">
                            <dt><img src="${pageContext.request.contextPath}/images/zl2-07.gif" /><a href="${pageContext.request.contextPath}/product/toSearchProducts.do?cid=${categoryExt.cid}&pageNow=1&isHot=1">${categoryExt.cname}</a></dt>
                            <dd>
                                <c:forEach items="${categoryExt.categorySeconds}" var="categorySecond" begin="0" end="2" varStatus="vs">
                                    <a href="${pageContext.request.contextPath}/product/toSearchProducts.do?csid=${categorySecond.csid}&cid=${categoryExt.cid}&pageNow=1&isHot=1">${categorySecond.csname}</a>
                                    <%--如果不是最后一个就运行--%>
                                    <c:if test="${!vs.last}">
                                        <span>|</span>
                                    </c:if>
                                </c:forEach>
                            </dd>
                        </dl>

                        <div class="kuaijie-con">
                            <dl class="kj-dl2" style="display:inline-block">
                                <dt><a href="${pageContext.request.contextPath}/product/toSearchProducts.do?cid=${categoryExt.cid}&pageNow=1&isHot=1">${categoryExt.cname}</a></dt>
                                <dd>
                                    <c:forEach items="${categoryExt.categorySeconds}" var="categorySecond" varStatus="vs">
                                        <a href="${pageContext.request.contextPath}/product/toSearchProducts.do?csid=${categorySecond.csid}&cid=${categoryExt.cid}&pageNow=1&isHot=1">${categorySecond.csname}</a>
                                        <c:if test="${!vs.last}">
                                            <span>|</span>
                                        </c:if>
                                    </c:forEach>
                                </dd>
                            </dl>

                            <div style="clear:both;"></div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <ul class="nav-font f-l">
            <c:forEach items="${allCategory}" var="categoryExt" varStatus="vs">
                <li><a href="${pageContext.request.contextPath}/product/toSearchProducts.do?cid=${categoryExt.cid}&pageNow=1&isHot=1">${categoryExt.cname}</a>
                <c:if test="${vs.last}">
                    <span><img src="${pageContext.request.contextPath}/images/zl2-05.gif" /></span></li>
                </c:if>
            </c:forEach>
            <div style="clear:both;"></div>
        </ul>
        <div style="clear:both;"></div>
    </div>
</div>
