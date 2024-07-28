/*注册提交*/
function submitRegister(){
    $.ajax({
        type:"POST",
        url: "/register/submit",
        async: false,
        data:$("#registerForm").serialize(),
        success: function (data) {
            alert(data.msg);
            if(data.code == 1){     //如果成功，刷新页面
                window.location.reload();
            }
        }
    });
}

/*登录提交*/
function submitLogin(){
    $.ajax({
        type:"POST",
        url: "/login/submit",
        async: false,
        data:$("#loginForm").serialize(),
        success: function (data) {
            alert(data.msg);
            if(data.code == 1){     //如果成功，刷新页面
                window.location.reload();
            }
        }
    });
}

/*保存房子信息*/
function submitHouse(){
    $.ajax({
        type:"POST",
        url: "/admin/house/publish/submit",
        async: false,
        data:$("#houseForm").serialize(),
        success: function (data) {
            alert(data.msg);
            if(data.code == 1){     //如果成功，刷新页面
                window.location.href="/admin/house";
            }
        }
    });
}

/*下架房子*/
function downHouse(id) {
    $.ajax({
        type:"POST",
        url: "/admin/house/down",
        async: false,
        data:{
            "id": id
        },
        success: function (data) {
            alert(data.msg);
            if(data.code == 1){     //如果成功，刷新页面
                window.location.reload();
            }
        }
    });
}

/*上架房子*/
function upHouse(id) {
    $.ajax({
        type:"POST",
        url: "/admin/house/up",
        async: false,
        data:{
            "id": id
        },
        success: function (data) {
            alert(data.msg);
            if(data.code == 1){     //如果成功，刷新页面
                window.location.reload();
            }
        }
    });
}

/*房子审核通过*/
function checkPassHouse(id) {
    $.ajax({
        type:"POST",
        url: "/admin/house/checkPass",
        async: false,
        data:{
            "id": id
        },
        success: function (data) {
            alert(data.msg);
            if(data.code == 1){     //如果成功，刷新页面
                window.location.reload();
            }
        }
    });
}

/*房子审核拒绝*/
function checkRejectHouse(id) {
    $.ajax({
        type:"POST",
        url: "/admin/house/checkReject",
        async: false,
        data:{
            "id": id
        },
        success: function (data) {
            alert(data.msg);
            if(data.code == 1){     //如果成功，刷新页面
                window.location.reload();
            }
        }
    });
}

/*删除*/
function deleteHouse(id) {
    $.ajax({
        type:"POST",
        url: "/admin/house/delete",
        async: false,
        data:{
            "id": id
        },
        success: function (data) {
            alert(data.msg);
            if(data.code == 1){     //如果成功，刷新页面
                window.location.reload();
            }
        }
    });
}


/*收藏房子提交*/
function submitMark(id) {
    $.ajax({
        type:"POST",
        url: "/mark/submit",
        async: false,
        data:{
            "houseId": id
        },
        success: function (data) {
            alert(data.msg);
            if(data.msg == "请先登录"){
                window.location.href = "/";
            }
        }
    });
}

/*创建订单*/
function createOrder() {
    var houseId = $("#houseId").val();
    var endDate = $("#endDate").val();
    $.ajax({
        type:"POST",
        url: "/order/create",
        async: false,
        data:{
            "houseId": houseId,
            "endDate": endDate
        },
        success: function (data) {
            alert(data.msg);
            if(data.msg == "请先登录"){
                window.location.href = "/";
            }
            //如果创建成功，跳转签订合同页面
            if(data.code == 1){
                window.location.href = "/order/agreement/view?orderId="+data.result;
            }
        }
    });
}

/*完成签订合同*/
function confirmAgreement(orderId) {
    $.ajax({
        type:"POST",
        url: "/order/agreement/submit",
        async: false,
        data:{
            "orderId": orderId
        },
        success: function (data) {
            alert(data.msg);
            if(data.msg == "请先登录"){
                window.location.href = "/";
            }
            //如果创建成功，跳转支付页面
            if(data.code == 1){
                window.location.href = "/order/pay?orderId="+data.result;
            }
        }
    });
}

/*模拟支付*/
function submitPay(orderId) {
    $.ajax({
        type:"POST",
        url: "/order/pay/submit",
        async: false,
        data:{
            "orderId": orderId
        },
        success: function (data) {
            alert(data.msg);
            if(data.msg == "请先登录"){
                window.location.href = "/";
            }
            //如果支付成功，跳转我的家
            if(data.code == 1){
                window.location.href = "/admin/home";
            }
        }
    });
}

/*发送邮件，联系房东*/
function submitContact() {
    $.ajax({
        type:"POST",
        url: "/house/contact",
        async: false,
        data: $('#contactForm').serialize(),
        success: function (data) {
            alert(data.msg);
            if(data.msg == "请先登录"){
                window.location.href = "/";
            }
            //如果发送成功，刷新当前页面
            if(data.code == 1){
                window.location.reload();
            }
        }
    });
}

