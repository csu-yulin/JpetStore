<%--
  Created by IntelliJ IDEA.
  User: 。
  Date: 2022/11/6
  Time: 23:01
  To change this template use File | Settings | File Templates.
--%>

</div >
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="PoweredBy">&nbsp PoweredBy <a href="http://www.csu.edu.cn">www.csu.edu.cn</a>
</div>
<div id="Banner">

    <c:if test="${sessionScope.loginAccount == null }">
        您还未登录
    </c:if>
    <c:if test="${sessionScope.loginAccount != null }">
        <c:if test="${sessionScope.loginAccount.bannerOption}">
            ${sessionScope.loginAccount.bannerName}
        </c:if>
    </c:if>

</div>

<script src="js/productAuto.js"></script>
</body>
</html>
