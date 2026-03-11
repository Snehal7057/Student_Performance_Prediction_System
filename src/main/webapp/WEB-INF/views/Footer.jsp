<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Navbar Example</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">
<style>
.dashboard{
width:100%;
height:50px;
background-color:aliceblue;
}

.footer{
width:100%;
min-height:300px;
background-color:rgb(33,49,64);
}

.logo{
color:orangered;
font-weight:bold;
font-size:32px;
}

h4{
color:orange;
font-weight:bolder;
padding-bottom:10px;
}

p{    
color:white;
text-align:justify;
}

.box1,
.box2,
.box3,
.box4{
padding:30px;
}

.icons a{
display:block;
color:white;
text-decoration:none;
margin-bottom:8px;
}

.icons a ion-icon{
font-size:22px;
margin-right:10px;
transition:0.3s;
}

.box2 a,
.box3 a,
.box4 a{
display:block;
color:white;
text-decoration:none;
margin-bottom:8px;
}

.box2 a:hover,
.box3 a:hover,
.box4 a:hover,
.icons a:hover{
color:orange;
}
</style>
</head>
<body>
<div class="container-fluid p-0">
<div class="dashboard"></div>
<div class="footer row m-0">
<div class="box1 col-lg-5 col-md-12 col-sm-12">
<div class="logo">
<i class="bi bi-mortarboard-fill"></i> SmartGrade
</div>
<br>
<p>
Lorem ipsum dolor sit amet consectetur adipisicing elit. Id repudiandae,
dolores ex animi inventore labore ad vitae. Quod, nesciunt quam ut.
Lorem ipsum dolor sit amet consectetur adipisicing elit. Optio magni
totam at? Minus dolorum aliquam maxime quas minima commodi. Ea minima 
aspernatur eum assumenda ducimus nam expedita repudiandae. Earum, a.
</p>
</div>

<div class="box2 col-lg-2 col-md-4 col-sm-12">
<h4>Legal</h4>
<a href="#">Home Page</a>
<a href="#">Privacy Policy</a>
<a href="#">Terms of Services</a>
<a href="#">Career</a>
<a href="#">Portal</a>
</div>

<div class="box3 col-lg-2 col-md-4 col-sm-12">
<h4>Social</h4>
<div class="icons">
<a href="#"><ion-icon name="logo-facebook"></ion-icon>Facebook</a>
<a href="#"><ion-icon name="logo-instagram"></ion-icon>Instagram</a>
<a href="#"><ion-icon name="logo-twitter"></ion-icon>Twitter</a>
<a href="#"><ion-icon name="logo-google"></ion-icon>Google</a>
<a href="#"><ion-icon name="logo-skype"></ion-icon>Skype</a>
</div>
</div>

<div class="box4 col-lg-3 col-md-4 col-sm-12">
<h4>More Information</h4>
<a href="">About SmartGrade</a>
<a href="">Student Dashboard</a>
<a href="">Teacher Portal</a>
<a href="">Admin Panel</a>
<a href="">Support</a>
</div>

</div>
</div>
<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
</body>
</html>