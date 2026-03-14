<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Add Performance</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>

body{
font-family:'Segoe UI',Arial;
background:rgb(5,39,69);
color:white;

height:100vh;
display:flex;
align-items:center;
justify-content:center;

margin:0;
overflow:hidden;
}

/* Card */

.form-card{

background:#02213e;

padding:28px;

border-radius:12px;

width:100%;
max-width:520px;

box-shadow:0 10px 25px rgba(0,0,0,0.6);

}

/* Heading */

h2{

text-align:center;

color:orange;

margin-bottom:20px;

}

/* Inputs */

.form-control{

background:#01172b;

border:1px solid #123a63;

color:white;

}

.form-control:focus{

background:#01172b;

border-color:orange;

box-shadow:0 0 6px orange;

color:white;

}

/* Button */

.submit-btn{

margin-top:15px;

background:orange;

border:none;

color:black;

font-weight:600;

}

.submit-btn:hover{

background:orangered;

}

/* Error */

.error{

color:#ff6b6b;

font-size:13px;

margin-top:4px;

}

/* Success message */

.msg{

text-align:center;

color:#4caf50;

margin-bottom:10px;

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

function validatePerformance(){

let valid=true;

document.querySelectorAll('.error').forEach(e=>e.textContent='');

const attendance=document.getElementById("attendance").value.trim();
const study_hours=document.getElementById("study_hours").value.trim();
const assessment=document.getElementById("assessment").value.trim();
const participation=document.getElementById("participation").value.trim();
const percentage=document.getElementById("percentage").value.trim();

if(attendance==="" || attendance<0 || attendance>100){
document.getElementById("attendanceError").textContent="Enter attendance 0-100";
valid=false;
}

if(study_hours==="" || study_hours<0){
document.getElementById("studyHoursError").textContent="Enter valid study hours";
valid=false;
}

if(assessment==="" || assessment<0 || assessment>100){
document.getElementById("assessmentError").textContent="Enter assessment 0-100";
valid=false;
}

if(participation==="" || participation<0 || participation>10){
document.getElementById("participationError").textContent="Enter participation 0-10";
valid=false;
}

if(percentage==="" || percentage<0 || percentage>100){
document.getElementById("percentageError").textContent="Enter percentage 0-100";
valid=false;
}

return valid;

}

</script>

</head>

<body>

<div class="form-card">

<h2>Add Student Performance</h2>

<c:if test="${not empty msg}">
<p class="msg">${msg}</p>
</c:if>

<form:form method="post" modelAttribute="performance" onsubmit="return validatePerformance()">

<form:hidden path="student_id"/>

<div class="mb-2">
<label>Attendance</label>
<form:input path="attendance" id="attendance" type="number" cssClass="form-control" placeholder="0-100"/>
<div class="error" id="attendanceError"></div>
</div>

<div class="mb-2">
<label>Study Hours</label>
<form:input path="study_hours" id="study_hours" type="number" cssClass="form-control" placeholder="Hours"/>
<div class="error" id="studyHoursError"></div>
</div>

<div class="mb-2">
<label>Assessment</label>
<form:input path="assessment" id="assessment" type="number" cssClass="form-control" placeholder="0-100"/>
<div class="error" id="assessmentError"></div>
</div>

<div class="mb-2">
<label>Participation</label>
<form:input path="participation" id="participation" type="number" cssClass="form-control" placeholder="0-10"/>
<div class="error" id="participationError"></div>
</div>

<div class="mb-2">
<label>Percentage</label>
<form:input path="percentage" id="percentage" type="number" cssClass="form-control" placeholder="0-100"/>
<div class="error" id="percentageError"></div>
</div>

<button class="btn submit-btn w-100">
Add Performance
</button>

</form:form>

</div>

</body>
</html>