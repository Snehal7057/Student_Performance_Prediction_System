<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Teacher List</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<style>
body {
    margin: 0;
    padding: 0;
    font-family: 'Segoe UI', sans-serif;
    color: #000;
    position: relative;
}

.video-bg {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    object-fit: cover;
    z-index: -2;
}

.video-overlay {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.4);
    z-index: -1;
}

.main-wrapper {
    padding: 20px;
    position: relative;
    z-index: 1;
}

h2 {
    text-align: center;
    margin-bottom: 25px;
    color: #0d6efd;
}

.search-box {
    max-width: 700px;
    margin: 0 auto 30px;
}

.btn-simple {
    background-color: #fff;
    color: #0d6efd;
    border: 2px solid #0d6efd;
    font-weight: 500;
    transition: 0.3s;
    border-radius: 5px;
}

.btn-simple:hover {
    background-color: #0d6efd;
    color: #fff;
}

.teacher-card {
    background: #ffffff;
    border-radius: 8px;
    padding: 20px;
    position: relative;
    height: 100%;
    text-align: center;
    padding-top: 50px;
    box-shadow: 0 4px 6px rgba(0,0,0,0.1);
}

.profile-icon {
    position: absolute;
    top: -25px;
    left: 50%;
    transform: translateX(-50%);
    width: 50px;
    height: 50px;
    background: #fff;
    border: 2px solid #0d6efd;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 20px;
    color: #0d6efd;
}

.btn-row {
    display: flex;
    flex-wrap: wrap;
    gap: 8px;
}

.btn-row .btn-simple {
    flex: 1 1 calc(33.333% - 8px);
    min-width: 90px;
}

/* Disabled button */
.disabled-btn {
    pointer-events: none;
    opacity: 0.5;
}

/* Delete Modal */
.delete-modal {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0,0,0,0.5);
    display: none;
    align-items: center;
    justify-content: center;
    z-index: 9999;
}

.delete-box {
    background: #fff;
    padding: 25px;
    border-radius: 10px;
    text-align: center;
    width: 300px;
    border-top: 5px solid #0d6efd;
}
</style>
</head>

<body>

<video autoplay muted loop class="video-bg">
    <source src="${pageContext.request.contextPath}/resources/videos/teachdash.mp4" type="video/mp4">
</video>

<div class="video-overlay"></div>

<div class="main-wrapper">

<h2>Teacher List</h2>

<!-- SEARCH -->
<form action="searchteacher" method="get" class="row g-2 search-box">
    <div class="col-md-8 col-12">
        <input type="text" class="form-control" name="keyword"
        placeholder="Search by name, email, subject" value="${param.keyword}">
    </div>
    <div class="col-md-2 col-6">
        <button class="btn w-100 btn-simple">Search</button>
    </div>
    <div class="col-md-2 col-6">
        <a href="viewteachers" class="btn w-100 btn-simple">Reset</a>
    </div>
</form>

<!-- CARDS -->
<div class="container-fluid">
<div class="row g-4">

<c:forEach var="t" items="${teachers}">
<div class="col-lg-3 col-md-4 col-sm-6">
    <div class="teacher-card">
        <div class="profile-icon">
            <i class="fas fa-user"></i>
        </div>

        <h5>${t.name}</h5>
        <p><strong>Email:</strong> ${t.email}</p>
        <p><strong>Contact:</strong> ${t.contact}</p>
        <p><strong>Experience:</strong> ${t.experience} years</p>
        <p><strong>Subject:</strong> ${t.subjectName}</p>
        <p><strong>Joining Date:</strong> ${t.createdDate}</p>

        <!-- BUTTONS -->
        <div class="btn-row mt-3">

            <c:choose>
                <c:when test="${t.status == 'ACTIVE'}">
                    <!-- ENABLED -->
                    <a href="#" onclick="parent.openEditModal(${t.id})" class="btn btn-simple">Edit</a>

                    <a href="#" class="btn btn-simple"
                       onclick="openDeleteModal(${t.id}); return false;">Suspend</a>
                </c:when>

                <c:otherwise>
                    <!-- DISABLED -->
                    <a href="#" class="btn btn-simple disabled-btn" title="Teacher unavailable">Edit</a>

                    <a href="#" class="btn btn-simple disabled-btn" title="Teacher unavailable">Suspend</a>
                </c:otherwise>
            </c:choose>

            <!-- STATUS BUTTON -->
            <c:choose>
                <c:when test="${t.status == 'ACTIVE'}">
                    <a href="${pageContext.request.contextPath}/changeTeacherStatus?id=${t.id}&status=INACTIVE"
                       class="btn btn-simple">Unavailable</a>
                </c:when>
                <c:otherwise>
                    <a href="${pageContext.request.contextPath}/changeTeacherStatus?id=${t.id}&status=ACTIVE"
                       class="btn btn-simple">Available</a>
                </c:otherwise>
            </c:choose>

        </div>
    </div>
</div>
</c:forEach>

</div>
</div>
</div>

<!-- Delete Modal -->
<div id="deleteModal" class="delete-modal">
    <div class="delete-box">
        <h4>⚠ Confirm Delete</h4>
        <p>Are you sure you want to delete this teacher?</p>

        <div class="d-flex justify-content-between mt-3">
            <button class="btn btn-simple" onclick="closeDeleteModal()">Cancel</button>
            <a id="confirmDeleteBtn" class="btn btn-simple">Yes, Delete</a>
        </div>
    </div>
</div>

<script>
function openDeleteModal(id){
    document.getElementById("deleteModal").style.display="flex";
    document.getElementById("confirmDeleteBtn").href =
        "${pageContext.request.contextPath}/deleteteacher?id=" + id;
}

function closeDeleteModal(){
    document.getElementById("deleteModal").style.display="none";
}
</script>

</body>
</html>