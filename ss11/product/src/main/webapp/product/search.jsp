<%--
  Created by IntelliJ IDEA.
  User: tinh3
  Date: 14/02/2022
  Time: 18:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Search product</title>
</head>
<body>
<h1>Search product</h1>
<p>
    <a href="/productList">Back to product list</a>
</p>
<form method="post">
    <input type="text" name="nameProduct" id="nameProduct">
    <input type="submit" value="Search product">
</form>
</body>
</html>
