<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>Add Student Performance</h2>

    <c:if test="${not empty msg}">
        <p style="color:green">${msg}</p>
    </c:if>
    
    <form:form method="post" modelAttribute="performance">
        <form:hidden path="id"/>
        <form:hidden path="student_id"/>
        Attendance: <form:input path="attendance"/><br/><br/>
        Study_Hours: <form:input path="study_hours" /><br/><br/>
        Assesment: <form:input path="assesment" /><br/><br/>
        Participation: <form:input path="participation" /><br/><br/>
        Percentage: <form:input path="percentage" /><br/><br/>
        <input type="submit" value="Added Performance"/>
    </form:form>
    <br/>
 <button>  <a href="viewStudent">Back to Student List</a>  </button>
</body>
</html>