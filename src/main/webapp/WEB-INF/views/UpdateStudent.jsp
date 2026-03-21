<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>

<title>Update Student</title>

<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>

/* Background blur effect */
body{
background: url('https://images.unsplash.com/photo-1551288049-bebda4e38f71') no-repeat center center/cover;
height:100vh;
margin:0;
display:flex;
justify-content:center;
align-items:center;
}

/* Dark overlay */
body::before{
content:"";
position:absolute;
width:100%;
height:100%;
background:rgba(0,0,0,0.6);
backdrop-filter: blur(6px);
z-index:-1;
}

/* Modal box */
.custom-modal{
background:#f1f1f1;
border-radius:20px;
padding:25px;
width:400px;
box-shadow:0 20px 40px rgba(0,0,0,0.5);
}

/* Header */
.modal-header{
display:flex;
justify-content:space-between;
align-items:center;
margin-bottom:15px;
}

.modal-header h4{
font-weight:600;
}

/* Close button */
.close-btn{
font-size:22px;
color:#ff4d6d;
cursor:pointer;
}

/* Inputs */
.form-control{
border-radius:10px;
padding:10px;
}

/* Button */
.submit-btn{
background:linear-gradient(to right,#0f2027,#203a43,#2c5364);
color:white;
border:none;
border-radius:10px;
padding:10px;
font-weight:600;
margin-top:10px;
}

/* Success */
.success{
color:green;
text-align:center;
}

</style>

</head>

<body>

<!-- 🔥 POPUP CARD -->
<div class="custom-modal">

<div class="modal-header">
<h4>Update Student</h4>
<span class="close-btn" onclick="window.history.back()">✖</span>
</div>

<c:if test="${not empty msg}">
<p class="success">${msg}</p>
</c:if>

<!-- 🚀 SAME LOGIC -->
<form:form method="post" modelAttribute="student">

<form:hidden path="id"/>

<div class="mb-3">
<label>Name</label>
<form:input path="name" cssClass="form-control" placeholder="Enter full name"/>
</div>

<div class="mb-3">
<label>Email</label>
<form:input path="email" cssClass="form-control" placeholder="Enter email"/>
</div>

<div class="mb-3">
<label>Contact</label>
<form:input path="contact" cssClass="form-control" placeholder="10 digit number"/>
</div>

<div class="mb-3">
<label>Location</label>
<form:input path="location" cssClass="form-control" placeholder="Enter location"/>
</div>

<button class="w-100 submit-btn">
Update 
</button>

</form:form>

</div>

</body>
</html>