<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>View Teachers</title>
</head>

<body>

<h2>Teacher List</h2>

<form action="searchteacher" method="get">

Search Teacher:
<input type="text" name="keyword" placeholder="Enter name / email / subject">

<input type="submit" value="Search">

<a href="viewteachers">Reset</a>

</form>

<table border="1">

<tr>
<th>ID</th>
<th>Name</th>
<th>Email</th>
<th>Contact</th>
<th>Experience</th>
<th>Subject Name</th>
<th colspan="2">Action</th>
</tr>

<c:forEach var="t" items="${teachers}" varStatus="status">

<tr>
<td>${status.count}</td> 
<td>${t.name}</td>
<td>${t.email}</td>
<td>${t.contact}</td>
<td>${t.experience}</td>
<td>${t.subjectName}</td>
<td>
<a href="deleteteacher?id=${t.id}">delete</a>
</td>
<td>
<a href="editteacher?id=${t.id}">update</a>
</td>
</tr>

</c:forEach>

</table>

</body>
</html>