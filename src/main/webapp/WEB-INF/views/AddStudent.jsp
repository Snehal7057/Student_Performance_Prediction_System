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
body{
    font-family:'Segoe UI',sans-serif;
    margin:0;
    background:transparent;
    display:flex;
    justify-content:center;
    align-items:flex-start;
}

/* ===== FORM CONTAINER ===== */
.container{
    width:100%;
    max-width:420px;
    margin-top:30px;
    padding:25px 30px;
    background:#ffffff;
    border-radius:15px;
      margin-top:60px;
    box-shadow:0 10px 25px rgba(0,0,0,0.15);
}

/* ===== HEADER ===== */
.form-header{
    display:flex;
    justify-content:space-between;
    align-items:center;
    margin-bottom:20px;
}

h2{
    margin:30px;
    font-weight:700;
    font-size:1.8rem;
    color:#1e293b;
}

.close-btn{
    font-size:22px;
    cursor:pointer;
    color:#ef4444;
    transition:transform 0.3s, color 0.3s;
}

.close-btn:hover{
    transform:rotate(90deg) scale(1.1);
    color:#dc2626;
}

/* ===== LABELS ===== */
label{
    display:block;
    margin-top:12px;
    margin-bottom:5px;
    font-size:14px;
    color:#334155;
    font-weight:500;
}

/* ===== INPUTS ===== */
input{
    width:100%;
    padding:12px 15px;
    border-radius:10px;
    border:1px solid #cbd5e1;
    font-size:14px;
    transition:border 0.3s, box-shadow 0.3s;
}

input:focus{
    border-color:#3b82f6;
    box-shadow:0 0 6px rgba(59,130,246,0.4);
    outline:none;
}

/* ===== BUTTON ===== */
button{
    width:100%;
    padding:12px;
    margin-top:20px;
    border:none;
    border-radius:10px;
    background:linear-gradient(to right, #3b82f6, #2563eb);
    color:white;
    font-weight:600;
    font-size:16px;
    cursor:pointer;
    transition:all 0.3s;
}

button:hover{
    background:linear-gradient(to right, #2563eb, #1d4ed8);
    transform:translateY(-2px);
}

/* ===== ERROR ===== */
.error{
    font-size:12px;
    color:#ef4444;
    margin-top:2px;
}

/* ===== SUCCESS MESSAGE ===== */
.msg{
    margin-top:12px;
    text-align:center;
    color:#16a34a;
    font-weight:500;
    font-size:14px;
}
</style>

<script>
function validateForm(){
    let valid = true;
    document.querySelectorAll('.error').forEach(e => e.textContent = '');

    const name = document.getElementById("name").value.trim();
    const email = document.getElementById("email").value.trim();
    const contact = document.getElementById("contact").value.trim();
    const location = document.getElementById("location").value.trim();

    const nameRegex = /^[a-zA-Z\s]{2,50}$/;
    if(!nameRegex.test(name)){
        document.getElementById("nameError").textContent="Enter valid name (letters only)";
        valid = false;
    }

    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if(!emailRegex.test(email)){
        document.getElementById("emailError").textContent="Enter valid email";
        valid = false;
    }

    const contactRegex = /^\d{10}$/;
    if(!contactRegex.test(contact)){
        document.getElementById("contactError").textContent="Enter valid 10 digit number";
        valid = false;
    }

    if(location.length < 2 || location.length > 50){
        document.getElementById("locationError").textContent="Enter valid location";
        valid = false;
    }

    return valid;
}

function closeModal(){
    if(window.parent && window.parent.closeModal){
        window.parent.closeModal();
    } else {
        window.history.back();
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

        <button type="submit">Submit</button>

        <c:if test="${not empty msg}">
            <p class="msg">${msg}</p>
        </c:if>
    </form>
</div>
</body>
</html>