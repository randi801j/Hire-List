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
	<title>Add New Hire</title>
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">

	<h1>New Hire Information</h1>

	<a href="/listings">Home</a>

	<div class="container">
		<form:form action="/listings" modelAttribute="listing" class="form" method="post">
		
			<div class="form-row">
			 	<form:errors path="name" class="error"/>
				<form:label for="name" path="name">Name:</form:label>
				<form:input type="text" path="name" class="form-control"/>
			</div>
			
			<div class="form-row">
				<form:errors path="equipment" class="error"/>
				<form:label for="equipment" path="equipment">Equipment:</form:label>
				<form:input type="text" path="equipment" class="form-control"/>
			</div>
			
			<div class="form-row">
				<form:errors path="position" class="error"/>
				<form:label for="position" path="position">Position:</form:label>
				<form:input type="text" path="position" class="form-control"/>
			</div>

			<div class="form-row">
				<form:errors path="dates" class="error"/>
				<form:label for="dates" path="dates">Start Date:</form:label>
				<form:input type="date" path="dates" class="form-control"/>
			</div>
			
			<div class="form-row">
				<form:errors path="user" class="error"/>
				<form:input type="hidden" path="user" value="${user.id}" class="form-control"/>
			</div>
			
			<div class="form-row">
				<input type="submit" value="Submit" class="btn-primary"/>
			</div>
			
		</form:form>
		<form action="/listings">
			<div class="form-row">
				<input type="submit" value="Cancel" class="btn-primary"/>
			</div>
		</form>
		
		
	
	</div>



</div>

</body>
</html>