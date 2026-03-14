<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>

<title>Update Student</title>

<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>

body{

background:rgb(5,39,69);
font-family:'Segoe UI',Arial;

height:100vh;
display:flex;
align-items:center;
justify-content:center;

margin:0;
overflow:hidden;

}

/* Card */

.form-card{

background:#02213e;

padding:30px;

border-radius:12px;

width:100%;
max-width:500px;

box-shadow:0 10px 25px rgba(0,0,0,0.6);

color:white;

}

/* Heading */

h2{

text-align:center;

color:orange;

margin-bottom:25px;

}

/* Inputs */

.form-control{

background:#01172b;

border:1px solid #123a63;

color:white;

}

.form-control:focus{

background:#01172b;

border-color:orange;

box-shadow:0 0 6px orange;

color:white;

}

/* Button */

.update-btn{

background:orange;

border:none;

color:black;

font-weight:600;

margin-top:15px;

}

.update-btn:hover{

background:orangered;

}

/* Success message */

.success{

text-align:center;

color:#4caf50;

margin-bottom:15px;

}

</style>

</head>

<body>

<div class="form-card">

<h2>Update Student</h2>

<c:if test="${not empty msg}">
<p class="success">${msg}</p>
</c:if>

<form:form method="post" modelAttribute="student">

<form:hidden path="id"/>

<div class="mb-3">

<label>Name</label>

<form:input path="name" cssClass="form-control"/>

</div>

<div class="mb-3">

<label>Email</label>

<form:input path="email" cssClass="form-control"/>

</div>

<div class="mb-3">

<label>Contact</label>

<form:input path="contact" cssClass="form-control"/>

</div>

<div class="mb-3">

<label>Location</label>

<form:input path="location" cssClass="form-control"/>

</div>

<button class="btn update-btn w-100">
Update Student
</button>

</form:form>

</div>

</body>
</html>