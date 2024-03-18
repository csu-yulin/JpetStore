<%@ include file="../common/top.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="Catalog">
        <form action="checkShipping" method="post">
            <table>
                <table>
                    <tr>
                        <th colspan=2>Payment Details</th>
                    </tr>
                    <tr>
                        <td>银行卡类型:</td>
                        <td>
                            <select name="order.cardType">
                                <option value="建设银行">建设银行</option>
                                <option value="邮政银行">邮政银行</option>
                                <option value="人民银行">人民银行</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>银行卡号:</td>
                           <td>
                               <input type="text" name="order.creditCard" value="222 222 222">
                           </td>
                    </tr>
                    <tr>
                        <td>Expiry Date (MM/YYYY):</td>
                        <td><input type="text" name="order.expiryDate" value="11/11"></td>
                    </tr>
                    <tr>
                        <th colspan=2>Billing Address</th>
                    </tr>

                    <tr>
                        <td>First name:</td>
                        <td><input type="text" name="order.billToFirstName" value="${sessionScope.loginAccount.firstName}"></td>
                    </tr>
                    <tr>
                        <td>Last name:</td>
                        <td><input type="text" name="order.billToLastName" value="${sessionScope.loginAccount.lastName}"></td>
                    </tr>
                    <tr>
                        <td>Address 1:</td>
                        <td><input type="text" name="order.billAddress1" value="${sessionScope.loginAccount.address1}"></td>
                    </tr>
                    <tr>
                        <td>Address 2:</td>
                        <td><input type="text" name="order.billAddress2" value="${sessionScope.loginAccount.address2}"></td>
                    </tr>
                    <tr>
                        <td>City:</td>
                        <td><input type="text" name="order.billCity" value="${sessionScope.loginAccount.city}"></td>
                    </tr>
                    <tr>
                        <td>State:</td>
                        <td><input type="text" size="4" name="order.billState" value="${sessionScope.loginAccount.state}"></td>
                    </tr>
                    <tr>
                        <td>Zip:</td>
                        <td><input type="text" size="10" name="order.billZip" value="${sessionScope.loginAccount.zip}"></td>
                    </tr>
                    <tr>
                        <td>Country:</td>
                        <td><input type="text" size="15" name="order.billCountry" value="${sessionScope.loginAccount.country}"></td>
                    </tr>

                    <tr>
                        <td colspan=2>
                        <input type="checkbox" name="shippingAddressRequired">
                            Ship to different address...</td>
                    </tr>

                </table>
            </table>
            <input type="submit" name="newOrder" value="Continue" >
        </form>

</div>
<%@ include file="../common/bottom.jsp"%>