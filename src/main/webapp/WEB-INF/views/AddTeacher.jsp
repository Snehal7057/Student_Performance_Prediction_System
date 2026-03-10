<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Teacher</title>
</head>

<body>

<h2>Add Teacher</h2>

<form action="addteacher" method="post">

Name
<input type="text" name="name"><br><br>

Email
<input type="email" name="email"><br><br>

Password
<input type="password" name="password"><br><br>

Contact
<input type="text" name="contact"><br><br>

<input type="hidden" name="roleId" value="2">

<button type="submit">Add Teacher</button>

</form>

</body>
</html>