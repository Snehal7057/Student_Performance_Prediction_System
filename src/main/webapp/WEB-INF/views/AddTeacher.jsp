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

/* ===== BODY ===== */
body{
    font-family:'Segoe UI',sans-serif;
    margin:0;
    background:transparent;
}

/* ===== CENTER BOX ===== */
.container{
    max-width:420px;
	padding:10px;
	margin-top:25px;
    background:#ffffff;
    border-radius:12px;
    box-shadow:0 10px 30px rgba(0,0,0,0.2);
}

/* ===== HEADER ===== */
.form-header{
    display:flex;
    justify-content:space-between;
    align-items:center;
}

h3{
    margin:0;
    font-weight:600;
    color:black;
}

/* CLOSE BUTTON */
.close-btn{
    font-size:20px;
    cursor:pointer;
    color:#e11d48;
    transition:0.3s;
}

.close-btn:hover{
    transform:rotate(90deg);
}

/* ===== FORM ===== */
.form-group{
    margin-bottom:15px;
}

/* LABEL */
label{
    font-size:14px;
    display:block;
    margin-bottom:5px;
    color:black;
}

/* INPUT */
input,select{
    width:100%;
    padding:10px;

    border-radius:6px;
    border:1px solid #ccc;
}

/* FOCUS */
input:focus,select:focus{
    border-color:#38bdf8;
    outline:none;
}

/* BUTTON */
button{
    width:100%;
    margin-top:15px;
    padding:12px;

    border:none;
    border-radius:8px;

    background:#0f172a;
    color:white;

    font-weight:600;
    cursor:pointer;
}

button:hover{
    background:#38bdf8;
}

/* ERROR */
.error{
    font-size:12px;
    color:red;
}

/* ANIMATION */
.container{
    animation:fadeIn 0.3s ease;
}

@keyframes fadeIn{
    from{opacity:0; transform:translateY(20px);}
    to{opacity:1; transform:translateY(0);}
}

</style>

<script>

function validateTeacherForm(){

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
document.getElementById("contactError").textContent="Enter valid contact";
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

/* CLOSE MODAL */
function closeModal(){
    parent.closeModal();
}

</script>

</head>

<body>

<div class="container">

<div class="form-header">
    <h3>Add Teacher</h3>
    <span class="close-btn" onclick="closeModal()">❌</span>
</div>

<form action="${pageContext.request.contextPath}/addteacher"
method="post"
onsubmit="return validateTeacherForm()">

<div class="form-group">
<label>Name</label>
<input type="text" id="name" name="name" placeholder="Enter full name">
<div class="error" id="nameError"></div>
</div>

<div class="form-group">
<label>Email</label>
<input type="email" id="email" name="email" placeholder="Enter email">
<div class="error" id="emailError"></div>
</div>

<div class="form-group">
<label>Contact</label>
<input type="text" id="contact" name="contact" placeholder="Enter contact number">
<div class="error" id="contactError"></div>
</div>

<div class="form-group">
<label>Experience</label>
<input type="number" id="experience" name="experience">
<div class="error" id="experienceError"></div>
</div>

<div class="form-group">
<label>Subject</label>
<select id="subject_id" name="subject_id">
<option value="">Select Subject</option>

<c:forEach var="s" items="${subjects}">
<option value="${s.id}">${s.subjectName}</option>
</c:forEach>

</select>
<div class="error" id="subjectError"></div>
</div>

<button type="submit">Submit</button>

</form>

</div>

</body>
</html>