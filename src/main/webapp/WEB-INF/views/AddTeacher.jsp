<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Add Teacher</title>

<style>

/* ===== Page Layout ===== */
body{
    font-family: 'Segoe UI', Arial, sans-serif;
    background-color: rgb(5, 39, 69);
    margin:0;

    /* makes form fit screen height */
    min-height:100vh;
    display:flex;
    align-items:center;
    justify-content:center;

    color:#e6e6e6;
}

/* ===== Form Card ===== */
.container{

    width:90%;
    max-width:480px;

    background:#02213e;
    padding:30px;
    border-radius:10px;

    box-shadow:0 8px 25px rgba(0,0,0,0.5);
}

/* ===== Heading ===== */
h2{
    text-align:center;
    margin-bottom:20px;
    color:orange;
    font-weight:600;
}

/* ===== Labels ===== */
label{
    display:block;
    margin-top:12px;
    font-size:14px;
    color:#d4d4d4;
}

/* ===== Inputs ===== */
input,select{

    width:100%;
    padding:10px;

    margin-top:4px;

    border-radius:6px;
    border:1px solid #123a63;

    background:#01172b;
    color:white;

    font-size:14px;
}

/* Focus effect */
input:focus,select:focus{
    border-color:orange;
    outline:none;
}

/* ===== Button ===== */
button{

    width:100%;
    margin-top:20px;

    padding:11px;

    border:none;
    border-radius:6px;

    background:orange;
    color:black;

    font-size:15px;
    font-weight:600;

    cursor:pointer;
}

button:hover{
    background:orangered;
}

/* ===== Error ===== */
.error{
    font-size:12px;
    color:#ff6b6b;
}

/* ===== Small Screens ===== */
@media(max-width:500px){

.container{
padding:22px;
}

h2{
font-size:20px;
}

}

</style>

<script>
function validateTeacherForm() {

let valid = true;
document.querySelectorAll('.error').forEach(el => el.textContent = '');

const name = document.getElementById("name").value.trim();
const email = document.getElementById("email").value.trim();
const contact = document.getElementById("contact").value.trim();
const experience = document.getElementById("experience").value.trim();
const subject = document.getElementById("subject_id").value;

const nameRegex = /^[a-zA-Z\s]{2,50}$/;
if(!nameRegex.test(name)){
document.getElementById("nameError").textContent="Enter valid name";
valid=false;
}

const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
if(!emailRegex.test(email)){
document.getElementById("emailError").textContent="Enter valid email";
valid=false;
}

const contactRegex = /^\d{10}$/;
if(!contactRegex.test(contact)){
document.getElementById("contactError").textContent="Enter valid 10 digit contact";
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

<div class="container">

<h2>Add Teacher</h2>

<form action="${pageContext.request.contextPath}/addteacher"
method="post"
onsubmit="return validateTeacherForm()">

<label>Name</label>
<input type="text" id="name" name="name" placeholder="Enter full name">
<div class="error" id="nameError"></div>

<label>Email</label>
<input type="email" id="email" name="email" placeholder="Enter email">
<div class="error" id="emailError"></div>

<label>Contact</label>
<input type="text" id="contact" name="contact" placeholder="Enter contact number">
<div class="error" id="contactError"></div>

<label>Experience (years)</label>
<input type="number" id="experience" name="experience" placeholder="Enter experience">
<div class="error" id="experienceError"></div>

<label>Subject</label>
<select id="subject_id" name="subject_id">
<option value="">Select Subject</option>

<c:forEach var="s" items="${subjects}">
<option value="${s.id}">${s.subjectName}</option>
</c:forEach>

</select>

<div class="error" id="subjectError"></div>
<button type="submit">Add Teacher</button>
</form>

</div>

</body>
</html>