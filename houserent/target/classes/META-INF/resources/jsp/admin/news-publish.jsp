<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../common/head.jsp" %>
<section class="p-0">
    <div class="container-fluid p-0">
        <div class="row">
            <%@ include file="../common/admin-left.jsp" %>
            <div class="col-lg-9 col-md-8 col-sm-12">
                <section style="padding-top: 10px;">
                    <div class="container">
                        <div class="row">
                            <form id="newsForm">
                                <input type="hidden" id="id" name="id" value="${news.id}">
                                <div class="col-lg-12 col-md-12">
                                    <div class="submit-page form-simple">
                                        <div class="frm_submit_block">
                                            <h3>发布新闻</h3>
                                            <div class="form-row">
                                                <div class="form-group col-md-12">
                                                    <label>新闻标题</label>
                                                    <input type="text" name="title" class="form-control" value="${news.title}" style="width: 1000px;">
                                                </div>
                                                <div class="form-group col-md-12">
                                                    <label>新闻内容</label>
                                                    <textarea class="form-control h-240" name="content" style="min-height: 300px;width: 1000px;">${news.content}</textarea>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-lg-12 col-md-12">
                                                <button class="btn btn-theme bg-2" type="button" onclick="submitNews()">发布</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </div>
</section>

<%@ include file="../common/footer.jsp" %>
