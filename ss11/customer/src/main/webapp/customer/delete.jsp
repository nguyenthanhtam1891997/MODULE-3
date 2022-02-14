<%--
  Created by IntelliJ IDEA.
  User: tinh3
  Date: 14/02/2022
  Time: 11:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Deleting customer</title>
</head>
<body>
<h1>Delete customer</h1>
<p>
  <a href="/customers">Back to customers list</a>
</p>
<form method="post" >
  <h3>Are you sure?</h3>
  <fieldset>
    <legend>Customer information</legend>
    <table>
      <tr>
        <td>Name</td>
        <td>${customer.getName()}</td>
      </tr>
      <tr>
        <td>Name</td>
        <td>${customer.getEmail()}</td>
      </tr>
      <tr>
        <td>Name</td>
        <td>${customer.getAddress()}</td>
      </tr>
      <tr>
        <td><input type="submit" value="Delete customer"></td>
        <td><a href="/customers">Back to customer list</a></td>
      </tr>
    </table>

  </fieldset>
</form>
</body>
</html>
