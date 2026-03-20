<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Student Performance</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<style>

/* ===== BODY ===== */
body{
    margin:0;
    font-family:'Segoe UI',sans-serif;
    color:white;
    overflow-x:hidden;
}

/* ===== VIDEO BACKGROUND ===== */
.video-bg{
    position:fixed;
    top:0;
    left:0;
    width:100%;
    height:100%;
    object-fit:cover;
    z-index:-2;
}

/* DARK OVERLAY */
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

/* ===== HEADING ===== */
h2{
    text-align:center;
    margin:30px 0;
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

/* BUTTONS */
.search-btn{
    background:linear-gradient(to right, #0b0f14, #121826);
    border:none;
    color:white;
}

.reset-btn{
    border:1px solid #aaa;
    color:white;
}

/* ===== CARD ===== */
.performance-card{
    background:white;
    color:black;
    backdrop-filter:blur(12px);
    border-radius:15px;
    padding:20px;
    padding-top:50px;
    position:relative;
    transition:0.3s;
    height:100%;
}

.performance-card:hover{
    transform:translateY(-6px);
}

/* PROFILE ICON (Teacher style 🔥) */
.profile-icon{
    position:absolute;
    top:-30px;
    left:50%;
    transform:translateX(-50%);
    width:60px;
    height:60px;
    background:#1e293b;
    border-radius:50%;
    display:flex;
    align-items:center;
    justify-content:center;
    font-size:22px;
    color:#38bdf8;
}

/* TEXT */
.performance-card h5{
    text-align:center;
    margin-top:10px;
}

.performance-card p{
    font-size:14px;
    margin:10px 0;
    margin-left:20px;
}

/* DIVIDER */
.card-divider{
    border-top:1px solid rgba(255,255,255,0.2);
    margin:10px 0;
}

</style>
</head>

<body>

<!-- 🔥 VIDEO BACKGROUND -->
<video autoplay muted loop class="video-bg">
    <source src="${pageContext.request.contextPath}/resources/videos/videoad.mp4">
</video>

<h2>Student Performance List</h2>

<!-- SEARCH -->
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

<div class="col-lg-auto col-6">
<button class="btn w-100 search-btn">Search</button>
</div>

<div class="col-lg-auto col-6">
<a href="<c:url value='/viewPerformance'/>" class="btn w-100 reset-btn">Reset</a>
</div>

</form>

</div>

<!-- CARDS -->
<div class="container">

<div class="row g-4">

<c:forEach var="entry" items="${studentPerformances}">

<div class="col-lg-4 col-md-6 col-12">

<div class="performance-card">

<!-- PROFILE ICON -->
<div class="profile-icon">
<i class="fas fa-user"></i>
</div>

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