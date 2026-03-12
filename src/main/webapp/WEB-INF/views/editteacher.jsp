<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Teacher</title>
</head>

<body>

<h2>Edit Teacher</h2>

<form action="updateteacher" method="post">

<input type="hidden" name="id" value="${teacher.id}">

Name
<input type="text" name="name" value="${teacher.name}">
<br><br>

Email
<input type="text" name="email" value="${teacher.email}">
<br><br>

Contact
<input type="text" name="contact" value="${teacher.contact}">
<br><br>

Experience
<input type="text" name="experience" value="${teacher.experience}">
<br><br>

Subject

<select name="subject_id">

<c:forEach var="s" items="${subjects}">

<c:if test="${teacher.subject_id == s.id}">
<option value="${s.id}" selected="selected">
${s.subjectName}
</option>
</c:if>

<c:if test="${teacher.subject_id != s.id}">
<option value="${s.id}">
${s.subjectName}
</option>
</c:if>

</c:forEach>

</select>

<br><br>

<input type="submit" value="Update Teacher">

</form>

</body>
</html>