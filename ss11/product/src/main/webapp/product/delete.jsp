<%--
  Created by IntelliJ IDEA.
  User: tinh3
  Date: 14/02/2022
  Time: 17:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Deleting product</title>
</head>
<body>
<h1>Delete product</h1>
<p>
    <a href="/productList">Back to product list</a>
</p>
<form method="post">
    <h3>Are you sure?</h3>
<%--    private String name;--%>
<%--    private double price;--%>
<%--    private String description;--%>
<%--    private String producer;--%>
    <fieldset>
        <legend>Produce information</legend>
        <table>
            <tr>
                <td>Name</td>
                <td>${product.name}</td>
            </tr>
            <tr>
                <td>Price</td>
                <td>${product.price}</td>
            </tr>
            <tr>
                <td>Description</td>
                <td>${product.description}</td>
            </tr>
            <tr>
                <td>Producer</td>
                <td>${product.producer}</td>
            </tr>
            <tr>
                <td><input type="submit" value="Delete product"></td>
                <td><a href="/productList">Back to product list</a></td>
            </tr>

        </table>
    </fieldset>


</form>
</body>
</html>
