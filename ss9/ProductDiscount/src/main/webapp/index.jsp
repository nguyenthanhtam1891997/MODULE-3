<%--
  Created by IntelliJ IDEA.
  User: tinh3
  Date: 25/01/2022
  Time: 21:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
    <form method="post" action="calculator">
      <label style="width: 500px">Product Description:</label>
      <input type="text" name="name_product"><br/>
      <label style="width: 500px"> List Price:</label>
     <input type="text" name="price"><br/>
      <label style="width: 500px">  Discount Percent:</label>
      <input type="text" name="discount">
        <button type="submit">Calculate Discount</button>
    </form>
  </body>
</html>
