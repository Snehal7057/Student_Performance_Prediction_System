<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Student List</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>

/* Page */

body{
font-family:'Segoe UI',Arial;
background:rgb(5,39,69);
color:white;
padding:20px;
}

/* Heading */

h2{
text-align:center;
color:orange;
margin-bottom:30px;
}

/* Search */

.search-box input{
background:#01172b;
border:1px solid #123a63;
color:white;
}

.search-box input:focus{
border-color:orange;
box-shadow:0 0 6px orange;
}

/* Buttons */

.search-btn{
background:orange;
border:none;
color:black;
font-weight:600;
}

.search-btn:hover{
background:orangered;
}

.reset-btn{
background:#02213e;
border:1px solid orange;
color:orange;
}

.reset-btn:hover{
background:orange;
color:black;
}

/* Student Cards */

.student-card{

background:#02213e;

border-radius:12px;

padding:20px;

box-shadow:0 6px 18px rgba(0,0,0,0.6);

height:100%;

transition:.3s;
}

.student-card:hover{

transform:translateY(-6px);

box-shadow:0 10px 25px rgba(255,140,0,0.4);
}

.student-card h5{
color:orange;
}

.student-card p{
font-size:14px;
margin:5px 0;
}

/* Buttons */

.card-btn{
background:orange;
border:none;
color:black;
font-size:14px;
}

.card-btn:hover{
background:orangered;
}

/* Back */

.back-link{
display:block;
text-align:center;
margin-top:35px;
color:orange;
text-decoration:none;
}

.back-link:hover{
color:orangered;
}

</style>
</head>

<body>

<h2>Student List</h2>

<!-- Search Panel -->

<div class="container mb-4">

<form action="searchstudent" method="get" class="row g-2 justify-content-center search-box">

<div class="col-lg-6 col-md-8 col-12">

<input type="text"
class="form-control"
name="keyword"
placeholder="Search by Name"
value="${keyword != null ? keyword : ''}">

</div>

<div class="col-lg-auto col-md-auto col-6">

<button class="btn w-100 search-btn">Search</button>

</div>

<div class="col-lg-auto col-md-auto col-6">

<a href="viewStudent" class="btn w-100 reset-btn">Reset</a>

</div>

</form>

</div>

<!-- Student Cards -->

<div class="container">

<div class="row g-4">

<c:forEach var="student" items="${students}">

<div class="col-lg-3 col-md-4 col-sm-6">

<div class="student-card">

<h5>${student.name}</h5>
<p><strong>Email:</strong> ${student.email}</p>
<p><strong>Contact:</strong> ${student.contact}</p>
<p><strong>Location:</strong> ${student.location}</p>

<div class="d-flex gap-2 mt-3">
<a href="${pageContext.request.contextPath}/updateStudent?id=${student.id}" class="btn card-btn w-50">Update</a>
<a href="addPerformance?student_id=${student.id}" class="btn card-btn w-50">Performance</a>
</div>

<div class="d-flex mt-2">
<a href="deleteStudent?id=${student.id}" class="btn card-btn w-100">Delete</a>
</div>
</div>
</div>
</c:forEach>
</div>
</div>
</body>
</html>