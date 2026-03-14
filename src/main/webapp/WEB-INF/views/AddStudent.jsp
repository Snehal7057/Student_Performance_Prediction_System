<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Add Student</title>

<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>

/* Page */

body{
font-family:'Segoe UI', Arial, sans-serif;
background:rgb(5,39,69);
color:white;
padding:20px;
}

/* Card */

.form-card{

max-width:520px;
margin:auto;

background:#02213e;

padding:30px;

border-radius:12px;

box-shadow:0 10px 25px rgba(0,0,0,0.6);
}

/* Heading */

h2{
text-align:center;
color:orange;
margin-bottom:25px;
}

/* Labels */

label{
margin-top:12px;
font-weight:500;
}

/* Inputs */

.form-control{

background:#01172b;
border:1px solid #123a63;
color:white;
}

.form-control:focus{

border-color:orange;

box-shadow:0 0 6px orange;

background:#01172b;

color:white;
}

/* Error */

.error{
color:#ff6b6b;
font-size:13px;
margin-top:4px;
}

/* Button */

.submit-btn{

margin-top:20px;

background:orange;

border:none;

color:black;

font-weight:600;

padding:10px;
}

.submit-btn:hover{
background:orangered;
}

/* Success message */

.msg{
margin-top:15px;
text-align:center;
color:#9be7a1;
font-weight:500;
}

</style>

<script>

function validateForm(){

let valid=true;

document.querySelectorAll('.error').forEach(e=>e.textContent='');

const name=document.getElementById("name").value.trim();
const email=document.getElementById("email").value.trim();
const contact=document.getElementById("contact").value.trim();
const location=document.getElementById("location").value.trim();

const nameRegex=/^[a-zA-Z\s]{2,50}$/;

if(!nameRegex.test(name)){
document.getElementById("nameError").textContent="Enter valid name (letters only)";
valid=false;
}

const emailRegex=/^[^\s@]+@[^\s@]+\.[^\s@]+$/;

if(!emailRegex.test(email)){
document.getElementById("emailError").textContent="Enter valid email";
valid=false;
}

const contactRegex=/^\d{10}$/;

if(!contactRegex.test(contact)){
document.getElementById("contactError").textContent="Enter valid 10 digit number";
valid=false;
}

if(location.length<2 || location.length>50){
document.getElementById("locationError").textContent="Enter valid location";
valid=false;
}

return valid;

}

</script>

</head>

<body>

<div class="form-card">

<h2>Add Student</h2>

<form action="addStudent" method="post" onsubmit="return validateForm()">

<div class="mb-2">

<label>Name</label>

<input type="text" id="name" name="name" class="form-control" placeholder="Enter full name">

<div class="error" id="nameError"></div>

</div>

<div class="mb-2">

<label>Email</label>

<input type="email" id="email" name="email" class="form-control" placeholder="Enter email">

<div class="error" id="emailError"></div>

</div>

<div class="mb-2">

<label>Contact</label>

<input type="tel" id="contact" name="contact" class="form-control" placeholder="10 digit number">

<div class="error" id="contactError"></div>

</div>

<div class="mb-2">

<label>Location</label>

<input type="text" id="location" name="location" class="form-control" placeholder="Enter location">

<div class="error" id="locationError"></div>

</div>

<input type="hidden" name="role_id" value="3">

<button class="btn submit-btn w-100">Add Student</button>

<c:if test="${not empty msg}">
<p class="msg">${msg}</p>
</c:if>

</form>

</div>

</body>
</html>