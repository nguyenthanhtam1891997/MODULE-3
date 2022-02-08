<%--
  Created by IntelliJ IDEA.
  User: tinh3
  Date: 08/02/2022
  Time: 17:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <h1>Simple Calculator</h1>
  <form action="/calculate" method="post">
    <fieldset>
      <legend>CALCULATE</legend>
      <table>
        <tr>
          <td>First operand: </td>
          <td><input type="text" name="first_num"> </td>
        </tr>
        <tr>
          <td>Operator: </td>
          <td>
            <select name="operator">
              <option value="+">Add</option>
              <option value="-">Sub</option>
              <option value="*">Mul</option>
              <option value="/">Div</option>
            </select>
          </td>
        </tr>
        <tr>
          <td>Second operand: </td>
          <td><input type="text" name="second_num"></td>
        </tr>
        <tr>
          <td></td>
          <td><input type="submit" value="calculate"></td>
        </tr>
      </table>
    </fieldset>
  </form>
  </body>
</html>
