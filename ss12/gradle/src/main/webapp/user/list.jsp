<%--
  Created by IntelliJ IDEA.
  User: tinh3
  Date: 15/02/2022
  Time: 14:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<%--<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.4/css/jquery.dataTables.min.css">--%>
<head>
    <title>User Management Application</title>

</head>
<body>
<center>
    <h1><a href="/users">User Management</a></h1>
    <h2>
        <a href="/users?action=create">Add New User</a>
    </h2>
    <form action="/users?action=search" method="post">
        <input type="text" name="country">
        <input type="submit" value="search country">
    </form>
</center>
<div align="center">
    <caption><h2>List of Users</h2></caption>
<table border="1" >
<%--    id="example" class="table table-striped " style="width:70%"--%>

    <thead>
<%--    <caption><h2>List of Users</h2></caption>--%>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Email</th>
        <th>Country</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="user" items="${listUser}">
        <tr>
            <td><c:out value="${user.id}"/></td>
            <td><c:out value="${user.name}"/></td>
            <td><c:out value="${user.email}"/></td>
            <td><c:out value="${user.country}"/></td>
            <td>
                <a href="/users?action=edit&id=${user.id}">Edit</a>
                <a href="/users?action=delete&id=${user.id}">Delete</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</div>
<%--<script src="https://code.jquery.com/jquery-3.5.1.js"></script>--%>
<%--<script src="https://cdn.datatables.net/1.11.4/js/jquery.dataTables.min.js"></script>--%>
<%--<script src="https://cdn.datatables.net/1.11.4/js/dataTables.bootstrap5.min.js"></script>--%>
<%--<script>--%>
<%--    $(document).ready(function () {--%>
<%--        $("#example").DataTable();--%>
<%--    });--%>
<%--</script>--%>
</body>
</html>
