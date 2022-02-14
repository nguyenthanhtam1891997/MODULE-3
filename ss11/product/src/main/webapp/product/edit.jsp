<%--
  Created by IntelliJ IDEA.
  User: tinh3
  Date: 14/02/2022
  Time: 16:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Edit product</title>
</head>
<body>
<h1>Edit product</h1>
<p>
    <c:if test="${message != null}">
        <span class="message">${message}</span>
    </c:if>
</p>
<p>
    <a href="/productList">Back to product list</a>
</p>
<%--private String name;--%>
<%--private double price;--%>
<%--private String description;--%>
<%--private String producer;--%>
<form method="post">
    <fieldset>
        <legend>Product information</legend>
        <table>
        <tr>
            <td>Name</td>
            <td><input type="text" name="name" id="name" value="${product.name}" ></td>
        </tr>
        <tr>
            <td>Price</td>
            <td><input type="text" name="price" id="price" value="${product.price}"></td>
        </tr>
        <tr>
            <td>Description</td>
            <td><input type="text" name="description" id="description" value="${product.description}"></td>
        </tr>
        <tr>
            <td>producer</td>
            <td><input type="text" name="producer" id="producer" value="${product.producer}"></td>
        </tr>
        <tr>
            <td></td>
            <td><input type="submit" value="Update product"></td>
        </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