/*个人信息保存*/
function submitProfile() {
    $.ajax({
        type:"POST",
        url: "/admin/profile/submit",
        async: false,
        data: $('#profileForm').serialize(),
        success: function (data) {
            alert(data.msg);
            //如果发送成功，刷新当前页面
            if(data.code == 1){
                window.location.reload();
            }
        }
    });
}

/*取消订单*/
function cancelOrder(orderId) {
    $.ajax({
        type:"POST",
        url: "/admin/order/cancel",
        async: false,
        data: {
            'orderId': orderId
        },
        success: function (data) {
            alert(data.msg);
            //如果发送成功，刷新当前页面
            if(data.code == 1){
                window.location.reload();
            }
        }
    });
}

/*申请退租*/
function endOrder(orderId) {
    $.ajax({
        type:"POST",
        url: "/admin/order/end",
        async: false,
        data: {
            'orderId': orderId
        },
        success: function (data) {
            alert(data.msg);
            //如果发送成功，刷新当前页面
            if(data.code == 1){
                window.location.reload();
            }
        }
    });
}

/*退租申请通过*/
function endOrderPass(orderId) {
    $.ajax({
        type:"POST",
        url: "/admin/order/endPass",
        async: false,
        data: {
            'orderId': orderId
        },
        success: function (data) {
            alert(data.msg);
            //如果发送成功，刷新当前页面
            if(data.code == 1){
                window.location.reload();
            }
        }
    });
}

/*退租申请拒绝*/
function endOrderReject(orderId) {
    $.ajax({
        type:"POST",
        url: "/admin/order/endReject",
        async: false,
        data: {
            'orderId': orderId
        },
        success: function (data) {
            alert(data.msg);
            //如果发送成功，刷新当前页面
            if(data.code == 1){
                window.location.reload();
            }
        }
    });
}

/*取消收藏*/
function cancelMark(id) {
    $.ajax({
        type:"POST",
        url: "/admin/mark/cancel",
        async: false,
        data: {
            'id': id
        },
        success: function (data) {
            alert(data.msg);
            //如果发送成功，刷新当前页面
            if(data.code == 1){
                window.location.reload();
            }
        }
    });
}

/*删除新闻*/
function deleteNews(id) {
    $.ajax({
        type:"POST",
        url: "/admin/news/delete",
        async: false,
        data: {
            'id': id
        },
        success: function (data) {
            alert(data.msg);
            //如果发送成功，刷新当前页面
            if(data.code == 1){
                window.location.reload();
            }
        }
    });
}

/*保存新闻资讯*/
function submitNews(){
    $.ajax({
        type:"POST",
        url: "/admin/news/publish/submit",
        async: false,
        data:$("#newsForm").serialize(),
        success: function (data) {
            alert(data.msg);
            if(data.code == 1){     //如果成功，刷新页面
                window.location.href="/admin/news";
            }
        }
    });
}

/*提交用户反馈信息*/
function submitFeedback(){
    $.ajax({
        type:"POST",
        url: "/feedback/submit",
        async: false,
        data:$("#feedbackForm").serialize(),
        success: function (data) {
            alert(data.msg);
            if(data.code == 1){     //如果成功，刷新页面
                window.location.reload();
            }
        }
    });
}

/*给回复提交的id赋值*/
function showReplyModal(id) {
    $("#feedbackId").val(id);
}

/*提交用户反馈信息*/
function feebackReplySubmit(){
    $.ajax({
        type:"POST",
        url: "/admin/feedback/reply/submit",
        async: false,
        data:$("#feedbackForm").serialize(),
        success: function (data) {
            alert(data.msg);
            if(data.code == 1){     //如果成功，刷新页面
                window.location.reload();
            }
        }
    });
}

/*删除反馈*/
function deleteFeedback(id) {
    $.ajax({
        type:"POST",
        url: "/admin/feedback/delete",
        async: false,
        data: {
            'id': id
        },
        success: function (data) {
            alert(data.msg);
            //如果发送成功，刷新当前页面
            if(data.code == 1){
                window.location.reload();
            }
        }
    });
}

/*禁用用户*/
function disableUser(id) {
    $.ajax({
        type:"POST",
        url: "/admin/user/disable",
        async: false,
        data: {
            'id': id
        },
        success: function (data) {
            alert(data.msg);
            //如果发送成功，刷新当前页面
            if(data.code == 1){
                window.location.reload();
            }
        }
    });
}

/*启用用户*/
function enableUser(id) {
    $.ajax({
        type:"POST",
        url: "/admin/user/enable",
        async: false,
        data: {
            'id': id
        },
        success: function (data) {
            alert(data.msg);
            //如果发送成功，刷新当前页面
            if(data.code == 1){
                window.location.reload();
            }
        }
    });
}


/*更新密码*/
function submitPassword() {
    $.ajax({
        type:"POST",
        url: "/admin/password/submit",
        async: false,
        data:$("#passwordForm").serialize(),
        success: function (data) {
            alert(data.msg);
            //如果发送成功，刷新当前页面
            if(data.code == 1){
                window.location.reload();
            }
        }
    });
}

