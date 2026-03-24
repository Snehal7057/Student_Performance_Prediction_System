<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Edit Teacher</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
body {
	margin: 0;
	font-family: 'Segoe UI', sans-serif;
	background: transparent;
}

.form-card {
	width: 100%;
	max-width: 400px;
	margin: 30px;
	background: rgba(255, 255, 255, 0.08);
	backdrop-filter: blur(12px);
	padding: 25px;
	border-radius: 12px;
	box-shadow: 0 10px 25px rgba(0, 0, 0, 0.5);
	color: white;
}

.form-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 15px;
}

h2 {
	margin: 0;
	font-size: 20px;
	color: black;
}

.close-btn {
	font-size: 22px;
	cursor: pointer;
	color: white;
	transition: 0.8s;
}

.close-btn:hover {
	transform: rotate(90deg);
	color: #ff4d4d;
}

label {
	margin-top: 10px;
	font-size: 14px;
	color: black;
}

input, select {
	width: 100%;
	padding: 10px;
	margin-top: 5px;
	border-radius: 6px;
	border: 1px solid rgba(255, 255, 255, 0.3);
	background: rgba(255, 255, 255, 0.1);
	color: white;
}

/* FOCUS */
input:focus, select:focus {
	outline: none;
	border-color: #38bdf8;
}

.update-btn {
	width: 100%;
	margin-top: 15px;
	padding: 12px;
	border: none;
	border-radius: 8px;
	background: linear-gradient(to right, #0b0f14, #121826);
	color: white;
	font-weight: 600;
}

/* HOVER */
.update-btn:hover {
	background: linear-gradient(to right, #1e293b, #0f172a);
}

/* ===== ERROR ===== */
.error {
	color: #ff6b6b;
	font-size: 12px;
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


		<div class="form-header">
			<h2>Edit Teacher</h2>
			<span class="close-btn" onclick="parent.closeEditModal()">✖</span>
		</div>
		<form action="updateteacher" method="post" target="_top"
			onsubmit="parent.closeEditModal(); return validateEditTeacherForm()">

			<input type="hidden" name="id" value="${teacher.id}"> <label>Name</label>
			<input type="text" id="name" name="name" class="form-control"
				value="${teacher.name}">
			<div class="error" id="nameError"></div>

			<label>Email</label> <input type="text" id="email" name="email"
				class="form-control" value="${teacher.email}">
			<div class="error" id="emailError"></div>

			<label>Contact</label> <input type="text" id="contact" name="contact"
				class="form-control" value="${teacher.contact}">
			<div class="error" id="contactError"></div>

			<label>Experience</label> <input type="text" id="experience"
				name="experience" class="form-control" value="${teacher.experience}">
			<div class="error" id="experienceError"></div>

			<label>Subject</label> <select id="subject_id" name="subject_id"
				class="form-control">

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

			<button class="btn update-btn w-100">Update</button>

		</form>


	</div>

</body>
</html>