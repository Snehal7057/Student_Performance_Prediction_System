<%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>

<title>Study Materials</title>

<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>

body{

background:rgb(5,39,69);

font-family:'Segoe UI',Arial;

color:white;

padding:20px;

}

/* Heading */

h2{

text-align:center;

color:orange;

margin-bottom:25px;

}

/* Table Card */

.table-card{

background:#02213e;

padding:20px;

border-radius:10px;

box-shadow:0 10px 25px rgba(0,0,0,0.6);

}

/* Table */

.table{

color:white;

}

.table thead{

background:#01172b;

}

.table tbody tr:hover{

background:#01172b;

}

/* File button */

.file-btn{

background:orange;

border:none;

color:black;

font-size:14px;

padding:5px 10px;

border-radius:6px;

text-decoration:none;

}

.file-btn:hover{

background:orangered;

color:white;

}

</style>

</head>

<body>

<h2>Study Materials</h2>

<div class="table-card">

<div class="table-responsive">

<table class="table table-bordered align-middle text-center">

<thead>

<tr>

<th>ID</th>

<th>Subject</th>

<th>File</th>

<th>Teacher</th>

<th>Date</th>

</tr>

</thead>

<tbody>

<c:forEach var="m" items="${materials}" varStatus="status">

<tr>

<td>${status.count}</td>

<td>${m.subject_name}</td>

<td>

<a class="file-btn"
href="uploads/study_material/${m.file_name}"
target="_blank">

View File

</a>

</td>

<td>${m.teacher_name}</td>

<td>${m.upload_date}</td>

</tr>

</c:forEach>

</tbody>

</table>

</div>

</div>

</body>
</html>