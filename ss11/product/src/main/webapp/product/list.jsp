<%--
  Created by IntelliJ IDEA.
  User: tinh3
  Date: 14/02/2022
  Time: 13:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Product List</title>
</head>
<body>
<h1>Product</h1>
<p><a href="/productList?action=create">Creeate</a></p>
<p><a href="/productList?action=search">Search</a></p>


<table border="1">
    <tr>
        <td>ID</td>
        <td>Name</td>
        <td>Price</td>
        <td>Description</td>
        <td>Producer</td>
        <td>Edit</td>
        <td>Delete</td>
    </tr>

    <c:forEach items="${list}" var="product">
        <tr>
            <td>${product.id}</td>
            <td><a href="/productList?action=view&id=${product.id}">${product.name}</a></td>
            <td>${product.price}</td>
            <td>${product.description}</td>
            <td>${product.producer}</td>
            <td><a href="/productList?action=edit&id=${product.id}">edit</a></td>
            <td><a href="/productList?action=delete&id=${product.id}">delete</a></td>

        </tr>
    </c:forEach>

</table>
</body>
</html>
