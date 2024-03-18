<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>完善信息</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jpetstore_complete.css">
    <script src="https://kit.fontawesome.com/59c20db7cc.js" crossorigin="anonymous"></script>
    <script src="js/jquery-3.6.2.min.js"></script>
</head>
<body>
<h1 class="shop-name">宠物商店</h1>
<div class="user">
    <div class="user-content">
        <div class="user-title">
            <h2>完善信息</h2>
        </div>
        <form  class="user-form" method="POST" id="completeForm">
            <div class="position">
                <div class="user-form-error">
                    <i class="fa-solid fa-circle-exclamation error-icon" id="icon-exclamation"></i>
                    <p class="errormsg" id="errormsg"></p>
                </div>
            </div>
            <%--通过登录打开信息界面--%>
            <c:if test="${sessionScope.isRegister == null}">
                <div class="user-form-item">
                    <h2 class="user-form-head">
                        <p class="user-form-head_1">User Information</p>
                    </h2>
                    <div class="user-form-input_and_icon">
                        <label for="username" class="user-form-label-icon">
                            <i class="fa-solid fa-user"></i>
                        </label>
                        <c:if test="${empty sessionScope.loginAccount.username}">
                            <input type="text" class="user-form-input" name="username"  id="username" placeholder="用户ID" autocomplete="off"  >
                        </c:if>
                        <c:if test="${not empty sessionScope.loginAccount.username}">
                            <input type="text" class="user-form-input" name="username"  id="username" placeholder="用户ID" autocomplete="off" value="${sessionScope.loginAccount.username}" >
                        </c:if>
                        <label for="username" class="user-form-label-icon icon-correct" id="correct_11">
                            <i class="fa-solid fa-check"></i>
                        </label>
                        <label for="username" class="user-form-label-icon icon-error" id="error_11">
                            <i class="fa-solid fa-xmark"></i>
                        </label>
                    </div>
                    <div class="user-form-input_and_icon">
                        <label for="password" class="user-form-label-icon">
                            <i class="fa-solid fa-lock"></i>
                        </label>
                        <c:if test="${empty sessionScope.loginAccount.password}">
                            <input type="password" class="user-form-input" name="password"  id="password" placeholder="请输入新的密码" autocomplete="off">
                        </c:if>
                        <c:if test="${not empty sessionScope.loginAccount.password}">
                            <input type="password" class="user-form-input" name="password"  id="password" placeholder="请输入新的密码" autocomplete="off" value="${sessionScope.loginAccount.password}">
                        </c:if>
                        <label for="password" class="user-form-label-icon icon-correct" id="correct_12">
                            <i class="fa-solid fa-check"></i>
                        </label>
                        <label for="password" class="user-form-label-icon icon-error" id="error_12">
                            <i class="fa-solid fa-xmark"></i>
                        </label>
                    </div>
                    <div class="user-form-input_and_icon">
                        <label for="repeatPassword" class="user-form-label-icon">
                            <i class="fa-solid fa-lock"></i>
                        </label>
                        <c:if test="${empty sessionScope.loginAccount.password}">
                            <input type="password" class="user-form-input" name="repeatPassword"  placeholder="您不需要再确认密码" autocomplete="off" disabled>
                        </c:if>
                        <c:if test="${not empty sessionScope.loginAccount.password}">
                            <input type="password" class="user-form-input" name="repeatPassword"  placeholder="您不需要再确认密码" autocomplete="off"  disabled>
                        </c:if>
                    </div>
                </div>
                <div class="user-form-item">
                    <h2 class="user-form-head">
                        <p class="user-form-head_1">Profile Information</p>
                    </h2>
                    <div class="user-form-input_and_icon">
                        <label  class="user-form-label-icon">
                            <i class="fa-solid fa-earth-americas"></i>
                        </label>
                        <select name="languagePreference" class="user-form-input-select languagePreference" >
                            <c:if test="${empty sessionScope.loginAccount.languagePreference}">
                                <option class="user-form-input-select-first"  selected="selected" disabled>请选择您的语言偏好:</option>
                            </c:if>
                            <c:if test="${not empty sessionScope.loginAccount.languagePreference}">
                                <option class="user-form-input-select-first"  value="${sessionScope.loginAccount.languagePreference}" selected="selected" >${sessionScope.loginAccount.languagePreference}</option>
                            </c:if>
                            <option class="user-form-input-select" value="English">English</option>
                            <option class="user-form-input-select" value="Chinese">Chinese</option>
                        </select>
                    </div>
                    <div class="user-form-input_and_icon">
                        <label  class="user-form-label-icon">
                            <i class="fa-solid fa-dog"></i>
                        </label>
                        <select name="favouriteCategoryId" class="user-form-input-select favouriteCategoryId">
                            <c:if test="${empty sessionScope.loginAccount.favouriteCategoryId}">
                                <option class="user-form-input-select-first"  selected="selected" disabled>请选择您喜欢的动物:</option>
                            </c:if>
                            <c:if test="${not empty sessionScope.loginAccount.favouriteCategoryId}">
                                <option class="user-form-input-select-first"  value="${sessionScope.loginAccount.favouriteCategoryId}" selected="selected" >${sessionScope.loginAccount.favouriteCategoryId}</option>
                            </c:if>
                            <option class="user-form-input-select" value="BIRDS">BIRDS</option>
                            <option class="user-form-input-select" value="CATS">CATS</option>
                            <option class="user-form-input-select" value="DOGS">DOGS</option>
                            <option class="user-form-input-select" value="FISH">FISH</option>
                            <option class="user-form-input-select" value="REPTILES">REPTILES</option>
                        </select>
                    </div>
                </div>
                <div class="user-form_1-item">
                    <h2 class="user-form_1-head_a">
                        <p class="user-form_1-head_1_a">Account Information</p>
                    </h2>
                    <div class="user-form-input_and_icon">
                        <label for="firstName" class="user-form-label-icon">
                            <i class="fa-solid fa-signature"></i>
                        </label>
                        <c:if test="${empty sessionScope.loginAccount.firstName}">
                            <input type="text" class="user-form-input" name="firstName" id="firstName" placeholder="请输入姓氏" autocomplete="off">
                        </c:if>
                        <c:if test="${not empty sessionScope.loginAccount.firstName}">
                            <input type="text" class="user-form-input" name="firstName" id="firstName" placeholder="请输入姓氏" autocomplete="off" value="${sessionScope.loginAccount.firstName}">
                        </c:if>
                        <label for="firstName" class="user-form-label-icon icon-correct" id="correct_1">
                            <i class="fa-solid fa-check"></i>
                        </label>
                        <label for="firstName" class="user-form-label-icon icon-error" id="error_1">
                            <i class="fa-solid fa-xmark"></i>
                        </label>
                    </div>
                    <div class="user-form-input_and_icon">
                        <label for="lastName" class="user-form-label-icon">
                            <i class="fa-solid fa-signature"></i>
                        </label>
                        <c:if test="${empty sessionScope.loginAccount.lastName}">
                            <input type="text" class="user-form-input" name="lastName" id="lastName" placeholder="请输入名字" autocomplete="off">
                        </c:if>
                        <c:if test="${not empty sessionScope.loginAccount.lastName}">
                            <input type="text" class="user-form-input" name="lastName" id="lastName" placeholder="请输入名字" autocomplete="off" value="${sessionScope.loginAccount.lastName}">
                        </c:if>
                        <label for="lastName" class="user-form-label-icon icon-correct" id="correct_2">
                            <i class="fa-solid fa-check"></i>
                        </label>
                        <label for="lastName" class="user-form-label-icon icon-error" id="error_2">
                            <i class="fa-solid fa-xmark"></i>
                        </label>
                    </div>
                    <div class="user-form-input_and_icon">
                        <label for="email" class="user-form-label-icon">
                            <i class="fa-solid fa-envelope"></i>
                        </label>
                        <c:if test="${empty sessionScope.loginAccount.email}">
                            <input type="text" class="user-form-input" name="email" id="email" placeholder="请输入邮箱地址" autocomplete="off">
                        </c:if>
                        <c:if test="${not empty sessionScope.loginAccount.email}">
                            <input type="text" class="user-form-input" name="email" id="email" placeholder="请输入邮箱地址" autocomplete="off" value="${sessionScope.loginAccount.email}">
                        </c:if>
                        <label for="email" class="user-form-label-icon icon-correct" id="correct_3">
                            <i class="fa-solid fa-check"></i>
                        </label>
                        <label for="email" class="user-form-label-icon icon-error" id="error_3">
                            <i class="fa-solid fa-xmark"></i>
                        </label>
                    </div>
                    <div class="user-form-input_and_icon">
                        <label for="phone" class="user-form-label-icon">
                            <i class="fa-solid fa-phone"></i>
                        </label>
                        <c:if test="${empty sessionScope.loginAccount.phone}">
                            <input type="text" class="user-form-input" name="phone" id="phone" placeholder="请输入手机电话" autocomplete="off">
                        </c:if>
                        <c:if test="${not empty sessionScope.loginAccount.phone}">
                            <input type="text" class="user-form-input" name="phone" id="phone" placeholder="请输入手机电话" autocomplete="off" value="${sessionScope.loginAccount.phone}">
                        </c:if>
                        <label for="phone" class="user-form-label-icon icon-correct" id="correct_4">
                            <i class="fa-solid fa-check"></i>
                        </label>
                        <label for="phone" class="user-form-label-icon icon-error" id="error_4">
                            <i class="fa-solid fa-xmark"></i>
                        </label>
                    </div>
                    <div class="user-form-input_and_icon">
                        <label for="state" class="user-form-label-icon">
                            <i class="fa-brands fa-usps"></i>
                        </label>
                        <input type="text" class="user-form-input" name="state" id="state" placeholder="请输入您的状态" autocomplete="off" value="CA" disabled>
                        <label for="state" class="user-form-label-icon icon-correct" id="correct_5">
                            <i class="fa-solid fa-check"></i>
                        </label>
                        <label for="state" class="user-form-label-icon icon-error" id="error_5">
                            <i class="fa-solid fa-xmark"></i>
                        </label>
                    </div>
                    <!-- 另一侧 -->
                    <div class="user-form-side">
                        <div class="user-form-input_and_icon">
                            <label for="address1" class="user-form-label-icon">
                                <i class="fa-solid fa-location-dot"></i>
                            </label>
                            <c:if test="${empty sessionScope.loginAccount.address1}">
                                <input type="text" class="user-form-input" name="address1" id="address1" placeholder="请输入收货地址1" autocomplete="off">
                            </c:if>
                            <c:if test="${not empty sessionScope.loginAccount.address1}">
                                <input type="text" class="user-form-input" name="address1" id="address1" placeholder="请输入收货地址1" autocomplete="off" value="${sessionScope.loginAccount.address1}">
                            </c:if>
                            <label for="address1" class="user-form-label-icon icon-correct" id="correct_6">
                                <i class="fa-solid fa-check"></i>
                            </label>
                            <label for="address1" class="user-form-label-icon icon-error" id="error_6">
                                <i class="fa-solid fa-xmark"></i>
                            </label>
                        </div>
                        <div class="user-form-input_and_icon">
                            <label for="address2" class="user-form-label-icon">
                                <i class="fa-solid fa-location-dot"></i>
                            </label>
                            <c:if test="${empty sessionScope.loginAccount.address2}">
                                <input type="text" class="user-form-input" name="address2" id="address2" placeholder="请输入收货地址2" autocomplete="off">
                            </c:if>
                            <c:if test="${not empty sessionScope.loginAccount.address2}">
                                <input type="text" class="user-form-input" name="address2" id="address2" placeholder="请输入收货地址2" autocomplete="off" value="${sessionScope.loginAccount.address2}">
                            </c:if>
                            <label for="address2" class="user-form-label-icon icon-correct" id="correct_7">
                                <i class="fa-solid fa-check"></i>
                            </label>
                            <label for="address2" class="user-form-label-icon icon-error" id="error_7">
                                <i class="fa-solid fa-xmark"></i>
                            </label>
                        </div>
                        <div class="user-form-input_and_icon">
                            <label for="city" class="user-form-label-icon">
                                <i class="fa-solid fa-city"></i>
                            </label>
                            <c:if test="${empty sessionScope.loginAccount.city}">
                                <input type="text" class="user-form-input" name="city" id="city" placeholder="请输入您的城市" autocomplete="off">
                            </c:if>
                            <c:if test="${not empty sessionScope.loginAccount.city}">
                                <input type="text" class="user-form-input" name="city" id="city" placeholder="请输入您的城市" autocomplete="off" value="${sessionScope.loginAccount.city}">
                            </c:if>
                            <label for="city" class="user-form-label-icon icon-correct" id="correct_8">
                                <i class="fa-solid fa-check"></i>
                            </label>
                            <label for="city" class="user-form-label-icon icon-error" id="error_8">
                                <i class="fa-solid fa-xmark"></i>
                            </label>
                        </div>
                        <div class="user-form-input_and_icon">
                            <label for="zip" class="user-form-label-icon">
                                <i class="fa-solid fa-envelopes-bulk"></i>
                            </label>
                            <c:if test="${empty sessionScope.loginAccount.zip}">
                                <input type="text" class="user-form-input" name="zip" id="zip" placeholder="请输入邮政编码" autocomplete="off">
                            </c:if>
                            <c:if test="${not empty sessionScope.loginAccount.zip}">
                                <input type="text" class="user-form-input" name="zip" id="zip" placeholder="请输入邮政编码" autocomplete="off" value="${sessionScope.loginAccount.zip}">
                            </c:if>
                            <label for="zip" class="user-form-label-icon icon-correct" id="correct_9">
                                <i class="fa-solid fa-check"></i>
                            </label>
                            <label for="zip" class="user-form-label-icon icon-error" id="error_9">
                                <i class="fa-solid fa-xmark"></i>
                            </label>
                        </div>
                        <div class="user-form-input_and_icon">
                            <label for="country" class="user-form-label-icon">
                                <i class="fa-solid fa-globe"></i>
                            </label>
                            <c:if test="${empty sessionScope.loginAccount.country}">
                                <input type="text" class="user-form-input" name="country" id="country" placeholder="请输入所在国家" autocomplete="off">
                            </c:if>
                            <c:if test="${not empty sessionScope.loginAccount.country}">
                                <input type="text" class="user-form-input" name="country" id="country" placeholder="请输入所在国家" autocomplete="off" value="${sessionScope.loginAccount.country}">
                            </c:if>
                            <label for="country" class="user-form-label-icon icon-correct" id="correct_10">
                                <i class="fa-solid fa-check"></i>
                            </label>
                            <label for="country" class="user-form-label-icon icon-error" id="error_10">
                                <i class="fa-solid fa-xmark"></i>
                            </label>
                        </div>
                        <div class="user-form-bottom">
                            <label class="user-form-bottom-label_1">
                                <c:if test="${empty sessionScope.loginAccount.listOption}">
                                    <input type="checkbox" value="" id="listOption" name="listOption" class="user-form-bottom-checkbox" >
                                </c:if>
                                <c:if test="${sessionScope.loginAccount.listOption}">
                                    <input type="checkbox" value="" id="listOption" name="listOption" class="user-form-bottom-checkbox" checked="true">
                                </c:if>
                                <c:if test="${!sessionScope.loginAccount.listOption}">
                                    <input type="checkbox" value="" id="listOption" name="listOption" class="user-form-bottom-checkbox">
                                </c:if>
                                <span class="user-form-radio">Enable MyList</span>
                            </label>
                        </div>
                        <div class="user-form-bottom">
                            <label class="user-form-bottom-label_2">
                                <c:if test="${empty sessionScope.loginAccount.bannerOption}">
                                    <input type="checkbox" value="" id="bannerOption" name="bannerOption"class="user-form-bottom-checkbox" >
                                </c:if>
                                <c:if test="${sessionScope.loginAccount.bannerOption}">
                                    <input type="checkbox" value="" id="bannerOption" name="bannerOption"class="user-form-bottom-checkbox" checked="true">
                                </c:if>
                                <c:if test="${!sessionScope.loginAccount.bannerOption}">
                                    <input type="checkbox" value="" id="bannerOption" name="bannerOption" class="user-form-bottom-checkbox">
                                </c:if>
                                <span class="user-form-radio">Enable MyBanner</span>
                            </label>
                        </div>
                    </div>
                </div>
                <div class="user-form-item">
                    <input type="submit" value="保存信息" class="user-form-submit-save">
                </div>
            </c:if>

            <%--通过注册打开信息界面--%>
            <c:if test="${sessionScope.isRegister != null}">
                <div class="user-form-item">
                    <h2 class="user-form-head">
                        <p class="user-form-head_1">User Information</p>
                    </h2>
                    <div class="user-form-input_and_icon">
                        <label for="username" class="user-form-label-icon">
                            <i class="fa-solid fa-user"></i>
                        </label>
                        <input type="text" class="user-form-input" name="username" id="username" placeholder="用户ID" autocomplete="off" value="${sessionScope.loginAccount.username}" disabled>
                    </div>
                    <div class="user-form-input_and_icon">
                        <label for="password" class="user-form-label-icon">
                            <i class="fa-solid fa-lock"></i>
                        </label>
                        <input type="password" class="user-form-input" name="password" id="password" placeholder="请输入密码" autocomplete="off" value="${sessionScope.loginAccount.password}" disabled>
                    </div>
                    <div class="user-form-input_and_icon">
                        <label for="repeatPassword" class="user-form-label-icon">
                            <i class="fa-solid fa-lock"></i>
                        </label>
                        <input type="password" class="user-form-input" name="repeatPassword" id="repeatPassword" placeholder="请再次输入密码" autocomplete="off" value="${sessionScope.loginAccount.password}" disabled>
                    </div>
                </div>
                <div class="user-form-item">
                    <h2 class="user-form-head">
                        <p class="user-form-head_1">Profile Information</p>
                    </h2>
                    <div class="user-form-input_and_icon">
                        <label  class="user-form-label-icon">
                            <i class="fa-solid fa-earth-americas"></i>
                        </label>
                        <select name="languagePreference" class="user-form-input-select languagePreference" id="languagePreference">
                            <option class="user-form-input-select-first"  selected="selected" disabled>请选择您的语言偏好:</option>

                            <option class="user-form-input-select" value="English">English</option>
                            <option class="user-form-input-select" value="Chinese">Chinese</option>
                        </select>
                    </div>
                    <div class="user-form-input_and_icon">
                        <label  class="user-form-label-icon">
                            <i class="fa-solid fa-dog"></i>
                        </label>
                        <select name="favouriteCategoryId" class="user-form-input-select favouriteCategoryId" id="favouriteCategoryId">
                            <option class="user-form-input-select-first"  selected="selected" disabled>请选择您喜欢的动物:</option>
                            <option class="user-form-input-select" value="BIRDS">BIRDS</option>
                            <option class="user-form-input-select" value="CATS">CATS</option>
                            <option class="user-form-input-select" value="DOGS">DOGS</option>
                            <option class="user-form-input-select" value="FISH">FISH</option>
                            <option class="user-form-input-select" value="REPTILES">REPTILES</option>
                        </select>
                    </div>
                </div>
                <div class="user-form_1-item">
                    <h2 class="user-form_1-head_a">
                        <p class="user-form_1-head_1_a">Account Information</p>
                    </h2>
                    <div class="user-form-input_and_icon">
                        <label for="firstName" class="user-form-label-icon">
                            <i class="fa-solid fa-signature"></i>
                        </label>
                        <input type="text" class="user-form-input" name="firstName" id="firstName" placeholder="请输入姓氏" autocomplete="off">
                        <label for="firstName" class="user-form-label-icon icon-correct" id="correct_1">
                            <i class="fa-solid fa-check"></i>
                        </label>
                        <label for="firstName" class="user-form-label-icon icon-error" id="error_1">
                            <i class="fa-solid fa-xmark"></i>
                        </label>
                    </div>
                    <div class="user-form-input_and_icon">
                        <label for="lastName" class="user-form-label-icon">
                            <i class="fa-solid fa-signature"></i>
                        </label>
                        <input type="text" class="user-form-input" name="lastName" id="lastName" placeholder="请输入名字" autocomplete="off">

                        <label for="lastName" class="user-form-label-icon icon-correct" id="correct_2">
                            <i class="fa-solid fa-check"></i>
                        </label>
                        <label for="lastName" class="user-form-label-icon icon-error" id="error_2">
                            <i class="fa-solid fa-xmark"></i>
                        </label>
                    </div>
                    <div class="user-form-input_and_icon">
                        <label for="email" class="user-form-label-icon">
                            <i class="fa-solid fa-envelope"></i>
                        </label>
                        <input type="text" class="user-form-input" name="email" id="email" placeholder="请输入邮箱地址" autocomplete="off" value="${sessionScope.loginAccount.email}" disabled>
                        <label for="email" class="user-form-label-icon icon-correct" id="correct_3">
                            <i class="fa-solid fa-check"></i>
                        </label>
                        <label for="email" class="user-form-label-icon icon-error" id="error_3">
                            <i class="fa-solid fa-xmark"></i>
                        </label>
                    </div>
                    <div class="user-form-input_and_icon">
                        <label for="phone" class="user-form-label-icon">
                            <i class="fa-solid fa-phone"></i>
                        </label>
                        <input type="text" class="user-form-input" name="phone" id="phone" placeholder="请输入手机电话" autocomplete="off">

                        <label for="phone" class="user-form-label-icon icon-correct" id="correct_4">
                            <i class="fa-solid fa-check"></i>
                        </label>
                        <label for="phone" class="user-form-label-icon icon-error" id="error_4">
                            <i class="fa-solid fa-xmark"></i>
                        </label>
                    </div>
                    <div class="user-form-input_and_icon">
                        <label for="state" class="user-form-label-icon">
                            <i class="fa-brands fa-usps"></i>
                        </label>
                        <input type="text" class="user-form-input" name="state" id="state"  autocomplete="off" value="CA" disabled>
                        <label for="state" class="user-form-label-icon icon-correct" id="correct_5">
                            <i class="fa-solid fa-check"></i>
                        </label>
                        <label for="state" class="user-form-label-icon icon-error" id="error_5">
                            <i class="fa-solid fa-xmark"></i>
                        </label>
                    </div>
                    <!-- 另一侧 -->
                    <div class="user-form-side">
                        <div class="user-form-input_and_icon">
                            <label for="address1" class="user-form-label-icon">
                                <i class="fa-solid fa-location-dot"></i>
                            </label>
                            <input type="text" class="user-form-input" name="address1" id="address1" placeholder="请输入收货地址1" autocomplete="off">
                            <label for="address1" class="user-form-label-icon icon-correct" id="correct_6">
                                <i class="fa-solid fa-check"></i>
                            </label>
                            <label for="address1" class="user-form-label-icon icon-error" id="error_6">
                                <i class="fa-solid fa-xmark"></i>
                            </label>
                        </div>
                        <div class="user-form-input_and_icon">
                            <label for="address2" class="user-form-label-icon">
                                <i class="fa-solid fa-location-dot"></i>
                            </label>
                            <input type="text" class="user-form-input" name="address2" id="address2" placeholder="请输入收货地址2" autocomplete="off">
                            <label for="address2" class="user-form-label-icon icon-correct" id="correct_7">
                                <i class="fa-solid fa-check"></i>
                            </label>
                            <label for="address2" class="user-form-label-icon icon-error" id="error_7">
                                <i class="fa-solid fa-xmark"></i>
                            </label>
                        </div>
                        <div class="user-form-input_and_icon">
                            <label for="city" class="user-form-label-icon">
                                <i class="fa-solid fa-city"></i>
                            </label>
                            <input type="text" class="user-form-input" name="city" id="city" placeholder="请输入您的城市" autocomplete="off">
                            <label for="city" class="user-form-label-icon icon-correct" id="correct_8">
                                <i class="fa-solid fa-check"></i>
                            </label>
                            <label for="city" class="user-form-label-icon icon-error" id="error_8">
                                <i class="fa-solid fa-xmark"></i>
                            </label>
                        </div>
                        <div class="user-form-input_and_icon">
                            <label for="zip" class="user-form-label-icon">
                                <i class="fa-solid fa-envelopes-bulk"></i>
                            </label>
                            <input type="text" class="user-form-input" name="zip" id="zip" placeholder="请输入邮政编码" autocomplete="off">
                            <label for="zip" class="user-form-label-icon icon-correct" id="correct_9">
                                <i class="fa-solid fa-check"></i>
                            </label>
                            <label for="zip" class="user-form-label-icon icon-error" id="error_9">
                                <i class="fa-solid fa-xmark"></i>
                            </label>
                        </div>
                        <div class="user-form-input_and_icon">
                            <label for="country" class="user-form-label-icon">
                                <i class="fa-solid fa-globe"></i>
                            </label>
                            <input type="text" class="user-form-input" name="country" id="country" placeholder="请输入所在国家" autocomplete="off">
                            <label for="country" class="user-form-label-icon icon-correct" id="correct_10">
                                <i class="fa-solid fa-check"></i>
                            </label>
                            <label for="country" class="user-form-label-icon icon-error" id="error_10">
                                <i class="fa-solid fa-xmark"></i>
                            </label>
                        </div>
                        <div class="user-form-bottom">
                            <label class="user-form-bottom-label_1">
                                <input type="checkbox" value="" id="listOption" name="listOption" class="user-form-bottom-checkbox">
                                <span class="user-form-radio">Enable MyList</span>
                            </label>
                        </div>
                        <div class="user-form-bottom">
                            <label class="user-form-bottom-label_2">
                                <input type="checkbox" value="" id="bannerOption" name="bannerOption" class="user-form-bottom-checkbox">
                                <span class="user-form-radio">Enable MyBanner</span>
                            </label>
                        </div>
                    </div>
                </div>
                <div class="user-form-item">
                    <input type="submit" value="保存信息" class="user-form-submit-save">
                </div>
            </c:if>
        </form>
    </div>
</div>
<script src="js/complete.js"></script>
</body>
</html>