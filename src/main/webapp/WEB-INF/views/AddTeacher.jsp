<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Teacher</title>
</head>

<body>

<h2>Add Teacher</h2>

<form action="${pageContext.request.contextPath}/addteacher" method="post">

	Name:
	<input type="text" name="name" required>
	<br><br>

	Email:
	<input type="email" name="email" required>
	<br><br>

	Contact:
	<input type="text" name="contact" required>
	<br><br>

	Experience:
	<input type="number" name="experience" placeholder="Enter experience in years" required>
	<br><br>

	Subject:
	<select name="subject_id">
		<option value="">Select Subject</option>

		<c:forEach var="s" items="${subjects}">
			<option value="${s.id}">${s.subjectName}</option>
		</c:forEach>

	</select>
	<br><br>

	<button type="submit">Add Teacher</button>
	<br>
	<br>
<a href="admin">Back To DashBoard</a>
</form>

</body>
</html>