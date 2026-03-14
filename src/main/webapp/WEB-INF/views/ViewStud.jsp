<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Student Dashboard</title>

<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>

/* ===== Page ===== */

body{
    font-family:'Segoe UI', Arial, sans-serif;
    background:rgb(5,39,69);
    color:white;
    min-height:100vh;
}

/* ===== Card ===== */

.main-card{
    background:#02213e;
    border-radius:12px;
    box-shadow:0 10px 25px rgba(0,0,0,0.6);
}

/* ===== Heading ===== */

h3{
    text-align:center;
    color:orange;
    margin-bottom:25px;
}

/* ===== Search Panel ===== */

.search-box input{
    background:#01172b;
    border:1px solid #123a63;
    color:white;
}

.search-box input:focus{
    border-color:orange;
    box-shadow:0 0 6px orange;
}

/* Search button */

.btn-search{
    background:orange;
    border:none;
    color:black;
    font-weight:600;
}

.btn-search:hover{
    background:orangered;
}

/* Reset button */

.btn-reset{
    background:#02213e;
    border:1px solid orange;
    color:orange;
}

.btn-reset:hover{
    background:orange;
    color:black;
}

/* ===== Table ===== */

.table{
    color:white;
}

.table thead{
    background:#01172b;
    color:orange;
}

.table tbody tr{
    background:#02213e;
    transition:0.3s;
}

.table tbody tr:hover{
    background:#03345e;
}

/* ===== Delete Button ===== */

.btn-delete{
    background:orange;
    border:none;
    color:black;
    font-weight:500;
}

.btn-delete:hover{
    background:orangered;
}

/* ===== Back Link ===== */

.back-link{
    display:block;
    text-align:center;
    margin-top:25px;
    color:orange;
    text-decoration:none;
}

.back-link:hover{
    color:orangered;
}

</style>
</head>

<body>

<div class="container mt-5">

<div class="main-card p-4">

<h3>Student List</h3>

<!-- ===== Search Panel ===== -->

<form action="searchStudent" method="get" class="row g-2 justify-content-center search-box mb-4">

<div class="col-lg-6 col-md-8 col-12">

<input type="text"
class="form-control"
name="word"
placeholder="Search by Name / Email / Location"
value="${word != null ? word : ''}">

</div>

<div class="col-lg-auto col-md-auto col-6">

<button class="btn btn-search w-100">Search</button>

</div>

<div class="col-lg-auto col-md-auto col-6">

<a href="searchStudent" class="btn btn-reset w-100">Reset</a>

</div>

</form>

<!-- ===== Table ===== -->

<div class="table-responsive">

<table class="table table-bordered align-middle text-center">

<thead>
<tr>
<th>ID</th>
<th>Name</th>
<th>Email</th>
<th>Contact</th>
<th>Location</th>
<th>Delete</th>
</tr>
</thead>

<tbody>

<c:forEach var="student" items="${students}">

<tr>

<td>${student.id}</td>
<td>${student.name}</td>
<td>${student.email}</td>
<td>${student.contact}</td>
<td>${student.location}</td>

<td>
<a href="deleteStudent?id=${student.id}" class="btn btn-delete btn-sm">Delete</a>
</td>

</tr>

</c:forEach>

</tbody>

</table>

</div>

</div>

</div>

</body>
</html>