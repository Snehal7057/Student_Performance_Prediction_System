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

	<form action="addteacher" method="post">

		Name <input type="text" name="name"><br>
		<br> Email <input type="email" name="email"><br>
		<br> Contact <input type="text" name="contact"><br>
		<br> Experience <input type="number" name="experience"><br>
		<br> Subject <select name="subjectId">

			<c:forEach var="s" items="${subjects}">
				<option value="${s.id}">${s.subject_name}</option>
			</c:forEach>

		</select><br>
		<br>

		<button type="submit">Add Teacher</button>

	</form>

</body>
</html>