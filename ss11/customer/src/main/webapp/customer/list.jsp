<%--
  Created by IntelliJ IDEA.
  User: tinh3
  Date: 11/02/2022
  Time: 10:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Customer List</title>
</head>
<body>
    <h1>Customer</h1>
<p><a href="/customers?action=create">create</a></p>
<table border="1">
    <tr>
        <td>Id</td>
        <td>Name</td>
        <td>Email</td>
        <td>Address</td>
        <td>Edit</td>
        <td>Delete</td>
    </tr>
    <c:forEach items="${list}" var="customer">
        <tr>
            <td>${customer.id}</td>
            <td><a href="/customers?action=view&id=${customer.id}">${customer.name}</a></td>
            <td>${customer.email}</td>
            <td>${customer.address}</td>
            <td><a href="/customers?action=edit&id=${customer.id}">edit</a></td>
            <td><a href="/customers?action=delete&id=${customer.id}">delete</a></td>


        </tr>
    </c:forEach>
</table>
</body>
</html>
