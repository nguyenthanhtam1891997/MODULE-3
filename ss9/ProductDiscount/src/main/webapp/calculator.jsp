<%--
  Created by IntelliJ IDEA.
  User: tinh3
  Date: 25/01/2022
  Time: 22:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <p>Product Description:<label><%=request.getAttribute("name")%></label></p>
    <p>List Price:<label><%=request.getAttribute("price")%></label></p>
    <p>Discount Percent:<label><%=request.getAttribute("discount")%></label></p>
    <p>Discount Amount:<label><%=request.getAttribute("amount")%></label></p>
    <p>Discount Price:<label><%=request.getAttribute("priceAmount")%></label></p>
</body>
</html>
