<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Predictions</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
/* BACKGROUND VIDEO */
.video-bg{
    position: fixed;
    width: 100%;
    height: 100%;
    object-fit: cover;
    z-index: -2;
}
body::before{
    content:"";
    position: fixed;
    width: 100%;
    height: 100%;
    background: rgba(0,0,0,0.5); /* dark overlay for readability */
    z-index: -1;
}

/* BODY */
body {
    font-family: 'Segoe UI', sans-serif;
    min-height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
    margin:0;
    padding:0;
    color: #212529;
}

/* CARD STYLE */
.card {
    background: rgba(255,255,255,0.95); /* white with slight transparency */
    border-radius: 15px;
    padding: 30px;
    box-shadow: 0 8px 20px rgba(0,0,0,0.25);
    width: 90%;
    max-width: 1000px;
}

/* HEADING */
.card h3 {
    text-align: center;
    font-weight: 600;
    margin-bottom: 30px;
}

/* TABLE */
.table {
    border-radius: 10px;
    overflow: hidden;
}

.table thead {
    background: linear-gradient(90deg, #667eea, #764ba2);
    color: #fff;
    font-weight: 600;
}

.table tbody tr:hover {
    background: rgba(102, 126, 234, 0.1);
    transition: 0.2s;
}

/* PREDICTED SCORE COLORS */
.score-high {
    color: #28a745; /* green */
    font-weight: bold;
}

.score-medium {
    color: #ffc107; /* yellow/orange */
    font-weight: bold;
}

.score-low {
    color: #dc3545; /* red */
    font-weight: bold;
}
</style>
</head>
<body>

<!-- BACKGROUND VIDEO -->
<video autoplay muted loop class="video-bg">
    <source src="${pageContext.request.contextPath}/resources/videos/teachdash.mp4" type="video/mp4">
</video>

<div class="card shadow-lg">

    <h3>📊 Student Predictions</h3>
    
    <div class="table-responsive">
        <table class="table table-bordered table-striped mb-0 text-center">
            <thead>
                <tr>
                    <th>PID</th>
                    <th>Student Name</th>
                    <th>Month</th>
                    <th>Predicted Percentage</th>
                    <th>Created At</th>
                </tr>
            </thead> 
            <tbody>
                <c:forEach var="p" items="${predictions}">
                    <tr>
                        <td>${p.prediction_id}</td>
                        <td>${p.name}</td>
                        <td>${p.month}</td>
                        <td>
                            <c:choose>
                                <c:when test="${p.predicted_score >= 80}">
                                    <span class="score-high">${p.predicted_score}%</span>
                                </c:when>
                                <c:when test="${p.predicted_score >= 50}">
                                    <span class="score-medium">${p.predicted_score}%</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="score-low">${p.predicted_score}%</span>
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

</body>
</html>