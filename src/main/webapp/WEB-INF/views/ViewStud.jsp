<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Teacher Table</title>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body{
    background: linear-gradient(135deg, #141e30, #243b55);
    min-height: 100vh;
}

.card{
    border-radius: 15px;
    box-shadow: 0 8px 20px rgba(0,0,0,0.3);
}

h3{
    font-weight: bold;
    color: #ff9800;
}

thead{
    background-color: #1d1d6d;
    color: white;
}

.table tbody tr:hover{
    background-color: #2c3e50;
    color: #fff;
    transition: 0.3s;
}

#searchInput{
    border-radius: 30px;
    padding: 10px 15px;
}

.btn-update{
    background-color: #2ca72e;
    color: white;
    border-radius: 20px;
    padding: 5px 12px;
    text-decoration: none;
}

.btn-update:hover{
    background-color: #e68a00;
    color: white;
}
.btn-performance{
    background-color: #2ca72e;
    color: white;
    border-radius: 20px;
    padding: 5px 12px;
    text-decoration: none;
}

.btn-performance:hover{
    background-color: #e68a00;
    color: white;
}

.btn-delete{
    background-color: #c23627;
    color: white;
    border-radius: 20px;
    padding: 5px 12px;
    text-decoration: none;
}

.btn-delete:hover{
    background-color: #c0392b;
    color: white;
}
</style>
</head>

<body>

<div class="container mt-5">
    <div class="card p-4">

        <h3 class="text-center mb-4">Student List</h3>

        <!-- Search Box -->
<form action="searchStudent" method="get">
Search Student:
    <input type="text" name="word" placeholder="Enter Name" value="${word}">
    <input type="submit" value="Search">
<a href="searchStudent">Reset</a></form>
<br/>

        <div class="table-responsive">
            <table class="table table-bordered table-striped" id="teacherTable">
                <thead>
                    <tr>
                        <th>Photo</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Contact</th>
                        <th>Location</th>
                        <th>Delete</th>
                    </tr>
                </thead>

                <tbody>
                <c:forEach var="student" items="${students}">
                    <tr>
                        <td>${student.id}</td>
                        <td>${student.name}</td>
                        <td>${student.email}</td>
                        <td>${student.contact}</td>
                        <td>${student.location}</td>
                        <td><a href="deleteStudent?id=${student.id}" class="btn-delete">Delete</a></td>
                        </tr>
               </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

<br>
<a href="admin">Back To DashBoard</a>
</body>
</html>