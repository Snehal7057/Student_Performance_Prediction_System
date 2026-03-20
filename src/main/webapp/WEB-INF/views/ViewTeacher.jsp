<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Teacher List</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<style>

/* ===== BODY ===== */
body{
   background: linear-gradient(to right, #0b0f14, #121826);
    color:#e5e5e5;
    font-family:'Segoe UI',sans-serif;
}

/* ===== WRAPPER ===== */
.main-wrapper{
    padding:20px;
}

/* ===== TITLE ===== */
h2{
    text-align:center;
    color:#ffffff;
    margin-bottom:25px;
    font-weight:600;
}

/* ===== SEARCH ===== */
.search-box{
    max-width:700px;
    margin:0 auto 30px;
    
}

.search-box input{
  background:white;
    border:1px solid #333;
    color:white;
}

.search-box input:focus{
    border-color:#888;
    box-shadow:none;
}

/* BUTTONS */
.search-btn{
    background:#ffffff;
    color:black;
    border:none;
    font-weight:600;
}

.reset-btn{
    border:1px solid #555;
    color:white;
}

/* ===== CARD ===== */
.teacher-card{
    background:white;
    border-radius:12px;
    padding:20px;
    padding-top:50px;
    position:relative;
    height:100%;
    transition:0.3s;
    color:black;
}

.teacher-card:hover{
    transform:translateY(-5px);
}

/* PROFILE ICON */
.profile-icon{
    position:absolute;
    top:-30px;
    left:50%;
    transform:translateX(-50%);
    width:60px;
    height:60px;
    background:#2d2d2d;
    border-radius:50%;
    display:flex;
    align-items:center;
    justify-content:center;
    font-size:22px;
}

/* TEXT */
.teacher-card h5{
    text-align:center;
    color:black;
}

.teacher-card p{
    font-size:14px;
    margin:5px 0;
}

/* BUTTON */
.card-btn{
     background: linear-gradient(to right, #0b0f14, #121826);
    color:white;
    border:none;
    font-weight:600;
}

.card-btn:hover{
    background:;
}

/* GRID FIX */
.container-fluid{
    padding:0;
}


/* VIDEO BACKGROUND */
.video-bg{
    position:fixed;
    top:0;
    left:0;
    width:100%;
    height:100%;
    object-fit:cover;
    z-index:-1;
    filter:blur(5px) brightness(0.4);
}

/* CONTENT ABOVE VIDEO */
.main-wrapper{
    position:relative;
    z-index:1;
    padding:20px;
}

.teacher-card{
    backdrop-filter: blur(10px);
    color:black;
    background:white;
}

.delete-modal{
    position:fixed;
    top:0;
    left:0;
    width:100%;
    height:100%;

    background:rgba(0,0,0,0.6);

    display:none;
    align-items:center;
    justify-content:center;

    z-index:9999;
}

.delete-box{
    background:#02213e;
    padding:25px;
    border-radius:10px;
    text-align:center;
    color:white;
    width:300px;
    box-shadow:0 10px 25px rgba(0,0,0,0.5);
}

.delete-box h4{
    color:orange;
}



</style>
</head>

<body>

<video autoplay muted loop class="video-bg">
    <source src="${pageContext.request.contextPath}/resources/videos/videoad.mp4">
</video>

<div class="main-wrapper">

<h2>Teacher List</h2>

<!-- SEARCH -->
<form action="searchteacher" method="get" class="row g-2 search-box">

<div class="col-md-8 col-12">
<input type="text" class="form-control" name="keyword"
placeholder="Search by name, email, subject"
value="${param.keyword}">
</div>

<div class="col-md-2 col-6">
<button class="btn w-100 search-btn">Search</button>
</div>

<div class="col-md-2 col-6">
<a href="viewteachers" class="btn w-100 reset-btn">Reset</a>
</div>

</form>

<!-- CARDS -->
<div class="container-fluid">

<div class="row g-4">

<c:forEach var="t" items="${teachers}">

<div class="col-lg-3 col-md-4 col-sm-6">

<div class="teacher-card">

<div class="profile-icon">
<i class="fas fa-user"></i>
</div>

<h5>${t.name}</h5>

<p><strong>Email:</strong> ${t.email}</p>
<p><strong>Contact:</strong> ${t.contact}</p>
<p><strong>Experience:</strong> ${t.experience} years</p>
<p><strong>Subject:</strong> ${t.subjectName}</p>
<p><strong>Joining Date:</strong> ${t.createdDate}</p>

<div class="d-flex gap-2 mt-3">
<a href="#" onclick="parent.openEditModal(${t.id})" class="btn card-btn w-50">Update</a>
<a href="#" 
   class="btn card-btn w-50"
   onclick="openDeleteModal(${t.id}); return false;">
   Delete
</a>
</div>

</div>

</div>

</c:forEach>

</div>

</div>


</div>
<div id="deleteModal" class="delete-modal">
    <div class="delete-box">
        <h4>⚠ Confirm Delete</h4>
        <p>Are you sure you want to delete this teacher?</p>

        <div class="d-flex justify-content-between mt-3">
            <button class="btn btn-secondary" onclick="closeDeleteModal()">Cancel</button>

            <a id="confirmDeleteBtn" class="btn btn-danger">
                Yes, Delete
            </a>
        </div>
    </div>
</div>

<script>

function openDeleteModal(id){
    document.getElementById("deleteModal").style.display="flex";

    document.getElementById("confirmDeleteBtn").href =
        "${pageContext.request.contextPath}/deleteteacher?id=" + id;
}

function closeDeleteModal(){
    document.getElementById("deleteModal").style.display="none";
}

</script>
</body>
</html>