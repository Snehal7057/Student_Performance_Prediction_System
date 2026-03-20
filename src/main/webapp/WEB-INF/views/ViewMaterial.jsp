<%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>

<title>Study Materials</title>

<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>

/* ===== BODY ===== */
body{
    margin:0;
    font-family:'Segoe UI',sans-serif;
    color:white;
}

/* VIDEO BG */
.video-bg{
    position:fixed;
    width:100%;
    height:100%;
    object-fit:cover;
    z-index:-2;
}

/* OVERLAY */
body::before{
    content:"";
    position:fixed;
    width:100%;
    height:100%;
    background:rgba(0,0,0,0.7);
    z-index:-1;
}

/* HEADING */
h2{
    text-align:center;
    margin:0;
    padding:10px
}

/* CARD */
.table-card{
    background:rgba(255,255,255,0.1);
    backdrop-filter:blur(12px);
    padding:20px;
    border-radius:12px;
    box-shadow:0 10px 25px rgba(0,0,0,0.6);
}

/* TABLE */
.table{
    color:white;
}

.table thead{
    background:rgba(0,0,0,0.6);
}

.table tbody tr:hover{
    background:rgba(255,255,255,0.1);
}

/* FILE BUTTON */
.file-btn{
    background:linear-gradient(to right, #0b0f14, #121826);
    color:white;
    font-size:13px;
    padding:6px 10px;
    border-radius:6px;
    text-decoration:none;
    display:inline-block;
}

.file-btn:hover{
    background:#0ea5e9;
}

</style>

</head>

<body>

<!-- VIDEO -->
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

<!-- FILE NAME -->
<a href="${pageContext.request.contextPath}/uploads/study_material/${m.file_name}" target="_blank">
${m.file_name}
</a>

<br>

<!-- VIEW BUTTON -->
<a class="file-btn"
href="${pageContext.request.contextPath}/uploads/study_material/${m.file_name}"
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

</div>

</body>
</html>