<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>Study Materials</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body {
    margin:0;
    font-family: 'Segoe UI', sans-serif;
    color: #fff;
    background: transparent;
}

.video-bg {
    position: fixed;
    width: 100%;
    height: 100%;
    object-fit: cover;
    z-index: -2;
}

body::before {
    content: "";
    position: fixed;
    width: 100%;
    height: 100%;
    background: rgba(0,0,0,0.7);
    z-index: -1;
}

h2 {
    text-align: center;
    padding-top:35px;
    margin-bottom: 45px;
    font-weight: 700;
    font-size: 32px;
}

.table {
    color: #fff;
    border-collapse: collapse;
    width: 100%;
}

.table th, .table td {
    vertical-align: middle;
    text-align: center;
    padding: 12px 15px;
    border: 1px solid #ccc;
}

.table thead {
    background: rgba(0,0,0,0.6);
    color: black;
    font-weight: 600;
    text-transform: uppercase;
}

.table tbody tr:hover {
    background: rgba(255,255,255,0.1);
}

/* Button style for filename */
.file-btn {
    display: inline-block;
    background-color: #0ea5e9;
    color: white;
    padding: 6px 12px;
    border-radius: 6px;
    text-decoration: none;
    transition: 0.3s;
    cursor: pointer;
}

.file-btn:hover {
    background-color: #0284c7;
    transform: translateY(-1px);
}

/* Responsive table scroll */
.table-responsive {
    max-height: 550px;
    overflow-y: auto;
}
</style>
</head>

<body>

<video autoplay muted loop class="video-bg">
<source src="${pageContext.request.contextPath}/resources/videos/teachdash.mp4">
</video>

<h2>Study Materials</h2>

<div class="container">
<div class="table-card">
<div class="table-responsive">
<table class="table table-bordered align-middle text-center">
<thead>
<tr>
<th style="width:5%;">PID</th>
<th style="width:20%;">Subject</th>
<th style="width:20%;">File</th>
<th style="width:30%;">Teacher</th>
<th style="width:15%;">Date</th>
</tr>
</thead>

<tbody>
<c:forEach var="m" items="${materials}" varStatus="status">
<tr>
<td>${status.count}</td>
<td>${m.subject_name}</td>
<td>
    <!-- Filename button that is clickable -->
    <a href="${pageContext.request.contextPath}/uploads/study_material/${m.file_name}" 
       target="_blank"
       class="file-btn">Download</a>
</td>
<td>${m.teacher_name}</td>
<td>${m.upload_date}</td>
</tr>
</c:forEach>
</tbody>

</table>
</div>
</div>
</div>

</body>
</html>