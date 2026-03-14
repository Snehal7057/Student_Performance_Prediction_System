<%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>

<h2>Study Materials</h2>

<table border="1">

<tr>
<th>ID</th>
<th>Subject</th>
<th>File</th>
<th>Teacher</th>
<th>Date</th>
</tr>

<c:forEach var="m" items="${materials}" varStatus="status">

<tr>

<td>${status.count}</td>

<td>${m.subject_name}</td>

<td>
<a href="${pageContext.request.contextPath}/uploads/study_material/${m.file_name}" target="_blank">
${m.file_name}
</a>

</td>

<td>${m.teacher_name}</td>

<td>${m.upload_date}</td>

</tr>

</c:forEach>

</table>