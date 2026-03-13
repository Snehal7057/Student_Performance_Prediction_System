<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Performance</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<h2>Add Student Performance</h2>

<c:if test="${not empty msg}">
    <p style="color:green">${msg}</p>
</c:if>

<form:form method="post" modelAttribute="performance">

    <form:hidden path="student_id"/>

   Attendance:
<form:input path="attendance" type="number" placeholder="Enter Attendance %"/>
<br/><br/>
Study Hours:
<form:input path="study_hours" type="number" placeholder="Enter Study Hours"/>
<br/><br/>

Assessment:
<form:input path="assessment" type="number" placeholder="Enter Assessment %"/>
<br/><br/>

Participation:
<form:input path="participation" type="number" placeholder="Enter  out of 10"/>
<br/><br/>

Percentage:
<form:input path="percentage" type="number" placeholder="Enter Percentage %"/>
    <input type="submit" value="Add Performance"/>
</form:form>

<br/><br/>

<a href="viewStudent">Back to Student List</a>

</body>
</html>