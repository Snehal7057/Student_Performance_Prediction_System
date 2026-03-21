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

/* DARK OVERLAY */
body::before{
    content:"";
    position:fixed;
    width:100%;
    height:100%;
    background:rgba(0,0,0,0.7);
    z-index:-1;
}

/* CENTER */
.main-wrapper{
    height:100vh;
    display:flex;
    align-items:center;
    justify-content:center;
}

/* CARD */
.form-card{
    background:rgba(255,255,255,0.1);
    backdrop-filter:blur(12px);
    padding:30px;
    border-radius:12px;
    width:100%;
    max-width:450px;
    box-shadow:0 10px 30px rgba(0,0,0,0.5);
    animation:fadeIn 0.3s ease;
}

/* HEADING */
h2{
    text-align:center;
    margin-bottom:20px;
}

/* INPUT */
.form-control{
    background:rgba(255,255,255,0.1);
    border:1px solid rgba(255,255,255,0.3);
    color:white;
}

.form-control:focus{
    border-color:#38bdf8;
    box-shadow:0 0 6px #38bdf8;
    background:rgba(255,255,255,0.1);
    color:white;
}

/* BUTTON */
.upload-btn{
    background:linear-gradient(to right, #0b0f14, #121826);
    color:white;
    font-weight:600;
    margin-top:10px;
    border:none;
}

.upload-btn:hover{
    background:#0ea5e9;
}

/* ANIMATION */
@keyframes fadeIn{
    from{opacity:0; transform:translateY(20px);}
    to{opacity:1; transform:translateY(0);}
}

</style>

</head>

<body>

<!-- VIDEO -->
<video autoplay muted loop class="video-bg">
<source src="${pageContext.request.contextPath}/resources/videos/videoad.mp4">
</video>

<div class="main-wrapper">

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
Upload
</button>

</form>

</div>

</div>

</body>
</html>