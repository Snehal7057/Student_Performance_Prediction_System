<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>View Teachers</title>

<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>

/* ===== Global ===== */

body{
    background:rgb(5,39,69);
    color:white;
    font-family:'Segoe UI',sans-serif;
    padding:20px;
}

/* ===== Heading ===== */

h2{
    text-align:center;
    color:orange;
    margin-bottom:30px;
}

/* ===== Search Section ===== */

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

/* ===== Teacher Cards ===== */

.teacher-card{

    background:#02213e;
    border-radius:10px;

    padding:20px;

    box-shadow:0 6px 18px rgba(0,0,0,0.6);

    height:100%;

    transition:0.3s;
}

.teacher-card:hover{

    transform:translateY(-6px);
    box-shadow:0 10px 25px rgba(255,140,0,0.4);
}

.teacher-card h5{
    color:orange;
}

.teacher-card p{
    font-size:14px;
    margin:5px 0;
}

/* ===== Action Buttons ===== */

.card-btn{

    background:orange;
    border:none;
    color:black;
    font-size:14px;
}

.card-btn:hover{
    background:orangered;
}

/* ===== Back Link ===== */

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

<h2>Teacher List</h2>

<!-- ===== Search Section ===== -->

<div class="container mb-4">

<form action="searchteacher" method="get" class="row g-2 justify-content-center search-box">

<div class="col-lg-6 col-md-8 col-12">

<input type="text"
class="form-control"
name="keyword"
placeholder="Search by name, email, or subject"
value="${param.keyword != null ? param.keyword : ''}">

</div>

<div class="col-lg-auto col-md-auto col-6">

<button class="btn w-100 search-btn">Search</button>

</div>

<div class="col-lg-auto col-md-auto col-6">

<a href="viewteachers" class="btn w-100 reset-btn">Reset</a>

</div>

</form>

</div>

<!-- ===== Teacher Cards ===== -->

<div class="container">

<div class="row g-4">

<c:forEach var="t" items="${teachers}">

<div class="col-lg-3 col-md-4 col-sm-6">

<div class="teacher-card">

<h5>${t.name}</h5>

<p><strong>Email:</strong> ${t.email}</p>

<p><strong>Contact:</strong> ${t.contact}</p>

<p><strong>Experience:</strong> ${t.experience} years</p>

<p><strong>Subject:</strong> ${t.subjectName}</p>

<div class="d-flex gap-2 mt-3">

<a href="editteacher?id=${t.id}" class="btn card-btn w-50">Update</a>

<a href="admin/deleteteacher?id=${t.id}" class="btn card-btn w-50">Delete</a>

</div>

</div>

</div>

</c:forEach>

</div>

</div>

</body>
</html>