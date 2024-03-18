<%@ include file="../common/top.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="BackLink">
    <a href="mainForm">Return to Main Menu</a>
</div>


<div id="Catalog">
    <c:if test="${empty sessionScope.productList}">
        <h2>未搜索到相关商品</h2>
        <br>
        <br>
        <br>
        <br>
        <br>
    </c:if>
<c:if test="${not empty sessionScope.productList}">
    <table>
        <tr>
            <th>&nbsp;</th>
            <th>Product ID</th>
            <th>Name</th>
        </tr>
        <c:forEach var="product" items="${sessionScope.productList}">
            <tr>
                <td>
                    <a href="productForm?productId=${product.productId}">${product.description}</a>
                </td>

                <td>
                    <a href="productForm?productId=${product.productId}">
                        <font color="BLACK">${product.productId}</font>
                    </a>
                </td>
                <td>${product.name}</td>
            </tr>
        </c:forEach>
        <tr>
            <td></td>
        </tr>
    </table>
</c:if>
</div>
<%@ include file="../common/bottom.jsp"%>