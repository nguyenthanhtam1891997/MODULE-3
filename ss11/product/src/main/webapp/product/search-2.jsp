<%--
  Created by IntelliJ IDEA.
  User: tinh3
  Date: 14/02/2022
  Time: 19:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Result search</title>
</head>
<body>
<h1>Result search</h1>
<p>
    <a href="/productList">Back to product list</a>
</p>
<table border="1">
    <tr>
        <td>ID</td>
        <td>Name</td>
        <td>Price</td>
        <td>Description</td>
        <td>Producer</td>

    </tr>
    <c:forEach items="${list}" var="product">
        <tr>
            <td>${product.id}</td>
            <td>${product.name}</td>
            <td>${product.price}</td>
            <td>${product.description}</td>
            <td>${product.producer}</td>


        </tr>
    </c:forEach>
</table>
</body>
</html>
