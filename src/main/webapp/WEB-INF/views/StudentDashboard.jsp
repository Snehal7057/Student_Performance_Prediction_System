<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Student Dashboard - SmartGrade</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet"
href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">

<style>

/* ===== BODY ===== */
body{
margin:0;
font-family:'Segoe UI',sans-serif;
color:white;
overflow:hidden;
}

/* VIDEO BG */
.video-bg{
position:fixed;
width:100%;
height:100%;
object-fit:cover;
z-index:-2;
}

/* DARK OVERLAY */
body::before{
content:"";
position:fixed;
width:100%;
height:100%;
background:rgba(0,0,0,0.6);
z-index:-1;
}

.logo {
  color: white;
  font-size: 28px;
  font-weight: bold;
}

.edu {
  color: #00c6ff;
}

/* ===== TOGGLE ===== */
#menu-toggle{display:none;}

/* ===== SIDEBAR ===== */
#sidebar{
position:fixed;
top:0;
left:-260px;
width:260px;
height:100%;
background: linear-gradient(to bottom, #0b0f14, #121826);
padding-top:20px;
transition:0.3s;
z-index:1000;
box-shadow:4px 0 20px rgba(0,0,0,0.6);
}

/* OPEN */
#menu-toggle:checked ~ #sidebar{
left:0;
}

/* TITLE */
#sidebar h4{
color:#38bdf8;
text-align:center;
margin-bottom:25px;
}

/* LINKS */
#sidebar a{
display:flex;
align-items:center;
gap:10px;
padding:12px 20px;
color:#cbd5e1;
text-decoration:none;
margin-bottom:5px;
border-radius:8px;
transition:0.25s;
}

/* HOVER */
#sidebar a:hover{
background:#1e293b;
color:#38bdf8;
transform:translateX(5px);
}

/* ACTIVE FEEL */
#sidebar a i{
font-size:18px;
}

/* ===== OVERLAY ===== */
#overlay{
position:fixed;
top:0;
left:0;
width:100%;
height:100%;
background:rgba(0,0,0,.5);
opacity:0;
visibility:hidden;
transition:0.3s;
z-index:500;
}

#menu-toggle:checked ~ #overlay{
opacity:1;
visibility:visible;
}

/* ===== NAVBAR ===== */
.navbar-admin{
background: linear-gradient(to right, #0b0f14, #121826);
padding:10px 20px;
display:flex;
align-items:center;
justify-content:space-between;
position:sticky;
top:0;
z-index:1100;
box-shadow:0 2px 10px rgba(0,0,0,0.5);
}

/* LOGO */
.navbar-brand{
font-weight:bold;
color:white;
font-size:20px;
}

/* ICONS */
.menu-toggle{
font-size:26px;
cursor:pointer;
color:#38bdf8;
transition:0.3s;
}

.menu-toggle:hover{
color:white;
}

.profile-icon{
font-size:26px;
cursor:pointer;
color:#38bdf8;
}

/* ===== DROPDOWN ===== */
.profile-box{
position:relative;
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
box-shadow:0 5px 15px rgba(0,0,0,0.4);
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

/* ===== MAIN ===== */
.main-content{
height:calc(100vh - 60px);
transition:0.3s;
}

/* SHIFT CONTENT */
#menu-toggle:checked ~ .main-content{
margin-left:260px;
}

/* IFRAME */
iframe{
width:100%;
height:100%;
border:none;
}

/* ===== FOOTER ===== */
.footer{
text-align:center;
padding:10px;
background:#0b0f14;
color:#94a3b8;
}

</style>

</head>

<body>

<!-- VIDEO -->
<video autoplay muted loop class="video-bg">
<source src="${pageContext.request.contextPath}/resources/videos/student.mp4">
</video>

<input type="checkbox" id="menu-toggle">

<!-- SIDEBAR -->
<div id="sidebar">

<h4>Student Panel</h4>

<a href="${pageContext.request.contextPath}/welcome" target="content-frame">
<i class="bi bi-speedometer2"></i> Dashboard
</a>

<a href="${pageContext.request.contextPath}/student/viewPerformance" target="content-frame">
<i class="bi bi-graph-up"></i> My Performance
</a>

<a href="${pageContext.request.contextPath}/student/viewMaterial" target="content-frame">
<i class="bi bi-journal-text"></i> Study Material
</a>

<a href="#">
<i class="bi bi-gear"></i> Settings
</a>

<a href="${pageContext.request.contextPath}/">
<i class="bi bi-box-arrow-right"></i> Logout
</a>

</div>

<label id="overlay" for="menu-toggle"></label>

<!-- NAVBAR -->
<div class="navbar-admin">

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

</div>

<!-- MAIN -->
<div class="main-content">

<iframe name="content-frame"
src="${pageContext.request.contextPath}/welcome">
</iframe>

</div>

<!-- FOOTER -->
<div class="footer">
© 2026 SmartGrade
</div>

<script>

/* SIDEBAR CLOSE */
document.querySelectorAll("#sidebar a").forEach(link=>{
link.addEventListener("click",()=>{
document.getElementById("menu-toggle").checked=false;
});
});

/* DROPDOWN */
function toggleDropdown(){
let d=document.getElementById("dropdown");
d.style.display = d.style.display==="block"?"none":"block";
}

/* OUTSIDE CLICK */
window.onclick=function(e){
if(!e.target.closest(".profile-box")){
document.getElementById("dropdown").style.display="none";
}
}

</script>

</body>
</html>