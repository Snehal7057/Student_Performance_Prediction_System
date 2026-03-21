<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Student List</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<style>

/* ===== BODY ===== */
body{
    margin:0;
    padding::0;
    font-family:'Segoe UI',sans-serif;
    color:white;
}

/* VIDEO BG */
.video-bg{
    position:fixed;
    width:100%;
    height:100%;
    object-fit:cover;
    z-index:-2;
}

/* OVERLAY */
body::before{
    content:"";
    position:fixed;
    width:100%;
    height:100%;
    background:rgba(0,0,0,0.9);
    z-index:-1;
}

/* HEADING */
h2{
    text-align:center;
    margin:30px 0;
     margin:0;
    padding-top:20px;
}

/* SEARCH */
.search-box input{
    background:rgba(255,255,255,0.1);
    border:1px solid rgba(255,255,255,0.3);
    color:white;
}

.search-btn{
    background:linear-gradient(to right, #0b0f14, #121826);
    color:white;
}

.reset-btn{
    border:1px solid white;
    color:white;
}

/* CARD */
.student-card{
    background:rgba(255,255,255,0.1);
    backdrop-filter:blur(10px);
    border-radius:12px;
    padding:20px;
    padding-top:50px;
    position:relative;
    transition:0.3s;
}

.student-card:hover{
    transform:translateY(-5px);
}

/* PROFILE ICON */
.profile-icon{
    position:absolute;
    top:-25px;
    left:50%;
    transform:translateX(-50%);
    background:#1e293b;
    width:50px;
    height:50px;
    border-radius:50%;
    display:flex;
    align-items:center;
    justify-content:center;
}

/* BUTTON */
.card-btn{
    background:linear-gradient(to right, #0b0f14, #121826);
    color:white;
    border:none;
}

.card-btn:hover{
    background:#0ea5e9;
}


/* MODAL BACKGROUND */
.modal-overlay{
position:fixed;
top:0;
left:0;
width:100%;
height:100%;
background:rgba(0,0,0,0.7);
display:none;
justify-content:center;
align-items:center;
z-index:9999;
}

/* MODAL BOX */
.modal-box{
background:#f1f1f1;
padding:25px;
border-radius:15px;
width:400px;
animation:fadeIn 0.3s ease;
}

/* CLOSE */
.close-btn{
cursor:pointer;
color:red;
font-size:20px;
}

/* BUTTON */
.submit-btn{
background:linear-gradient(to right,#0f2027,#203a43,#2c5364);
color:white;
border:none;
border-radius:10px;
padding:10px;
}

/* ANIMATION */
@keyframes fadeIn{
from{transform:scale(0.8);opacity:0;}
to{transform:scale(1);opacity:1;}
}
</style>

</head>

<body>

<!-- VIDEO -->
<video autoplay muted loop class="video-bg">
<source src="${pageContext.request.contextPath}/resources/videos/teachdash.mp4">
</video>

<h2>Student List</h2>

<!-- SEARCH -->
<div class="container mb-4">
<form action="searchstudent" method="get" class="row g-2 justify-content-center search-box">

<div class="col-lg-6">
<input type="text" class="form-control" name="keyword"
placeholder="Search by Name"
value="${keyword != null ? keyword : ''}">
</div>

<div class="col-lg-auto col-6">
<button class="btn w-100 search-btn">Search</button>
</div>

<div class="col-lg-auto col-6">
<a href="viewStudent" class="btn w-100 reset-btn">Reset</a>
</div>

</form>
</div>

<!-- CARDS -->
<div class="container">
<div class="row g-4">

<c:forEach var="student" items="${students}">

<div class="col-lg-3 col-md-4 col-sm-6">

<div class="student-card">

<div class="profile-icon">
<i class="fa-solid fa-user"></i>
</div>

<h5 class="text-center">${student.name}</h5>

<p><strong>Email:</strong> ${student.email}</p>
<p><strong>Contact:</strong> ${student.contact}</p>
<p><strong>Location:</strong> ${student.location}</p>

<div class="d-flex gap-2 mt-3">

<a href="#" class="btn card-btn w-50"
   onclick="openUpdateModal(${student.id}, '${student.name}', '${student.email}', '${student.contact}', '${student.location}')">
   Update
</a>

<a href="addPerformance?student_id=${student.id}"
class="btn card-btn w-50">Performance</a>

</div>

<div class="mt-2">

<a href="deleteStudent?id=${student.id}"
class="btn card-btn w-100"
onclick="return confirmDelete()">
Delete
</a>

</div>

</div>

</div>

</c:forEach>

</div>
</div>



<!-- 🔥 UPDATE MODAL -->
<div id="updateModal" class="modal-overlay">

<div class="modal-box">

<div class="modal-header">
<h4>Update Student</h4>
<span onclick="closeModal()" class="close-btn">✖</span>
</div>

<form action="updateStudent" method="post">

<input type="hidden" name="id" id="studentId">

<div class="mb-3">
<label>Name</label>
<input type="text" name="name" id="name" class="form-control">
</div>

<div class="mb-3">
<label>Email</label>
<input type="text" name="email" id="email" class="form-control">
</div>

<div class="mb-3">
<label>Contact</label>
<input type="text" name="contact" id="contact" class="form-control">
</div>

<div class="mb-3">
<label>Location</label>
<input type="text" name="location" id="location" class="form-control">
</div>

<button class="btn submit-btn w-100">Update</button>

</form>

</div>
</div>
<!-- SCRIPT -->
<script>
function confirmDelete(){
    return confirm("Are you sure you want to delete this student?");
}

function openUpdateModal(id, name, email, contact, location){

    document.getElementById("updateModal").style.display="flex";

    document.getElementById("studentId").value=id;
    document.getElementById("name").value=name;
    document.getElementById("email").value=email;
    document.getElementById("contact").value=contact;
    document.getElementById("location").value=location;
}

function closeModal(){
    document.getElementById("updateModal").style.display="none";
}
</script>

</body>
</html>