<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Upload Study Material</title>

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

padding:30px;

border-radius:12px;

width:100%;
max-width:500px;

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

/* Upload Button */

.upload-btn{

background:orange;

border:none;

color:black;

font-weight:600;

margin-top:10px;

}

.upload-btn:hover{

background:orangered;

}

/* Back Link */

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

</head>

<body>

<div class="form-card">

<h2>Upload Study Material</h2>

<form action="${pageContext.request.contextPath}/uploadMaterial"
method="post"
enctype="multipart/form-data">

<div class="mb-3">

<label class="form-label">Subject</label>

<select name="subject_id" class="form-control" required>

<c:forEach var="s" items="${subjects}">

<option value="${s.id}">
${s.subjectName}
</option>

</c:forEach>

</select>

</div>

<div class="mb-3">

<label class="form-label">Select File</label>

<input type="file"
name="file"
class="form-control"
required>

</div>

<button class="btn upload-btn w-100">
Upload Material
</button>

</form>


</div>

</body>
</html>