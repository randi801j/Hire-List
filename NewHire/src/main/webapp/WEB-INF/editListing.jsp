<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page isErrorPage="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page isErrorPage="true" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>     
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Edit Hire</title>
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
<h1>Edit Hire </h1>
<a href="/listings">Home</a>
<form:form action="/listings/${listing.id }/edit" class="form" method="put" modelAttribute="listing">

	<p>Manager: <c:out value="${listing.user.userName}"/></p>	
    
    <p>
        <form:label path="name">Hire's Name</form:label>
        <form:errors path="name"/>
        <form:input path="name"/>
    </p>
    <p>
        <form:label path="position">Position:</form:label>
        <form:errors path="position"/>
        <form:input type="position" path="position"/>
    </p>
    <p>
        <form:label path="dates">Start Date:</form:label>
        <form:errors path="dates"/>
        <form:input type="date" path="dates"/>
    </p>   
    <p>
    	<form:errors path="user" class="error"/>
    	<form:input type="hidden" path="user" value="${user.id}"/>
    </p>
    <input type="submit" value="Submit"/>
</form:form>
<a href="/listings/${listing.id}/delete">Delete</a>

</div>

</body>
</html>
