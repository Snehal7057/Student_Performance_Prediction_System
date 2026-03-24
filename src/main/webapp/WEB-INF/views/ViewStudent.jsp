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
body{
    margin:0;
    padding:0;
    font-family:'Segoe UI',sans-serif;
    color:#1e293b;
}
.video-bg{
    position:fixed;
    width:100%;
    height:100%;
    object-fit:cover;
    z-index:-2;
}
body::before{
    content:"";
    position:fixed;
    width:100%;
    height:100%;
    background:rgba(0,0,0,0.9);
    z-index:-1;
}
h2{
    text-align:center;
    padding-top:20px;
    color:white;
}
.search-box input{
    background:rgba(255,255,255,0.1);
    border:1px solid rgba(255,255,255,0.3);
    color:white;
}
.student-card{
    margin-top:30px;
    background:#ffffff;
    border-radius:15px;
    padding:40px 20px 20px 20px;
    position: relative;
    transition: transform 0.3s, box-shadow 0.3s;
    color:#1e293b;
    box-shadow:0 6px 20px rgba(0,0,0,0.1);
}
.student-card:hover{
    transform:translateY(-5px);
    box-shadow:0 10px 30px rgba(0,0,0,0.15);
}
.profile-icon{
    position: absolute;
    top: -25px;
    left: 50%;
    transform: translateX(-50%);
    background: #3b82f6;
    width: 50px;
    height: 50px;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    color:white;
    font-size:22px;
    z-index: 1;
}
.btn-border{
    border:1px solid #3b82f6;
    color:#3b82f6;
    background:none;
    transition: all 0.3s;
}
.btn-border:hover{
    background:#3b82f6;
    color:white;
}
.btn-border.disabled{
    opacity:0.5;
    pointer-events:none;
}
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
.modal-box{
background:#ffffff;
padding:25px;
border-radius:15px;
width:400px;
animation:fadeIn 0.3s ease;
color:#1e293b;
}
.close-btn{
cursor:pointer;
color:red;
font-size:20px;
}
.submit-btn{
border:none;
border-radius:10px;
padding:10px;
background:#3b82f6;
color:white;
font-weight:600;
transition:0.3s;
}
.submit-btn:hover{
background:#2563eb;
}
@keyframes fadeIn{
from{transform:scale(0.8);opacity:0;}
to{transform:scale(1);opacity:1;}
}
</style>
</head>

<body>
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
<button class="btn btn-border w-100">Search</button>
</div>
<div class="col-lg-auto col-6">
<a href="viewStudent" class="btn btn-border w-100">Reset</a>
</div>
</form>
</div>

<!-- STUDENT CARDS -->
<div class="container">
<div class="row g-4">

<c:forEach var="student" items="${students}">
<div class="col-lg-3 col-md-4 col-sm-6">
<div class="student-card">

<div class="profile-icon">
<i class="fa-solid fa-user"></i>
</div>

<h5 class="text-center mt-3">${student.name}</h5>
<p><strong>Email:</strong> ${student.email}</p>
<p><strong>Contact:</strong> ${student.contact}</p>
<p><strong>Location:</strong> ${student.location}</p>

<div class="d-flex gap-2 mt-3">

<!-- UPDATE BUTTON -->
<a href="#"
   class="btn btn-border w-50 ${student.status != 'active' ? 'disabled' : ''}"
   <c:if test="${student.status == 'active'}">
       onclick="openUpdateModal(${student.id}, '${student.name}', '${student.email}', '${student.contact}', '${student.location}')"
   </c:if>>
   Update
</a>

<!-- PERFORMANCE BUTTON -->
<a href="addPerformance?student_id=${student.id}"
   class="btn btn-border w-50 ${student.status != 'active' ? 'disabled' : ''}"
   <c:if test="${student.status != 'active'}">onclick="return false;"</c:if>>
   Performance
</a>

</div>

<div class="mt-2">
<!-- DELETE BUTTON -->
<a href="deleteStudent?id=${student.id}"
   class="btn btn-border w-100 ${student.status != 'active' ? 'disabled' : ''}"
   <c:if test="${student.status != 'active'}">onclick="return false;"</c:if>
   <c:if test="${student.status == 'active'}">onclick="return confirmDelete();"</c:if>>
   Delete
</a>
</div>

<!-- ACTIVATE / DEACTIVATE -->
<div class="mt-2">
<c:choose>
<c:when test="${student.status == 'active'}">
<a href="${pageContext.request.contextPath}/teacher/deactivatestudent?id=${student.id}" class="btn btn-border w-100">
Deactivate
</a>
</c:when>
<c:otherwise>
<a href="${pageContext.request.contextPath}/teacher/activatestudent?id=${student.id}" class="btn btn-border w-100">
Activate
</a>
</c:otherwise>
</c:choose>
</div>

</div>
</div>
</c:forEach>

</div>
</div>

<!-- UPDATE MODAL -->
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