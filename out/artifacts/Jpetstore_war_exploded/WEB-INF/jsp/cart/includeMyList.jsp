<%--
  Created by IntelliJ IDEA.
  User: 。
  Date: 2022/11/7
  Time: 8:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <p>Pet Favorites <br />
        你可能喜欢</p>
    <ul>
        <c:forEach var="product" items="${sessionScope.myList}">
            <li>
                <a href="productForm?productId=${product.productId}">${product.name}</a>
                (${product.productId})</li>
        </c:forEach>
    </ul>
</head>
<body>

</body>
</html>

