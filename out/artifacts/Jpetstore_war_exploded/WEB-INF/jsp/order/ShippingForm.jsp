<%@ include file="../common/top.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="Catalog">
    <form action="confirmOrderForm" method="post">

    <table>
        <tr>
            <th colspan=2>Shipping Address</th>
        </tr>

        <tr>
            <td>First name:</td>
            <td><input type="text" name="order.shipToFirstName" value="${sessionScope.loginAccount.firstName}"></td>
        </tr>
        <tr>
            <td>Last name:</td>
            <td><input type="text" name="order.shipToLastName" value="${sessionScope.loginAccount.lastName}"></td>
        </tr>
        <tr>
            <td>Address 1:</td>
            <td><input type="text" name="order.shipAddress1" value="${sessionScope.loginAccount.address1}"></td>
        </tr>
        <tr>
            <td>Address 2:</td>
            <td><input type="text" name="order.shipAddress2" value="${sessionScope.loginAccount.address2}"></td>
        </tr>
        <tr>
            <td>City:</td>
            <td><input type="text" name="order.shipCity" value="${sessionScope.loginAccount.city}"></td>
        </tr>
        <tr>
            <td>State:</td>
            <td><input type="text" name="order.shipState" value="${sessionScope.loginAccount.state}"></td>
        </tr>
        <tr>
            <td>Zip:</td>
            <td><input type="text" name="order.shipZip" value="${sessionScope.loginAccount.zip}"></td>
        </tr>
        <tr>
            <td>Country:</td>
            <td><input type="text" name="order.shipCountry" value="${sessionScope.loginAccount.country}"></td>
        </tr>


    </table>

    <input type="submit" name="newOrder" value="Continue" >

    </form>
</div>
<%@ include file="../common/bottom.jsp"%>