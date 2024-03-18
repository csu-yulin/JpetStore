
<%@ include file="../common/top.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="js/jquery-3.6.2.min.js"></script>
<link rel="StyleSheet" href="${pageContext.request.contextPath}/css/newOrder.css" type="text/css" media="screen" />

<div id="Content">
<div id="BackLink">
<a href="mainForm">Return to Main Menu</a>
</div>
<div id="Catalog">

    <div id="Cart">

      <h2>Shopping Cart</h2>

      <form action="updateCart" method="post">
        <table>
          <tr>
            <th><b>Item ID</b></th>
            <th><b>Product ID</b></th>
            <th><b>Description</b></th>
            <th><b>In Stock?</b></th>
            <th><b>Quantity</b></th>
            <th><b>List Price</b></th>
            <th><b>Total Cost</b></th>
            <th>&nbsp;</th>
          </tr>

          <c:if test="${sessionScope.cart == null}">
            <tr>
              <td colspan="8"><b>Your cart is empty.</b></td>
            </tr>
          </c:if>

          <c:if test="${sessionScope.cart.numberOfItems == 0}">
            <tr>
              <td colspan="8"><b>Your cart is empty.</b></td>
            </tr>
          </c:if>


          <c:forEach var="cartItem" items="${sessionScope.cart.cartItems}">
            <tr>
              <td>
                <a href="itemForm?itemId=${cartItem.item.itemId}">${cartItem.item.itemId}</a>
              </td>
              <td>${cartItem.item.product.productId}</td>
              <td>${cartItem.item.attribute1} ${cartItem.item.attribute2}
                  ${cartItem.item.attribute3} ${cartItem.item.attribute4}
                  ${cartItem.item.attribute5} ${cartItem.item.product.name}</td>
              <td>${cartItem.inStock}</td>
              <td style="display: flex">
                <a id="subQuantity" class="Sub" style="cursor: pointer">&nbsp-&nbsp</a>
                <input  name="${cartItem.item.itemId}" class="ItemQuantity" value="${cartItem.quantity}" disabled="disabled">
                <a id="addQuantity" class="Add" style="cursor: pointer">&nbsp+&nbsp</a>
              </td>

              <td class="listPrice" value="${cartItem.item.listPrice}"><fmt:formatNumber value="${cartItem.item.listPrice}"
                                    pattern="$#,##0.00" /></td>
              <td class="totalCost" value="${cartItem.total}"><fmt:formatNumber value="${cartItem.total}"
                                    pattern="$#,##0.00" /></td>
              <td>
                <a href="removeCartItem?workingItemId=${cartItem.item.itemId}" class="Button">Remove</a>
              </td>
            </tr>
          </c:forEach>
          <c:if test="${sessionScope.cart.numberOfItems>0}">
          <tr>
            <td colspan="7" id="subTotal" >
              Sub Total: <fmt:formatNumber value="${sessionScope.cart.subTotal}" pattern="$#,##0.00" />

                <input type="submit" value="刷新购物车">
            </td>
            <td>&nbsp;</td>
          </tr>
          </c:if>
        </table>
      </form>

      <c:if test="${sessionScope.cart.numberOfItems > 0}">
        <input type="button" class="Button" id="OKBtn" value="确认订单">
<%--        <a href="newOrderForm" class="Button" id="OKBtn">确认订单</a>--%>
      </c:if>
    </div>

    <div id="MyList">
      <c:if test="${sessionScope.loginAccount != null}">
        <c:if test="${sessionScope.loginAccount.listOption}">
          <%@ include file="includeMyList.jsp"%>
        </c:if>
      </c:if>
    </div>

    <div id="Separator">&nbsp;</div>
  </div>
</div>

<%--以下内容为扩展内容--%>
<div id="cover"></div>
<div id="background">
<%--newOrder.jsp--%>
<div id="Catalog" class="newOrder">
  <form id="checkShipping" method="post">
<%--    <form action="checkShipping" method="post">--%>
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
<%--confirmOrder.jsp--%>
<div id="Catalog" class="confirmOrder">Please confirm the information below and then
    press continue...

    <table>
      <tr>
        <th align="center" colspan="2"><font size="4"><b>Order</b></font>
          <br />
          <font size="3">
            <b> <fmt:formatDate
                    value="${sessionScope.order.orderDate}" pattern="yyyy/MM/dd hh:mm:ss" />
            </b></font>
        </th>
      </tr>

      <tr>
        <th colspan="2">Billing Address</th>
      </tr>
      <tr>
        <td>First name:</td>
        <td><c:out value="${sessionScope.order.billToFirstName}" /></td>
      </tr>
      <tr>
        <td>Last name:</td>
        <td><c:out value="${sessionScope.order.billToLastName}" /></td>
      </tr>
      <tr>
        <td>Address 1:</td>
        <td><c:out value="${sessionScope.order.billAddress1}" /></td>
      </tr>
      <tr>
        <td>Address 2:</td>
        <td><c:out value="${sessionScope.order.billAddress2}" /></td>
      </tr>
      <tr>
        <td>City:</td>
        <td><c:out value="${sessionScope.order.billCity}" /></td>
      </tr>
      <tr>
        <td>State:</td>
        <td><c:out value="${sessionScope.order.billState}" /></td>
      </tr>
      <tr>
        <td>Zip:</td>
        <td><c:out value="${sessionScope.order.billZip}" /></td>
      </tr>
      <tr>
        <td>Country:</td>
        <td><c:out value="${sessionScope.order.billCountry}" /></td>
      </tr>
      <tr>
        <th colspan="2">Shipping Address</th>
      </tr>
      <tr>
        <td>First name:</td>
        <td><c:out value="${sessionScope.order.shipToFirstName}" /></td>
      </tr>
      <tr>
        <td>Last name:</td>
        <td><c:out value="${sessionScope.order.shipToLastName}" /></td>
      </tr>
      <tr>
        <td>Address 1:</td>
        <td><c:out value="${sessionScope.order.shipAddress1}" /></td>
      </tr>
      <tr>
        <td>Address 2:</td>
        <td><c:out value="${sessionScope.order.shipAddress2}" /></td>
      </tr>
      <tr>
        <td>City:</td>
        <td><c:out value="${sessionScope.order.shipCity}" /></td>
      </tr>
      <tr>
        <td>State:</td>
        <td><c:out value="${sessionScope.order.shipState}" /></td>
      </tr>
      <tr>
        <td>Zip:</td>
        <td><c:out value="${sessionScope.order.shipZip}" /></td>
      </tr>
      <tr>
        <td>Country:</td>
        <td><c:out value="${sessionScope.order.shipCountry}" /></td>
      </tr>

    </table>


    <a href="viewOrderForm?confirmed=true" class="Button">
      提交订单
    </a>
  </div>
<%--shippingForm.jsp--%>
<div id="Catalog" class="shippingForm">
  <form id="confirmOrderForm" method="post">
<%--    <form action="confirmOrderForm" method="post">--%>

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
</div>


<script src="js/changeQuantity.js"></script>

<%@ include file="../common/bottom.jsp"%>