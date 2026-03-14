<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Student Performance</title>

<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>

/* ===== Page ===== */

body{
    font-family:'Segoe UI', Arial, sans-serif;
    background:rgb(5,39,69);
    color:white;
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

/* ===== Performance Cards ===== */

.performance-card{

    background:#02213e;
    border-radius:12px;

    padding:20px;

    box-shadow:0 6px 18px rgba(0,0,0,0.6);

    height:100%;

    transition:0.3s;
}

.performance-card:hover{

    transform:translateY(-6px);
    box-shadow:0 10px 25px rgba(255,140,0,0.4);
}

.performance-card h5{
    color:orange;
    margin-bottom:10px;
}

.performance-card p{
    font-size:14px;
    margin:3px 0;
}

/* Divider */

.card-divider{
    border-top:1px solid #123a63;
    margin:10px 0;
}

/* Back link */

.back-link{
    display:block;
    text-align:center;
    margin-top:30px;
    color:orange;
    text-decoration:none;
}

.back-link:hover{
    color:orangered;
}

</style>
</head>

<body>

<h2>Student Performance List</h2>

<!-- ===== Search Section ===== -->

<div class="container mb-4">

<form action="<c:url value='/searchPerformance'/>"
method="get"
class="row g-2 justify-content-center search-box">

<div class="col-lg-6 col-md-8 col-12">

<input type="text"
class="form-control"
name="word"
placeholder="Search by Name"
value="${word != null ? word : ''}">

</div>

<div class="col-lg-auto col-md-auto col-6">

<button class="btn w-100 search-btn">Search</button>

</div>

<div class="col-lg-auto col-md-auto col-6">

<a href="<c:url value='/viewPerformance'/>" class="btn w-100 reset-btn">Reset</a>

</div>

</form>

</div>

<!-- ===== Performance Cards ===== -->

<div class="container">

<div class="row g-4">

<c:forEach var="entry" items="${studentPerformances}">

<div class="col-lg-4 col-md-6 col-12">

<div class="performance-card">

<h5>${entry.key}</h5>

<c:forEach var="viewP" items="${entry.value}">

<p><strong>Date:</strong> ${viewP.performance_date}</p>
<p><strong>Attendance:</strong> ${viewP.attendance}</p>
<p><strong>Study Hours:</strong> ${viewP.study_hours}</p>
<p><strong>Assessment:</strong> ${viewP.assessment}</p>
<p><strong>Participation:</strong> ${viewP.participation}</p>
<p><strong>Percentage:</strong> ${viewP.percentage}%</p>

<div class="card-divider"></div>

</c:forEach>

</div>

</div>

</c:forEach>

</div>

</div>

</body>
</html>