<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Upload Study Material</title>
</head>

<body>

<h2>Upload Study Material</h2>

<form action="uploadMaterial" method="post" enctype="multipart/form-data">

Subject

<select name="subject_id">

<c:forEach var="s" items="${subjects}">

<option value="${s.id}">

${s.subjectName}

</option>

</c:forEach>

</select>

<br><br>

Select File

<input type="file" name="file">

<br><br>

<input type="submit" value="Upload Material">

</form>

</body>
</html>