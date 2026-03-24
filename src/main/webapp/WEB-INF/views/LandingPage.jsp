<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>My Website</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">

<!-- AOS CSS -->
<link href="https://unpkg.com/aos@2.3.4/dist/aos.css" rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap"
	rel="stylesheet">
<link href="https://unpkg.com/aos@2.3.4/dist/aos.css" rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/CSS/navbar.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/CSS/main.css">
<style>
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

.modal {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.5);
}

.modal-content {
	background: white;
	padding: 20px;
	width: 300px;
	margin: 100px auto;
	border-radius: 10px;
}

.blur {
	filter: blur(5px);
	pointer-events: none;
}

/* Modal */
.modal {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.6);
	display: none;
	justify-content: center;
	align-items: center;
	z-index: 9999;
}

.modal-content {
	background: white;
	padding: 25px;
	border-radius: 10px;
	width: 300px;
}
.video-section {
    position: relative;
    width: 100%;
    height: 700px;
    overflow: hidden;
}

.video-section video {
    width: 100%;
    height: 100%;
    object-fit: cover;
}

.video-content {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    color: white;
    text-align: center;
}

.video-content h1 {
    font-size: 40px;
    font-weight: bold;
    color:linear-gradient(to right, #0b0f14, #121826);
}

.video-content p {
    font-size: 18px;
}


</style>

</head>

<body>

	<div class="page-wrapper">
		<!-- Navbar -->
		<jsp:include page="nav.jsp" />

		<div class="content">
<div class="video-section">
    <video autoplay muted loop>
        <source src="resources/videos/fir.mp4" type="video/mp4">
    </video>

    <div class="video-content">
        <h1>Education should be like the wind , reaching EveryOne</h1>
        <p>Smart Student Performance Prediction System</p>
    </div>
</div>
			<!-- Content -->
			<jsp:include page="about.jsp" />
			<jsp:include page="carriers.jsp" />
			<jsp:include page="contact.jsp" />

		</div>
		<jsp:include page="Footer.jsp" />
	</div>
	<script src="https://unpkg.com/aos@2.3.4/dist/aos.js"></script>

	<script>
		AOS.init({
			duration : 1000,
			once : true
		});
		function openLogin() {
			document.getElementById("loginModal").style.display = "flex";
			document.getElementById("mainContent").classList.add("blur");
		}

		function closeLogin() {
			document.getElementById("loginModal").style.display = "none";
			document.getElementById("mainContent").classList.remove("blur");
		}
		
		window.onload = function() {
		    var error = "${sessionScope.loginError}";
		    if (error) {
		        document.getElementById("loginModal").style.display = "flex";
		    }
		}
		window.onload = function() {
	        const urlParams = new URLSearchParams(window.location.search);

	        if (urlParams.has('error') || urlParams.has('logout')) {
	            document.getElementById("loginModal").style.display = "block";
	            setTimeout(function() {
	                var msg = document.getElementById("errorMsg");
	                if (msg) {
	                    msg.style.display = "none";
	                }
	            }, 3000); 
	        }
	    }

		
		window.onload = function() {
			setTimeout(function() {
				openLogin();
			}, 4000);
		};
		
	</script>
	<script type="module"
		src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
	<script nomodule
		src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
	<script src="https://unpkg.com/aos@2.3.4/dist/aos.js"></script>
	<script src="${pageContext.request.contextPath}/resources/JS/app.js"></script>
</body>
</html>