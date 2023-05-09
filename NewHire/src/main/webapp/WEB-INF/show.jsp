<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page isErrorPage="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Shows</title>
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>

	<div class="container">
		<h1>Welcome:<c:out value="${user.userName}"/></h1>
		<a href="/listings">Back to Home</a>
		<p>Manager: <c:out value="${listing.user.userName}"/></p>		
		<p>Hire Name: <c:out value="${listing.name}"/> </p>
		<p>Position: <c:out value="${listing.position}"/></p>
		<p>Start Date: <c:out value="${listing.dates}"/></p>
		
		<div>
			<a href="/listings/${listing.id }/edit">Edit</a>
			<a href="/listings/${listing.id}/delete">Delete</a>
	</div>
	</div>
</body>
</html>