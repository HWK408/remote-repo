<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../common/head.jsp" %>
<div class="image-cover hero_banner" style="background: #334aca url('/assets/img/b-1.jpg') no-repeat;" data-overlay="1">
    <div class="container">
        <h1 class="big-header-capt mb-0">新闻资讯详情</h1>
        <p class="text-center mb-5">新闻详情</p>
    </div>
</div>
<section class="gray-simple">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12">
                <div class="article_detail_wrapss single_article_wrap">
                    <div class="article_body_wrap">
                        <div class="article_top_info">
                            <ul class="article_middle_info">
                                <li><span class="icons"><i class="ti-user"></i> </span>管理员 </li>
                                <li><fmt:formatDate value="${news.createTime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate> </li>
                            </ul>
                        </div>
                        <h4 style="margin-top: 10px;">${news.title}</h4>
                        <div style="margin-top: 5px;">${news.content}</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<%@ include file="../common/footer.jsp" %>












