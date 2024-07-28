<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../common/head.jsp" %>
<div class="image-cover hero_banner" style="background: #334aca url('/assets/img/b-1.jpg') no-repeat;" data-overlay="1">
    <div class="container">
        <h1 class="big-header-capt mb-0">新闻资讯</h1>
        <p class="text-center mb-5">新闻信息</p>
    </div>
</div>
<section class="gray-simple">
    <div class="container">
        <div class="row">
            <c:forEach items="${pageInfo.records}" var="c">
                <div class="col-lg-12 col-md-12 col-sm-12">
                    <div class="property_block_wrap style-2">
                        <div class="property_block_wrap_header">
                            <a href="/news/detail/${c.id}"><h4>${c.title}</h4> </a>
                        </div>
                        <div class="block-body">
                            ${c.summary}
                            <p style="margin-top: 5px;">发布时间：<fmt:formatDate value="${c.createTime}" pattern="yyyy-MM-dd"></fmt:formatDate> </p>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <%@ include file="../common/page.jsp" %>
            </div>
        </div>
    </div>
</section>

<%@ include file="../common/footer.jsp" %>












