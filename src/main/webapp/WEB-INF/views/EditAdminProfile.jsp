<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>Edit Profile</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

</head>
<body style="background:#0b0f14; color:white;">

<div class="container mt-5">
<div class="card p-4" style="max-width:500px; margin:auto;">

<h3 class="text-center mb-4">Edit Profile</h3>

<form action="updateAdminProfile" method="post">

<input type="hidden" name="id" value="${admin.id}">

<div class="mb-3">
<label>Name</label>
<input type="text" name="name" class="form-control" value="${admin.name}">
</div>

<div class="mb-3">
<label>Email</label>
<input type="text" name="email" class="form-control" value="${admin.email}">
</div>

<div class="mb-3">
<label>Contact</label>
<input type="text" name="contact" class="form-control" value="${admin.contact}">
</div>

<button class="btn btn-success w-100">Update</button>

</form>

</div>
</div>

</body>
</html>