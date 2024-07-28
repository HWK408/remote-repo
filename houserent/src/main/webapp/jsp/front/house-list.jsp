<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../common/head.jsp" %>
<section class="gray-simple">
    <div class="container">
        <div class="row">
            <div class="col-lg-4 col-md-12 col-sm-12">
                <div class="page-sidebar">
                    <form action="/house" method="get">
                        <div class="form-group">
                            <select name="city" id="city" class="form-control">
                                <option value=""></option>
                                <option value="北京" <c:if test="${houseSearchVO.city == '北京'}">selected</c:if>>北京</option>
                                <option value="上海" <c:if test="${houseSearchVO.city == '上海'}">selected</c:if>>上海</option>
                                <option value="广州" <c:if test="${houseSearchVO.city == '广州'}">selected</c:if>>广州</option>
                                <option value="深圳" <c:if test="${houseSearchVO.city == '深圳'}">selected</c:if>>深圳</option>
                                <option value="天津" <c:if test="${houseSearchVO.city == '天津'}">selected</c:if>>天津</option>
                                <option value="武汉" <c:if test="${houseSearchVO.city == '武汉'}">selected</c:if>>武汉</option>
                                <option value="长沙" <c:if test="${houseSearchVO.city == '长沙'}">selected</c:if>>长沙</option>
                                <option value="杭州" <c:if test="${houseSearchVO.city == '杭州'}">selected</c:if>>杭州</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <select name="rentType" id="selectRentType" class="form-control">
                                <option value=""></option>
                                <option value="whole" <c:if test="${houseSearchVO.rentType == 'whole'}">selected</c:if>>整租</option>
                                <option value="share" <c:if test="${houseSearchVO.rentType == 'share'}">selected</c:if>>合租</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <div class="input-with-icon">
                                <input type="text" id="address" name="address" class="form-control" placeholder="小区" value="${houseSearchVO.address}">
                                <i class="ti-search"></i>
                            </div>
                        </div>
                        <div class="form-group">
                            <h6>选择价格范围</h6>
                            <div>
                                <input type="text" class="js-range-slider-price" name="priceRange"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <h6>选择面积范围</h6>
                            <div>
                                <input type="text" class="js-range-slider-area" name="areaRange"/>
                            </div>
                        </div>
                        <div>
                            <button type="submit" class="btn btn-theme full-width bg-2">搜索</button>
                        </div>
                    </form>
                </div>
            </div>

            <div class="col-lg-8 col-md-12 col-sm-12">
                <div class="row">
                    <c:forEach items="${pageInfo.records}" var="c">
                        <div class="col-lg-6 col-md-6 col-sm-12">
                            <div class="single_property_style property_style_2 modern">
                                <div class="listing_thumb_wrapper">
                                    <a href="/house/detail/${c.id}"><img src="${c.thumbnailUrl}" class="img-fluid mx-auto"></a>
                                </div>
                                <div class="property_caption_wrappers pb-0">
                                    <div class="property_short_detail">
                                        <div class="pr_type_status">
                                            <h4 class="pr-property_title mb-1"><a href="/house/detail/${c.id}">${c.title}</a></h4>
                                            <div class="listing-location-name">
                                                <a href="/house/detail/${c.id}">${c.address}</a>
                                            </div>
                                        </div>
                                        <div class="property-real-price">
                                            <a href="/house/detail/${c.id}" class="cl-blue">￥${c.monthRent}<span class="price_status">/月</span></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="modern_property_footer">
                                    <div class="property-lists flex-1">
                                        <ul>
                                            <li>
                                                <span class="flatcons"><img src="/assets/img/bed.svg"></span>${c.bedroomNum}卧室
                                            </li>
                                            <li>
                                                <span class="flatcons"><img src="/assets/img/bath.svg"></span>${c.toiletNum}卫生间
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="fp_types">
                                        <a href="javascript:void(0)" class="markHouse" onclick="submitMark(${c.id})">收藏</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <div class="row">
                    <%@include file="../common/page.jsp"%>
                </div>
            </div>
        </div>
    </div>
</section>
<%@ include file="../common/footer.jsp" %>

<script>
    var minPrice = ${houseSearchVO.minPrice};
    var maxPrice = ${houseSearchVO.maxPrice};
    var minArea = ${houseSearchVO.minArea};
    var maxArea = ${houseSearchVO.maxArea};

    $(".js-range-slider-price").ionRangeSlider({
        type: "double",
        min: 0,
        max: 20000,
        from: minPrice,
        to: maxPrice,
        grid: true
    });

    $(".js-range-slider-area").ionRangeSlider({
        type: "double",
        min: 0,
        max: 150,
        from: minArea,
        to: maxArea,
        grid: true
    });
</script>





















