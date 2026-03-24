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
<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<style>

/* ===== BODY ===== */
body{
    margin:0;
    font-family:'Segoe UI', sans-serif;
    background: linear-gradient(to right, #0b0f14, #121826);
    color:white;
    min-height:100vh;
}

/* ===== CARD ===== */
.main-card{
    background:rgba(255,255,255,0.05);
    backdrop-filter:blur(10px);
    border-radius:12px;
    box-shadow:0 10px 25px rgba(0,0,0,0.6);
}

/* ===== HEADING ===== */
h3{
    text-align:center;
    margin-bottom:25px;
    font-weight:600;
}

/* ===== SEARCH ===== */
.search-box input{
    background:rgba(255,255,255,0.1);
    border:1px solid rgba(255,255,255,0.3);
    color:white;
}

.search-box input::placeholder{
    color:#ccc;
}

.search-box input:focus{
    border-color:#38bdf8;
    box-shadow:0 0 6px #38bdf8;
}

/* BUTTONS */
.btn-search{
    background:linear-gradient(to right, #0b0f14, #121826);
    border:none;
    color:white;
    font-weight:600;
}

.btn-search:hover{
    background:linear-gradient(to right, #1e293b, #0f172a);
}

.btn-reset{
    border:1px solid #aaa;
    color:white;
}

.btn-reset:hover{
    background:#38bdf8;
    color:black;
}

/* ===== TABLE ===== */
.table{
    color:white;
}

.table thead{
    background:rgba(255,255,255,0.1);
}

.table tbody tr{
    background:rgba(255,255,255,0.05);
    transition:0.3s;
}

.table tbody tr:hover{
    background:rgba(255,255,255,0.15);
}

/* ===== DELETE BUTTON ===== */
.btn-delete{
    background:#ff4d4d;
    border:none;
    color:white;
    padding:5px 10px;
    border-radius:5px;
    text-decoration:none;
    font-size:14px;
}

.btn-delete:hover{
    background:#ff1a1a;
}

/* ===== ICON ===== */
.fa-user-circle{
    font-size:30px;
    color:#38bdf8;
}
.video-bg{
    position:fixed;
    top:0;
    left:0;
    width:100%;
    height:100%;
    object-fit:cover;
    z-index:-2;
}
body::before{
    content:"";
    position:fixed;
    top:0;
    left:0;
    width:100%;
    height:100%;
    background:rgba(11,15,20,0.75);
    z-index:-1;
}
</style>

</head>

<body>
<video autoplay muted loop class="video-bg">
    <source src="${pageContext.request.contextPath}/resources/videos/videoad.mp4">
</video>

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

<!-- ===== TABLE ===== -->

<div class="table-responsive">
<table class="table table-bordered table-striped">

<thead>
<tr>
<th>Photo</th>
<th>Name</th>
<th>Email</th>
<th>Contact</th>
<th>Location</th>
<th>Delete</th>
<th>Register Date</th>
</tr>
</thead>

<tbody>

<c:forEach var="student" items="${students}">
<tr>

<td>
<i class="fa-solid fa-user-circle"></i>
</td>

<td>${student.name}</td>
<td>${student.email}</td>
<td>${student.contact}</td>
<td>${student.location}</td>

<td>
<a href="deleteStudent?id=${student.id}"
   class="btn-delete"
   onclick="return confirmDelete()">
   Debarred
</a>
</td>

<td>${student.createdDate}</td>

</tr>
</c:forEach>

</tbody>

</table>
</div>

</div>
</div>

<!-- ===== SCRIPT ===== -->
<script>
function confirmDelete(){
    return confirm("Are you sure you want to delete this student?");
}
</script>

</body>
</html>