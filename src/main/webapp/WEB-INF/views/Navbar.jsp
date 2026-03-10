<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Navbar Example</title>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Popper -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.min.js"></script>

<!-- Bootstrap Icons -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">

<style>

.navbar-custom{
background:#212529;
display:flex;
align-items:center;
justify-content:space-between;
padding:10px 20px;
}

.logo{
color:orangered;
font-weight:bold;
font-size:22px;
}
.center-menu{
list-style:none;
display:flex;
gap:30px;
margin:0;
padding:0;
}
.center-menu a{
text-decoration:none;
color:white;
font-weight: bold
}
.center-menu a:hover{
color:orange;
}
.profile-icon{
color:orangered;
font-size:28px;
}
</style>
</head>
<body>

<div class="navbar-custom">

<!-- Left Logo -->
<div class="logo">
<i class="bi bi-mortarboard-fill"></i> SmartGrade
</div>

<!-- Center Menu -->
<ul class="center-menu">
<li><a href="#" >Home</a></li>
<li><a href="#">About</a></li>
<li><a href="#">Contact</a></li>
<!-- <li><a href="#">Explore_Courses</a></li> -->
<li><a href="#">Help</a></li>
</ul>

<!-- Right Profile Icon -->
<div class="profile-icon">
<i class="bi bi-person-circle"></i>
</div>
</div>
</body>
</html>