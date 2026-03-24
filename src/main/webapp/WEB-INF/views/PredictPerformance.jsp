<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Predict Student</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<style>

/* BODY */
body{
    margin:0;
    font-family:'Segoe UI',sans-serif;
    color:white;
    overflow:hidden;
}

/* VIDEO */
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
    background:rgba(0,0,0,0.75);
    z-index:-1;
}

/* CENTER */
.wrapper{
    height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
}

/* CARD */
.card-box{
    width:400px;
    background:rgba(255,255,255,0.08);
    backdrop-filter:blur(15px);
    padding:25px;
    border-radius:16px;
    box-shadow:0 15px 40px rgba(0,0,0,0.7);
    position:relative;
    animation:fadeIn 0.5s ease;
}

/* CLOSE */
.close-btn{
    position:absolute;
    right:15px;
    top:10px;
    font-size:20px;
    cursor:pointer;
}

/* TITLE */
.title{
    text-align:center;
    font-size:22px;
    margin-bottom:20px;
}

/* BUTTON */
.btn-custom{
    background:linear-gradient(to right, #0b0f14, #121826);
    border:none;
    transition:0.3s;
}

.btn-custom:hover{
    background:#0ea5e9;
}

/* RESULT */
.result-box{
    margin-top:20px;
    background:rgba(0,0,0,0.5);
    padding:15px;
    border-radius:10px;
    text-align:center;
}

/* ANIMATION */
@keyframes fadeIn{
    from{opacity:0; transform:translateY(30px);}
    to{opacity:1; transform:translateY(0);}
}

</style>

</head>

<body>

<!-- VIDEO -->
<video autoplay muted loop class="video-bg">
<source src="${pageContext.request.contextPath}/resources/videos/teachdash.mp4">
</video>

<div class="wrapper">

    <div class="card-box">

        <!-- CLOSE -->
        <span class="close-btn" onclick="closeModal()">❌</span>

        <div class="title">🎓 Student Performance Prediction</div>

        <form action="predictAuto" method="post">

            <div class="mb-3">
                <label>Select Student</label>
                <select name="studentId" class="form-select" required>
                    <c:forEach var="s" items="${students}">
                        <option value="${s.id}">${s.name}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="d-grid">
                <button type="submit" class="btn btn-custom text-white">
                    🔍 Predict Performance
                </button>
            </div>

        </form>

        <!-- RESULT -->
        <c:if test="${not empty result}">
            <div class="result-box">
                <h6>📊 Predicted Score</h6>
                <h3>${result}</h3>
            </div>
        </c:if>

        <!-- ERROR -->
        <c:if test="${not empty msg}">
            <div class="result-box text-danger">
                ${msg}
            </div>
        </c:if>

    </div>

</div>

<script>
function closeModal(){
    if(window.parent && window.parent.closeModal){
        window.parent.closeModal();
    }
}
</script>

</body>
</html>