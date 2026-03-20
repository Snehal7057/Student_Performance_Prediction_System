<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- ✅ Mobile responsive -->
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>My Website</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">

<!-- AOS CSS -->
<link href="https://unpkg.com/aos@2.3.4/dist/aos.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="resources/CSS/footer.css">
<link rel="stylesheet" href="resources/CSS/main.css">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
<link href="https://unpkg.com/aos@2.3.4/dist/aos.css" rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/CSS/navbar.css">
</head>
<style>
/* RESET */
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

html, body {
	margin: 0;
	padding: 0;
	height: 100%;
}

/* BODY */
body {
	font-family: 'Poppins', sans-serif;
	margin: 0 !important;
	overflow-x: hidden;
}

/* SMOOTH SCROLL */
html {
	scroll-behavior: smooth;
}

.page-wrapper {
	display: flex;
	flex-direction: column;
	min-height: 100vh;
}

.content {
	flex: 1;
}
</style>

</head>

<body>
	<div class="page-wrapper">
		<!-- Navbar -->
		<jsp:include page="nav.jsp" />

		<div class="content">

			<!-- Content -->

			  <jsp:include page="about.jsp" />   
			  <jsp:include page="carriers.jsp" />   
			  <jsp:include page="contact.jsp" />   

		</div>
	 <jsp:include page="Footer.jsp" /> 

	</div>
	<!-- ✅ AOS JS FIRST -->
	<script src="https://unpkg.com/aos@2.3.4/dist/aos.js"></script>

	<!-- ✅ THEN INIT -->
	<script>
		AOS.init({
			duration : 1000,
			once : true
		});
	</script>
<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
<script src="https://unpkg.com/aos@2.3.4/dist/aos.js"></script>
<script src="${pageContext.request.contextPath}/resources/JS/app.js"></script>
</body>
</html>