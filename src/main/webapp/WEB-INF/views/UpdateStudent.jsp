<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html>
<head>
    <title>Update Student</title>
</head>
<body>
    <h2>Update Student</h2>

    <c:if test="${not empty msg}">
        <p style="color:green">${msg}</p>
    </c:if>
    <!-- Form to update student -->
    <form:form method="post" modelAttribute="student">
        <form:hidden path="id" /> <!-- Hidden field to pass student id -->

        Name: <form:input path="name" /><br/><br/>
        Email: <form:input path="email" /><br/><br/>
        Contact: <form:input path="contact" /><br/><br/>
        Location: <form:input path="location" /><br/><br/>

        <input type="submit" value="Update Student"/>
    </form:form>

    <br/>
 <button>  <a href="viewStudent">Back to Student List</a>  </button>
</body>
</html>