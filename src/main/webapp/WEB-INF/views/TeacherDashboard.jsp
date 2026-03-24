<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Teacher Dashboard - SmartGrade</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">

<style>

/* ===== BODY ===== */
body{
	margin:0;
	font-family:'Segoe UI',sans-serif;
	color:white;
	overflow:hidden;
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
	background:rgba(11,15,20,0.7);
	z-index:-1;
}

/* ===== HIDE CHECKBOX ===== */
#menu-toggle{display:none;}

/* ===== NAVBAR ===== */
.navbar-admin{
	position:fixed;
	top:0;
	left:0;
	width:100%;
	height:60px;
	z-index:1100;

	background:linear-gradient(to right, #0b0f14, #121826);
	padding:0 20px;

	display:flex;
	align-items:center;
	justify-content:space-between;
}

/* TOGGLE */
.menu-toggle{
	font-size:26px;
	color:#38bdf8;
	cursor:pointer;
}

/* LOGO */
.navbar-brand{
	color:white;
	font-weight:bold;
}

/* PROFILE */
.profile-icon{
	font-size:24px;
	color:#38bdf8;
}

/* ===== SIDEBAR ===== */
#sidebar{
	position:fixed;
	top:60px;
	left:-250px;
	width:250px;
	height:calc(100vh - 60px);

	background:linear-gradient(to right, #0b0f14, #121826);
	padding-top:20px;

	transition:0.3s;
	z-index:1000;
}

#menu-toggle:checked ~ #sidebar{
	left:0;
}

/* SIDEBAR LINKS */
#sidebar a{
	display:block;
	padding:12px 20px;
	color:#cbd5e1;
	text-decoration:none;
	transition:0.2s;
}

#sidebar a:hover{
	background:#1e293b;
	color:#38bdf8;
}

/* ===== MAIN ===== */
.main-content{
	margin-top:60px;
	height:calc(100vh - 60px);
	transition:0.3s;
}

#menu-toggle:checked ~ .main-content{
	margin-left:250px;
}

.main-content iframe{
	width:100%;
	height:100%;
	border:none;
	display:block;
}

/* ===== FOOTER ===== */
.footer{
	text-align:center;
	padding:10px;
	background:#0b0f14;
	color:#94a3b8;
}

/* PROFILE DROPDOWN */
.profile-box{
    position:relative;
    cursor:pointer;
}

.dropdown-menu-custom{
    position:absolute;
    right:0;
    top:40px;

    background:#1e293b;
    border-radius:8px;

    display:none;
    min-width:150px;
    overflow:hidden;
}

.dropdown-menu-custom a{
    display:block;
    padding:10px;
    color:white;
    text-decoration:none;
}

.dropdown-menu-custom a:hover{
    background:#334155;
}

.logo {
  color: white;
  font-size: 28px;
  font-weight: bold;
}

.edu {
  color: #00c6ff;
}

</style>
</head>

<body>

<video autoplay muted loop class="video-bg">
<source src="${pageContext.request.contextPath}/resources/videos/teachdash.mp4">
</video>

<input type="checkbox" id="menu-toggle">

<nav class="navbar-admin">

<label for="menu-toggle" class="menu-toggle">
<i class="bi bi-list"></i>
</label>

	<div class="logo">
        <span class="brand-icon">
          <svg width="28" height="28" viewBox="0 0 24 24" fill="white">
            <path d="M12 3L1 9L12 15L21 10.09V17H23V9L12 3Z" />
            <path
              d="M5 12V17C5 19.21 8.13 21 12 21C15.87 21 19 19.21 19 17V12L12 17L5 12Z"
            />
          </svg>
        </span>
        Brainly<span class="edu">Edu</span>
      </div>
      
<div class="profile-box" onclick="toggleDropdown()">
    <i class="bi bi-person-circle profile-icon"></i>

    <div class="dropdown-menu-custom" id="dropdown">
        <a href="#">Edit Profile</a>
        <a href="${pageContext.request.contextPath}/">Logout</a>
    </div>
</div>

</nav>

<div id="sidebar">

<h5 class="text-center mb-4">Teacher Panel</h5>

<a href="${pageContext.request.contextPath}/welcome" target="content-frame">
<i class="bi bi-speedometer2"></i> Dashboard
</a>

<a href="${pageContext.request.contextPath}/addStudent" target="content-frame">
<i class="bi bi-person-plus"></i> Add Student
</a>

<a href="${pageContext.request.contextPath}/teacher/viewStudent" target="content-frame">
<i class="bi bi-people"></i> View Students
</a>

<a href="${pageContext.request.contextPath}/viewPerformance" target="content-frame">
<i class="bi bi-graph-up"></i> View Performance
</a>

<a href="${pageContext.request.contextPath}/uploadMaterial" target="content-frame">
<i class="bi bi-upload"></i> Upload Material
</a>

<a href="${pageContext.request.contextPath}/viewMaterial" target="content-frame">
<i class="bi bi-journal-text"></i> View Material
</a>

<a href="${pageContext.request.contextPath}/teacher/predictStudent" target="content-frame" onclick="openPredictPopup()">
    <i class="bi bi-cpu"></i> Predict Student
</a>
<a href="${pageContext.request.contextPath}/teacher/viewPredictions" >
    <i class="bi bi-graph-up-arrow"></i> View Predictions
</a>

<a href="#">
<i class="bi bi-gear"></i> Settings
</a>

<a href="${pageContext.request.contextPath}/">
<i class="bi bi-box-arrow-right"></i> Logout
</a>

</div>

<div class="main-content">

<iframe name="content-frame"
src="${pageContext.request.contextPath}/welcome"></iframe>

</div>

<div class="footer">
© 2026 SmartGrade. All Rights Reserved.
</div>
<div id="popupContainer" style="
display:none;
position:fixed;
top:0;
left:0;
width:100%;
height:100%;
background:rgba(0,0,0,0.7);
z-index:2000;
justify-content:center;
align-items:center;
">

    <div style="width:80%; height:85%; background:white; border-radius:12px; overflow:hidden;">

        <iframe id="popupFrame" style="width:100%; height:100%; border:none;"></iframe>

    </div>

</div>
<script>

document.querySelectorAll("#sidebar a").forEach(function(link){
link.addEventListener("click",function(){
document.getElementById("menu-toggle").checked=false;
});
});


function toggleDropdown(){
    let d = document.getElementById("dropdown");
    d.style.display = d.style.display === "block" ? "none" : "block";
}

window.onclick = function(e){
    if(!e.target.closest(".profile-box")){
        document.getElementById("dropdown").style.display="none";
    }
}


</script>

</body>
</html>