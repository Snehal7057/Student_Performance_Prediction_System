<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Add Performance</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>

<style>
body {
	margin: 0;
	font-family: 'Segoe UI', sans-serif;
	background: rgba(0, 0, 0, 0.6); /* overlay */
}

.popup-container {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	display: flex;
	align-items: center;
	justify-content: center;
	z-index: 9999;
}

.form-card {
	background: white;
	color: black;
	width: 100%;
	max-width: 450px;
	padding: 25px;
	border-radius: 12px;
	box-shadow: 0 10px 30px rgba(0, 0, 0, 0.5);
	animation: popupFade 0.3s ease;
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
	transition: 0.3s;
}

.close-btn:hover {
	color: red;
	transform: rotate(90deg);
}

label {
	font-size: 14px;
	margin-top: 8px;
}

.form-control {
	background: white;
	color: black;
	border: 1px solid #ccc;
}

.form-control:focus {
	border-color: black;
	box-shadow: none;
}

.submit-btn {
	margin-top: 15px;
	background: black;
	color: white;
	border: none;
	font-weight: 600;
}

.submit-btn:hover {
	background: #333;
}

.error {
	color: red;
	font-size: 12px;
}

@
keyframes popupFade {from { opacity:0;
	transform: scale(0.8);
}

to {
	opacity: 1;
	transform: scale(1);
}
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



<body>
	<div class="popup-container">

		<div class="form-card">

			<div class="form-header">
				<h2>Add Performance</h2>
				<span class="close-btn" onclick="window.history.back()">✖</span>
			</div>
			<div class="form-card">

				<h2>Add Student Performance</h2>

				<c:if test="${not empty msg}">
					<p class="msg">${msg}</p>
				</c:if>

				<form:form method="post" modelAttribute="performance"
					onsubmit="return validatePerformance()">

					<form:hidden path="student_id" />

					<div class="mb-2">
						<label>Attendance</label>
						<form:input path="attendance" id="attendance" type="number"
							cssClass="form-control" placeholder="0-100" />
						<div class="error" id="attendanceError"></div>
					</div>

					<div class="mb-2">
						<label>Study Hours</label>
						<form:input path="study_hours" id="study_hours" type="number"
							cssClass="form-control" placeholder="Hours" />
						<div class="error" id="studyHoursError"></div>
					</div>

					<div class="mb-2">
						<label>Assessment</label>
						<form:input path="assessment" id="assessment" type="number"
							cssClass="form-control" placeholder="0-100" />
						<div class="error" id="assessmentError"></div>
					</div>

					<div class="mb-2">
						<label>Participation</label>
						<form:input path="participation" id="participation" type="number"
							cssClass="form-control" placeholder="0-10" />
						<div class="error" id="participationError"></div>
					</div>

					<div class="mb-2">
						<label>Percentage</label>
						<form:input path="percentage" id="percentage" type="number"
							cssClass="form-control" placeholder="0-100" />
						<div class="error" id="percentageError"></div>
					</div>

					<button class="btn submit-btn w-100">Submit</button>

				</form:form>

			</div>
		</div>
</body>
</html>