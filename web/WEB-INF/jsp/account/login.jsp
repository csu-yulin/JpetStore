<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>用户登录</title>
    <link rel="StyleSheet" href="${pageContext.request.contextPath}/css/jpetstore.css" type="text/css" media="screen" />
    <script src="https://kit.fontawesome.com/86975a020b.js" crossorigin="anonymous"></script>
    <script src="js/jquery-3.6.2.min.js"></script>
</head>
<body >
<h1 class="shop-name">宠物商店</h1>
<div class="user">
    <div class="user-content">
        <div class="user-title">
            <h2>欢迎登录</h2>
        </div>
        <form class="user-form" method="POST" id="loginForm">
            <div class="position">
                <div class="user-form-error">
                    <i class="fa-solid fa-circle-exclamation error-icon" id="icon-exclamation"></i>
                    <p class="errormsg" id="errormsg"></p>
                </div>
            </div>
            <div class="user-form-item">
                <label for="email" class="user-form-label-icon">
                    <i class="fa-solid fa-user"></i>
                </label>
                <input type="text" class="user-form-input" name="email" id="email" placeholder="请输入用户邮箱" autocomplete="off">
            </div>
            <div class="user-form-item">
                <label class="user-form-label-icon">
                    <i class="fa-solid fa-lock"></i>
                </label>
                <input type="password" class="user-form-input" name="password" id="password" placeholder="请输入密码 " autocomplete="off " >

            </div>
            <div class="user-form-item">
                <label class="user-form-label-icon">
                    <i class="fa-solid fa-square-check"></i>
                </label>
                <input type="text" class="user-form-input" style="width: 150px;" name="vcode" id="vcode" placeholder="请输入验证码 " autocomplete="off " />
                <input type="button" id="btnGetVcode" class="user-form-button"   style="cursor:pointer" value="获取验证码">
            </div>
            <div class="user-form-item">
                <label for="remember">
                    <input type="radio" value="" id="remember" name="remember"class="user-form-radio" >
                    <span class="user-form-radio">记住密码</span>
                </label>
            </div>
            <div class="user-form-link-QR">
                <a href="#" class="link">扫描二维码登录</a>
            </div>
            <div class="user-form-item">
                <input type="submit" value="登录" id="btn" name="btn" class="user-form-submit">
            </div>
            <div class="user-form-link-sign">
                <a href="registerForm" class="link">没有账号?点击此处进行注册</a>
            </div>
        </form>
    </div>
</div>
<script src="js/login.js"></script>
</body>
</html>