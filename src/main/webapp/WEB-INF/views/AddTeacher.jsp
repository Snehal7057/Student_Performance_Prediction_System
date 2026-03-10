<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="addTeacher" method="post">

Name
<input type="text" name="name">

Email
<input type="email" name="email">

Password
<input type="password" name="password">

Contact
<input type="text" name="contact">

<input type="hidden" name="roleId" value="2">

<button type="submit">Add Teacher</button>

</form>
</body>
</html>