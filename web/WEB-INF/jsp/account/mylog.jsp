<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>MyLog</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jpetstore_mylog.css">
    <script src="https://kit.fontawesome.com/59c20db7cc.js" crossorigin="anonymous"></script>
    <style>
        table,
        tbody {
            display: block;
            height: 300px;
            width: 0 auto;
            border: 0;
            border-spacing: 0;
            border-collapse: collapse;
            cursor: default;
            font-size: 20px;
        }

        tbody {
            overflow-y: scroll;
        }

        table thead,
        tbody tr {
            display: table;
            width: 100%;
            height: 30px;
            table-layout: fixed;
        }

        table thead {
            width: calc(100% - 1em)
        }

        table thead th {
            background: #34aeb7;
            width: 20%;
        }

        table tbody td {
            width: 20%;
            text-align: center;
        }
    </style>
</head>

<body>
<h1 class="shop-name">宠物商店</h1>
<div class="user">
    <div class="user-content">
        <div class="user-title">
            <h2>${sessionScope.loginAccount.username}的历史记录</h2>
        </div>

        <form class="user-form">

            <table border="1">
                <thead>
                <tr>
                    <th>历史记录</th>
                    <th>时间</th>
                </tr>
                </thead>
                <tbody>
                <%-- 这是注释 --%>
                <c:forEach var="myLog" items="${sessionScope.myLogList}">
                    <tr>
                        <td>${myLog.behavior}</td>
                        <td>${myLog.time}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <div class="user-form-link-sign">
                    <a href="myAccountForm" class="link">返回我的账户>></a>
            </div>
        </form>
    </div>

</div>
</body>

</html>