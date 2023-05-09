<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*, javax.servlet.*" %>
<%@ page isErrorPage="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>New Hire Check List</title>
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>

	<div class="container">
		<h1>Welcome, <c:out value="${user.userName}"/></h1>
		<a href="/logout">logout</a>
		<h3>New Hires List</h3>
		<table class="table">
		
			<tr>
				<th>(Name)</th>
				<th>(Start Date)</th>
				<th>(Position)</th>
				<th>(Manger)</th>
				<th>(Need Equipment)</th>
			</tr>
			<c:forEach var="listing" items="${listings}">
			
				<tr>
				<td><a href="/listings/${listing.id}"><c:out value="${listing.name}"/></a></td>
					<td><c:out value="${listing.dates}"/></td>
					<td><c:out value="${listing.position}"/></td>
					<td><c:out value="${listing.user.userName}"/></td>
					<td><c:out value="${listing.equipment}"/></td>
				</tr>
			</c:forEach>
		
		</table>
		<a href="/addlisting"><button>(Add User)</button></a>
	</div>

</body>
</html>