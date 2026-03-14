<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Edit Teacher</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>

/* Page */

body{
font-family:'Segoe UI',Arial;
background:rgb(5,39,69);
color:white;

height:100vh;
display:flex;
align-items:center;
justify-content:center;

overflow:hidden;
margin:0;
}

/* Form Card */

.form-card{

width:100%;
max-width:500px;

background:#02213e;

padding:25px;

border-radius:12px;

box-shadow:0 10px 25px rgba(0,0,0,0.6);

}

/* Heading */

h2{
text-align:center;
color:orange;
margin-bottom:20px;
}

/* Labels */

label{
margin-top:10px;
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

/* Button */

.update-btn{

margin-top:15px;

background:orange;

border:none;

color:black;

font-weight:600;

}

.update-btn:hover{

background:orangered;

}

/* Errors */

.error{

color:#ff6b6b;

font-size:13px;

margin-top:3px;

}

/* Back */

.back-link{

display:block;

text-align:center;

margin-top:15px;

color:orange;

text-decoration:none;

}

.back-link:hover{

color:orangered;

}

</style>

<script>
function validateEditTeacherForm(){

let valid=true;

document.querySelectorAll('.error').forEach(e=>e.textContent='');

const name=document.getElementById("name").value.trim();
const email=document.getElementById("email").value.trim();
const contact=document.getElementById("contact").value.trim();
const experience=document.getElementById("experience").value.trim();
const subject=document.getElementById("subject_id").value;

const nameRegex=/^[a-zA-Z\s]{2,50}$/;

if(!nameRegex.test(name)){
document.getElementById("nameError").textContent="Enter valid name";
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

if(experience==="" || experience<0){
document.getElementById("experienceError").textContent="Enter valid experience";
valid=false;
}

if(subject===""){
document.getElementById("subjectError").textContent="Select subject";
valid=false;
}

return valid;

}
</script>

</head>

<body>

<div class="form-card">

<h2>Edit Teacher</h2>

<form action="updateteacher" method="post" onsubmit="return validateEditTeacherForm()">

<input type="hidden" name="id" value="${teacher.id}">

<label>Name</label>
<input type="text" id="name" name="name" class="form-control" value="${teacher.name}">
<div class="error" id="nameError"></div>

<label>Email</label>
<input type="text" id="email" name="email" class="form-control" value="${teacher.email}">
<div class="error" id="emailError"></div>

<label>Contact</label>
<input type="text" id="contact" name="contact" class="form-control" value="${teacher.contact}">
<div class="error" id="contactError"></div>

<label>Experience</label>
<input type="text" id="experience" name="experience" class="form-control" value="${teacher.experience}">
<div class="error" id="experienceError"></div>

<label>Subject</label>

<select id="subject_id" name="subject_id" class="form-control">

<c:forEach var="s" items="${subjects}">

<c:choose>

<c:when test="${teacher.subject_id == s.id}">
<option value="${s.id}" selected>${s.subjectName}</option>
</c:when>

<c:otherwise>
<option value="${s.id}">${s.subjectName}</option>
</c:otherwise>

</c:choose>

</c:forEach>

</select>

<div class="error" id="subjectError"></div>

<button class="btn update-btn w-100">Update Teacher</button>

</form>


</div>

</body>
</html>