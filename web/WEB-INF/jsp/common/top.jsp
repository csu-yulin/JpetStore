<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>

<html>

<head>
  <title>MyPetStore</title>
  <link rel="StyleSheet" href="css/mypetstore.css" type="text/css" media="screen" />
  <script src="js/jquery-3.6.2.min.js"></script>
</head>

<body>
<div id="Header">

  <div id="Logo">
    <div id="LogoContent">
      <a href="mainForm"><img src="images/logo-topbar.gif" /></a>
    </div>
  </div>

  <div id="Menu">
    <div id="MenuContent">
      <a href="cartForm"><img align="middle" name="img_cart" src="images/cart.gif" /></a>
      <img align="middle" src="images/separator.gif" />
      <c:if test="${sessionScope.loginAccount == null}">
        <a href="loginForm">Sign In</a>
        <img align="middle" src="images/separator.gif" />
      </c:if>

      <c:if test="${sessionScope.loginAccount != null}">
        <a href="LogOut">Sign Out</a>
        <img align="middle" src="images/separator.gif" />
        <a href="${pageContext.request.contextPath}/myAccountForm"> My Account ${sessionScope.loginAccount.username}</a>
        <img align="middle" src="images/separator.gif" />
      </c:if>
      <a href="help.html">?</a>
    </div>
  </div>

  <div id="Search">
    <div id="SearchContent">
      <div id="position">
      <form action="searchForm" method="post">
        <input type="text" name="keyword" size="14" id="keyword" class="search">
        <input type="submit" value="搜索" style="cursor: pointer">
        <span style="color: red; font-size: small; ">${requestScope.searchErrorMsg}</span>
      </form>
      <div id="AutoSearchComplete">
       <ul id="autoProductList">
<%--         <li class="productAutoItem">amazon parrot</li>--%>
<%--         <li class="productAutoItem">angelfish</li>--%>
<%--         <li class="productAutoItem">tiger shark</li>--%>
<%--         <li class="productAutoItem">persian</li>--%>
<%--         <li class="productAutoItem">manx</li>--%>
<%--         <li class="productAutoItem">chihuahua</li>--%>
<%--         <li class="productAutoItem">dalmation</li>--%>
<%--         <li class="productAutoItem">labrador retriever</li>--%>
       </ul>
      </div>
      </div>
    </div>

  </div>

  <div id="QuickLinks">
    <a href="categoryForm?categoryId=FISH"><img src="images/sm_fish.gif" /></a>
    <img src="images/separator.gif" />
    <a href="categoryForm?categoryId=DOGS"><img src="images/sm_dogs.gif" /></a>
    <img src="images/separator.gif" />
    <a href="categoryForm?categoryId=REPTILES"><img src="images/sm_reptiles.gif" /></a>
    <img src="images/separator.gif" />
    <a href="categoryForm?categoryId=CATS"><img src="images/sm_cats.gif" /></a>
    <img src="images/separator.gif" />
    <a href="categoryForm?categoryId=BIRDS"><img src="images/sm_birds.gif" /></a>
  </div>

</div>

<div id="Content">