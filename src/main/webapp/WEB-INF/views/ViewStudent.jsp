<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
>>>>>>> 181a61ee612775d2909cadf8e39e5c00c9eefc48
<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<<<<<<< HEAD
<title>Student List</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>

/* Page */

body{
font-family:'Segoe UI',Arial;
background:rgb(5,39,69);
color:white;
padding:20px;
}

/* Heading */

h2{
text-align:center;
color:orange;
margin-bottom:30px;
}

/* Search */

.search-box input{
background:#01172b;
border:1px solid #123a63;
color:white;
}

.search-box input:focus{
border-color:orange;
box-shadow:0 0 6px orange;
}

/* Buttons */

.search-btn{
background:orange;
border:none;
color:black;
font-weight:600;
}

.search-btn:hover{
background:orangered;
}

.reset-btn{
background:#02213e;
border:1px solid orange;
color:orange;
}

.reset-btn:hover{
background:orange;
color:black;
}

/* Student Cards */

.student-card{

background:#02213e;

border-radius:12px;

padding:20px;

box-shadow:0 6px 18px rgba(0,0,0,0.6);

height:100%;

transition:.3s;
}

.student-card:hover{

transform:translateY(-6px);

box-shadow:0 10px 25px rgba(255,140,0,0.4);
}

.student-card h5{
color:orange;
=======
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
body {
	background: linear-gradient(135deg, #141e30, #243b55);
	min-height: 100vh;
}

.card {
	border-radius: 15px;
	box-shadow: 0 8px 20px rgba(0, 0, 0, 0.3);
}

h3 {
	font-weight: bold;
	color: #ff9800;
}

thead {
	background-color: #1d1d6d;
	color: white;
}

.table tbody tr:hover {
	background-color: #2c3e50;
	color: #fff;
	transition: 0.3s;
}

#searchInput {
	border-radius: 30px;
	padding: 10px 15px;
}

.btn-update {
	background-color: #2ca72e;
	color: white;
	border-radius: 20px;
	padding: 5px 12px;
	text-decoration: none;
}

.btn-update:hover {
	background-color: #e68a00;
	color: white;
}

.btn-performance {
	background-color: #2ca72e;
	color: white;
	border-radius: 20px;
	padding: 5px 12px;
	text-decoration: none;
}

.btn-performance:hover {
	background-color: #e68a00;
	color: white;
}

.btn-delete {
	background-color: #c23627;
	color: white;
	border-radius: 20px;
	padding: 5px 12px;
	text-decoration: none;
}

.btn-delete:hover {
	background-color: #c0392b;
	color: white;
>>>>>>> 181a61ee612775d2909cadf8e39e5c00c9eefc48
}

.student-card p{
font-size:14px;
margin:5px 0;
}

/* Buttons */

.card-btn{
background:orange;
border:none;
color:black;
font-size:14px;
}

.card-btn:hover{
background:orangered;
}

/* Back */

.back-link{
display:block;
text-align:center;
margin-top:35px;
color:orange;
text-decoration:none;
}

.back-link:hover{
color:orangered;
}

</style>
</head>

<body>

<<<<<<< HEAD
<h2>Student List</h2>

<!-- Search Panel -->

<div class="container mb-4">

<form action="searchstudent" method="get" class="row g-2 justify-content-center search-box">

<div class="col-lg-6 col-md-8 col-12">

<input type="text"
class="form-control"
name="keyword"
placeholder="Search by Name"
value="${keyword != null ? keyword : ''}">

</div>

<div class="col-lg-auto col-md-auto col-6">

<button class="btn w-100 search-btn">Search</button>

</div>

<div class="col-lg-auto col-md-auto col-6">

<a href="viewStudent" class="btn w-100 reset-btn">Reset</a>

</div>

</form>

</div>

<!-- Student Cards -->

<div class="container">

<div class="row g-4">

<c:forEach var="student" items="${students}">

<div class="col-lg-3 col-md-4 col-sm-6">

<div class="student-card">

<h5>${student.name}</h5>
<p><strong>Email:</strong> ${student.email}</p>
<p><strong>Contact:</strong> ${student.contact}</p>
<p><strong>Location:</strong> ${student.location}</p>

<div class="d-flex gap-2 mt-3">
<a href="${pageContext.request.contextPath}/updateStudent?id=${student.id}" class="btn card-btn w-50">Update</a>
<a href="addPerformance?student_id=${student.id}" class="btn card-btn w-50">Performance</a>
</div>

<div class="d-flex mt-2">
<a href="deleteStudent?id=${student.id}" class="btn card-btn w-100">Delete</a>
</div>
</div>
</div>
</c:forEach>
</div>
</div>
=======
	<div class="container mt-5">
		<div class="card p-4">

			<h3 class="text-center mb-4">Student List</h3>

			<!-- Search Box -->
			<form action="searchstudent" method="get">
				Search Student: <input type="text" name="keyword"
					placeholder="Enter Name" value="${keyword}"> <input
					type="submit" value="Search"> <a href="searchstudent">Reset</a>
			</form>
			<br />

			<div class="table-responsive">
				<table class="table table-bordered table-striped" id="teacherTable">
					<thead>
						<tr>
							<th>Photo</th>
							<th>Name</th>
							<th>Email</th>
							<th>Contact</th>
							<th>Location</th>
							<th>Update</th>
							<th>Add Performance</th>
							<th>Delete</th>
							<th>Date Added</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach var="s" items="${students}" varStatus="status">

							<tr>

								<td>${status.count}</td>
								<td>${s.name}</td>
								<td>${s.email}</td>
								<td>${s.contact}</td>
								<td>${s.location}</td>

								<td><a href="updateStudent?id=${student.id}"
									class="btn-update">Update</a></td>
								<td><a href="addPerformance?student_id=${student.id}"
									class="btn-performance">Add_Performance</a></td>
								<td><a href="deleteStudent?id=${student.id}"
									class="btn-delete">Delete</a></td>
								<td>${s.createdDate}</td>
						</c:forEach>
					</tbody>
				</table>
			</div>

		</div>
	</div>
>>>>>>> 181a61ee612775d2909cadf8e39e5c00c9eefc48
</body>
</html>