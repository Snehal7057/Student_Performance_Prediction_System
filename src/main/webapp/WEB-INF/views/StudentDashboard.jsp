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

body{
overflow:hidden;
background-color:rgb(26,56,82);
}

/* toggle checkbox */

#menu-toggle{
display:none;
}

/* sidebar */

#sidebar{

position:fixed;
top:0;
left:-250px;

width:250px;
height:100%;

background:#02213e;

padding-top:20px;

transition:left .3s ease;

z-index:1000;

}

#sidebar h4{
color:orange;
}

#menu-toggle:checked ~ #sidebar{
left:0;
}

#sidebar a{

display:block;

padding:12px 20px;

color:white;

text-decoration:none;

margin-bottom:5px;

border-radius:8px;

transition:.2s;

}

#sidebar a:hover{

background-color:rgb(26,56,82);

color:orange;

border-left:4px solid orangered;

}

/* overlay */

#overlay{

position:fixed;

top:0;
left:0;

width:100%;
height:100%;

background:rgba(0,0,0,.5);

opacity:0;
visibility:hidden;

transition:opacity .3s ease;

z-index:500;

}

#menu-toggle:checked ~ #overlay{

opacity:1;
visibility:visible;

}

/* navbar */

.navbar-admin{

background:#02213e;

border-bottom:2px solid orangered;

position:sticky;

top:0;

padding:10px 20px;

z-index:1100;

display:flex;

align-items:center;

justify-content:space-between;

}

.navbar-admin .navbar-brand{

color:orangered;

font-weight:bold;

}

/* hamburger */

.navbar-admin label.menu-toggle{

color:orange;

font-size:28px;

cursor:pointer;

}

.navbar-admin .profile-icon{

color:orange;

font-size:28px;

cursor:pointer;

}

.navbar-admin label.menu-toggle:hover,
.navbar-admin .profile-icon:hover{

color:orangered;

}

/* main content */

.main-content{

margin-left:0;

transition:margin-left .3s ease;

padding:20px;

height:610px;

background-color:rgb(5,39,69);

}

#menu-toggle:checked ~ .main-content{
margin-left:250px;
}

/* iframe */

.main-content iframe{

width:100%;
height:100%;

border:none;

overflow:hidden;

}

/* footer */

.footer{

text-align:center;

padding:15px;

background:#02213e;

color:orange;

border-top:2px solid orangered;

}

</style>

</head>

<body>

<input type="checkbox" id="menu-toggle">

<!-- Sidebar -->

<div id="sidebar">

<h4 class="text-center mb-4">Student Panel</h4>

<a href="${pageContext.request.contextPath}/welcome"
target="content-frame">

<i class="bi bi-speedometer2"></i> Dashboard

</a>

<a href="${pageContext.request.contextPath}/student/viewPerformance"
target="content-frame">

<i class="bi bi-graph-up"></i> My Performance

</a>

<a href="${pageContext.request.contextPath}/student/viewMaterial"
target="content-frame">

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

<!-- Navbar -->

<nav class="navbar navbar-dark navbar-admin">

<label for="menu-toggle" class="menu-toggle">
<i class="bi bi-list"></i>
</label>

<a class="navbar-brand" href="#">
<i class="bi bi-mortarboard-fill"></i> SmartGrade
</a>

<div>
<i class="bi bi-person-circle profile-icon"></i>
</div>

</nav>

<!-- Content -->

<div class="main-content">

<iframe name="content-frame"
src="${pageContext.request.contextPath}/welcome">
</iframe>

</div>

<!-- Footer -->

<div class="footer">
© 2026 SmartGrade. All Rights Reserved.
</div>

<script>

document.querySelectorAll("#sidebar a").forEach(function(link){

link.addEventListener("click",function(){

document.getElementById("menu-toggle").checked=false;

});

});

</script>

</body>
</html>