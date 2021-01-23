<%--
  Created by IntelliJ IDEA.
  User: sello
  Date: 1/22/2021
  Time: 4:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
</head>
<body>
<div class="container">
<div class="header">
    <div class="logo">
        <img src="img/PetsFinder.png" height="100px" width="100px" />
    </div>
</div>
<h1>Welcome <c:out value="${currentUser.firstName}">!</c:out></h1>

<form id="logoutForm" method="POST" action="/logout">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    <input type="submit" value="Logout!" type="button" class="btn btn-outline-secondary"/>
</form>

<table border="1px">
    <tr>
        <th>Name</th>
        <th>Email</th>
        <th colspan="2">Action</th>
    </tr>
    <c:forEach items="${users}" var="user">
    <tr>
        <td>${user.firstName} ${user.lastName}</td>
        <td>${user.email}</td>


        <td>
            <form  method="POST" action="/delete">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <input type="hidden" name="user" value="${user.id}"/>
                <input type="submit" value="delete"/>
            </form>
        </td>
        <td>
            <form  method="POST" action="/makeAdmin">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <input type="hidden" name="user" value="${user.id}"/>
                <input type="submit" value="make-admin"/>
            </form>
        </td>


        </c:forEach>
    <tr>
</table>
<br>
<br>
<p><form:errors path="product.*"/></p>

<form:form method="POST" action="/addProduct" modelAttribute="product">
    <p>
        <form:label path="price">Date:</form:label>
        <form:input type="number" path="price"/>
    </p>
    <p>
        <form:label path="name">Name:</form:label>
        <form:input path="name"/>
    </p>


    <input type="submit" value="addProduct"/>
</form:form>
<%--<table border="1px">--%>
<%--    <tr>--%>
<%--        <th>Product</th>--%>
<%--        <th>Price</th>--%>
<%--    </tr>--%>
<%--    <c:forEach items="${users}" var="user">--%>
<%--    <tr>--%>
<%--        <td>${product}</td>--%>
<%--        <td>${price}</td>--%>

<%--        </c:forEach>--%>
<%--</table>--%>
</div>
</body>
</html>