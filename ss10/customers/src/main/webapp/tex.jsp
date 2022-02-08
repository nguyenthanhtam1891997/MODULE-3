<%--
  Created by IntelliJ IDEA.
  User: tinh3
  Date: 08/02/2022
  Time: 11:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>danh sach khach hang</h2>
<table border="1">
    <tr>
        <th>ten</th>
        <th>ngay sinh</th>
        <th>dia chi</th>
        <th>anh</th>
    </tr>
<c:forEach var="customer" items="${listCustomers}">
    <tr>
        <td><c:out value="${customer.name}"></c:out></td>
        <td><c:out value="${customer.dayOfBirth}"></c:out></td>
        <td>${customer.address}</td>
        <td><img src="${customer.photo}" width="100px"></td>
    </tr>
</c:forEach>

</table>
</body>
</html>
