<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Add Student</title>

<style>

/* ===== BODY ===== */
body{
    font-family:'Segoe UI',sans-serif;
    margin:0;
    background:transparent;

    /* CENTER FORM */
    display:flex;
    justify-content:center;
    align-items:flex-start;
}

/* ===== CONTAINER ===== */
.container{
    width:100%;
    max-width:420px;

    margin-top:30px;
    padding:20px;

    background:white;
    border-radius:12px;

    box-shadow:0 15px 35px rgba(0,0,0,0.3);

    animation:fadeIn 0.3s ease;
}

/* ===== HEADER ===== */
.form-header{
    display:flex;
    justify-content:space-between;
    align-items:center;
    margin-bottom:10px;
}

h2{
    margin:0;
    font-weight:600;
}

/* CLOSE BUTTON */
.close-btn{
    font-size:20px;
    cursor:pointer;
    color:#e11d48;
    transition:0.3s;
}

.close-btn:hover{
    transform:rotate(90deg) scale(1.1);
}

/* ===== LABEL ===== */
label{
    margin-top:10px;
    font-size:14px;
    color:#111;
}

/* ===== INPUT ===== */
input{
    width:100%;
    padding:10px;

    margin-top:6px;
    margin-bottom:10px;

    border-radius:6px;
    border:1px solid #ccc;

    transition:0.2s;
}

/* FOCUS */
input:focus{
    border-color:#38bdf8;
    box-shadow:0 0 6px rgba(56,189,248,0.5);
    outline:none;
}

/* ===== BUTTON ===== */
button{
    width:100%;
    margin-top:15px;
    padding:11px;

    border:none;
    border-radius:8px;

    background:linear-gradient(to right, #0b0f14, #121826);
    color:white;

    font-weight:600;
    cursor:pointer;
    transition:0.3s;
}

button:hover{
    background:#0ea5e9;
    transform:translateY(-1px);
}

/* ===== ERROR ===== */
.error{
    font-size:12px;
    color:#ef4444;
}

/* SUCCESS */
.msg{
    margin-top:10px;
    text-align:center;
    color:#16a34a;
    font-weight:500;
}

/* ===== ANIMATION ===== */
@keyframes fadeIn{
    from{opacity:0; transform:translateY(15px);}
    to{opacity:1; transform:translateY(0);}
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

/* CLOSE MODAL */
function closeModal(){
    if(window.parent && window.parent.closeModal){
        window.parent.closeModal();
    }else{
        window.history.back(); // fallback
    }
}

</script>

</head>

<body>

<div class="container">

<div class="form-header">
    <h2>Add Student</h2>
    <span class="close-btn" onclick="closeModal()">❌</span>
</div>

<form action="addStudent" method="post" onsubmit="return validateForm()">

<label>Name</label>
<input type="text" id="name" name="name" placeholder="Enter full name">
<div class="error" id="nameError"></div>

<label>Email</label>
<input type="email" id="email" name="email" placeholder="Enter email">
<div class="error" id="emailError"></div>

<label>Contact</label>
<input type="text" id="contact" name="contact" placeholder="10 digit number">
<div class="error" id="contactError"></div>

<label>Location</label>
<input type="text" id="location" name="location" placeholder="Enter location">
<div class="error" id="locationError"></div>

<input type="hidden" name="role_id" value="3">

<button type="submit">Add Student</button>

<c:if test="${not empty msg}">
<p class="msg">${msg}</p>
</c:if>

</form>

</div>

</body>
</html>