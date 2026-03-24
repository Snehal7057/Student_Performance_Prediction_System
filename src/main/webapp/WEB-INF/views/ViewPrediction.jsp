<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>

<title>View Predictions</title>

<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

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
.table-card{
    width:85%;
    max-width:1100px;
    background:rgba(255,255,255,0.08);
    backdrop-filter:blur(15px);
    padding:25px;
    border-radius:16px;
    box-shadow:0 15px 40px rgba(0,0,0,0.7);
    position:relative;
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
    font-size:28px;
    margin-bottom:20px;
}

/* TABLE */
.table{
    color:white;
}

.table thead{
    background:rgba(0,0,0,0.7);
}

.table tbody tr:hover{
    background:rgba(255,255,255,0.12);
    transition:0.3s;
}

/* SCORE BADGE */
.badge-score{
    padding:5px 10px;
    border-radius:10px;
}

.high{ background:#28a745; }
.medium{ background:#ffc107; color:black; }
.low{ background:#dc3545; }

</style>

</head>

<body>

<!-- VIDEO -->
<video autoplay muted loop class="video-bg">
<source src="${pageContext.request.contextPath}/resources/videos/teachdash.mp4">
</video>

<div class="wrapper">

    <div class="table-card">

        <!-- CLOSE -->
        <span class="close-btn" onclick="closeModal()">❌</span>

        <div class="title">📊 Student Predictions</div>

        <div class="table-responsive">

            <table class="table table-bordered text-center align-middle">

                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Month</th>
                        <th>Score</th>
                        <th>Date</th>
                    </tr>
                </thead>

                <tbody>

                <c:forEach var="p" items="${predictions}">

                    <tr>

                        <td>${p.prediction_id}</td>
                        <td><b>${p.name}</b></td>
                        <td>${p.month}</td>

                        <td>
                            <c:choose>
                                <c:when test="${p.predicted_score >= 75}">
                                    <span class="badge-score high">${p.predicted_score}%</span>
                                </c:when>
                                <c:when test="${p.predicted_score >= 50}">
                                    <span class="badge-score medium">${p.predicted_score}%</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="badge-score low">${p.predicted_score}%</span>
                                </c:otherwise>
                            </c:choose>
                        </td>

                        <td>${p.created_at}</td>

                    </tr>

                </c:forEach>

                </tbody>

            </table>

        </div>

    </div>

</div>

<script>
function closeModal(){
    try{
        window.parent.closeModal();
    }catch(e){
        window.close(); 
    }
}
</script>

</body>
</html>