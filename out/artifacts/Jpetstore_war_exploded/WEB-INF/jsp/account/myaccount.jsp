<%--
  Created by IntelliJ IDEA.
  User: 刘飘
  Date: 2022/11/11
  Time: 0:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>




<head>
    <meta charset="UTF-8">
    <title>我的账户</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jpetstore.css">
    <script src="https://kit.fontawesome.com/59c20db7cc.js" crossorigin="anonymous"></script>
</head>

<body>
<h1 class="shop-name">宠物商店</h1>
<div class="user">
    <div class="user-content">
        <div class="user-title">
            <h2>我的账户</h2>
        </div>
        <form action="listOrderForm" class="user-form" method="POST">
            <div class="user-form-item">
                <label class="user-form-label-icon">
                    <i class="fa-solid fa-user"></i>
                </label>
                <input type="text" class="user-form-input" autocomplete="off" value="${sessionScope.loginAccount.username}" disabled>
            </div>
            <div class="user-form-item">
                <label class="user-form-label-icon">
                    <i class="fa-solid fa-envelope"></i>
                </label>
                <input type="password" class="user-form-input" autocomplete="off" value="${sessionScope.loginAccount.password}" disabled>
            </div>
            <div class="user-form-item">
                <label class="user-form-label-icon">
                    <i class="fa-solid fa-location-dot"></i>
                </label>
                <input type="text" class="user-form-input" autocomplete="off" value="${sessionScope.loginAccount.address1}" disabled>
            </div>
            <div class="user-form-item">
                <label class="user-form-label-icon">
                    <i class="fa-solid fa-phone"></i>
                </label>
                <input type="text" class="user-form-input" autocomplete="off" value="${sessionScope.loginAccount.phone}" disabled>
            </div>
            <div class="user-form-item">
                <input type="submit" value="查看我的订单" class="user-form-submit-register">
            </div>
            <div class="user-form-link-change">
                <a href="MyAccountToCompleteServlet" class="link">去修改我的信息</a>
            </div>
            <div class="user-form-link-history">
                <a href="myLogForm" class="link">查看我的历史</a>
            </div>
            <div class="user-form-link-history" >
                <a href="mainForm" class="link"  style="bottom: 380px;"><< 返回主页</a>
            </div>
        </form>
    </div>

</div>
</body>

</html>