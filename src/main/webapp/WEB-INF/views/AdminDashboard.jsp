<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Admin Dashboard - BrainlyEdu</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">

<style>
body {
	margin: 0;
	font-family: 'Segoe UI', sans-serif;
	background: #0b0f14;
	color: white;
	overflow: visible !important;
}

#menu-toggle {
	display: none;
}

/* ================= NAVBAR ================= */
.navbar-admin {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 60px;
	z-index: 9999;
	background: linear-gradient(to right, #0b0f14, #121826);
	padding: 0 20px;
	display: flex;
	align-items: center;
	justify-content: space-between;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.5);
}

/* TOGGLE ICON */
.toggle-btn {
	font-size: 24px;
	color: #38bdf8;
	cursor: pointer;
	transition: 0.3s;
}

.toggle-btn:hover {
	color: white;
}

#menu-toggle:checked+.navbar-admin .toggle-btn i::before {
	content: "\f62a";
}

/* LOGO */
.logo {
	color: white;
	font-weight: 600;
	margin: 0;
}

.admin-box {
	position: relative;
	cursor: pointer;
}

.admin-box i {
	font-size: 22px;
	color: #38bdf8;
}

.dropdown-menu-custom {
	position: absolute;
	right: 0;
	top: 40px;
	background: #1e293b;
	border-radius: 8px;
	display: none;
	min-width: 140px;
}

.dropdown-menu-custom a {
	display: block;
	padding: 10px;
	color: white;
	text-decoration: none;
}

.dropdown-menu-custom a:hover {
	background: #334155;
}

/* ================= SIDEBAR ================= */
#sidebar {
	position: fixed;
	top: 60px;
	left: -260px;
	width: 260px;
	height: calc(100vh - 60px);
	background: linear-gradient(to right, #0b0f14, #121826);
	padding-top: 20px;
	transition: 0.3s;
	z-index: 1000;
}

#menu-toggle:checked ~ #sidebar {
	left: 0;
}

#sidebar a {
	display: flex;
	padding: 12px 20px;
	color: #cbd5e1;
	text-decoration: none;
}

#sidebar a:hover {
	background: #1e293b;
	color: #38bdf8;
}

.main-content {
	margin-top: 60px;
	height: calc(100vh - 60px);
	position: relative;
}

/* VIDEO */
.video-bg {
	position: absolute;
	width: 100%;
	height: 100%;
	object-fit: cover;
	filter: blur(6px) brightness(0.5);
}

/* IFRAME */
iframe {
	width: 100%;
	height: 100%;
	border: none;
	position: relative;
	z-index: 1;
	max-height: 90vh;
	overflow: auto;
}

/* ================= MODAL ================= */
.custom-overlay {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.6);
	backdrop-filter: blur(8px);
	opacity: 0;
	visibility: hidden;
	transition: 0.3s;
	z-index: 999998 !important;
}

.custom-overlay.show {
	opacity: 1;
	visibility: visible;
}

.custom-modal {
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%) scale(0.8);
	width: 520px;
	max-width: 90%;
	background: white;
	border-radius: 12px;
	overflow: hidden;
	opacity: 0;
	visibility: hidden;
	transition: 0.3s;
	z-index: 999999 !important;
}

.custom-modal.show {
	opacity: 1;
	visibility: visible;
	transform: translate(-50%, -50%) scale(1);
}

.modal-content {
	max-height: 85vh;
	overflow: auto;
}

/* ================= FOOTER ================= */
.footer {
	text-align: center;
	padding: 10px;
	background: #0b0f14;
	color: #94a3b8;
}

.logo {
	color: white;
	font-size: 28px;
	font-weight: bold;
}

.edu {
	color: #00c6ff;
}

.main-content iframe {
	position: relative;
	z-index: 1;
}

#menu-toggle:checked ~ .main-content {
	margin-left: 260px;
}

#sidebar {
	z-index: 500;
}

.modal-frame {
	width: 100%;
	height: 90vh;
	border: none;
}
</style>
</head>

<body>

	<input type="checkbox" id="menu-toggle">

	<!-- ================= NAVBAR ================= -->
	<div class="navbar-admin">

		<label for="menu-toggle" class="toggle-btn"> <i
			class="bi bi-list"></i>
		</label>

		<div class="logo">
			<span class="brand-icon"> <svg width="28" height="28"
					viewBox="0 0 24 24" fill="white">
            <path d="M12 3L1 9L12 15L21 10.09V17H23V9L12 3Z" />
            <path
						d="M5 12V17C5 19.21 8.13 21 12 21C15.87 21 19 19.21 19 17V12L12 17L5 12Z" />
          </svg>
			</span> Brainly<span class="edu">Edu</span>
		</div>

		<!-- ADMIN -->
		<div class="admin-box" onclick="toggleDropdown()">
			<i class="bi bi-person-circle"></i>

			<div class="dropdown-menu-custom" id="dropdown">
				<a href="#" onclick="openAdminEditModal()">Edit Profile</a> <a
					href="${pageContext.request.contextPath}/logout">Logout</a>
			</div>
		</div>

	</div>

	<div id="sidebar">

		<a href="${pageContext.request.contextPath}/welcome"
			target="content-frame"><i class="bi bi-speedometer2"></i>
			Dashboard </a> <a href="#" onclick="openModal()"> <i
			class="bi bi-person-plus"></i> Add Teacher
		</a> <a href="${pageContext.request.contextPath}/viewteachers"
			target="content-frame"><i class="bi bi-people"></i> View Teachers
		</a> <a href="${pageContext.request.contextPath}/admin/viewStudent"
			target="content-frame"><i class="bi bi-mortarboard"></i> Students
		</a> <a href="${pageContext.request.contextPath}/admin/viewPerformance"
			target="content-frame"><i class="bi bi-bar-chart"></i>
			Performance </a> <a
			href="${pageContext.request.contextPath}/admin/predictStudent"> <i
			class="bi bi-cpu"></i> Predict Student
		</a> <a href="${pageContext.request.contextPath}/admin/viewPredictions">
			<i class="bi bi-graph-up-arrow"></i> View Predictions
		</a><a href="${pageContext.request.contextPath}/"><i
			class="bi bi-box-arrow-right"></i> Logout </a>

	</div>

	<!-- ================= MAIN ================= -->
	<div class="main-content">

		<video autoplay muted loop class="video-bg">
			<source
				src="${pageContext.request.contextPath}/resources/videos/videoad.mp4">
		</video>

		<iframe name="content-frame"
			src="${pageContext.request.contextPath}/welcome"></iframe>

	</div>

	<!-- ================= FOOTER ================= -->
	<div class="footer">© 2026 BrainlyEdu</div>

	<!-- ================= MODAL ================= -->
	<div class="custom-overlay" id="addOverlay" onclick="closeModal()"></div>

	<div class="custom-modal" id="modal">
		<div class="modal-content">
			<%@ include file="AddTeacher.jsp"%>
		</div>
	</div>


	<!-- EDIT MODAL -->
	<div class="custom-overlay" id="editOverlay" onclick="closeEditModal()"></div>

	<div class="custom-modal" id="editModal">
		<iframe id="editFrame" class="modal-frame"></iframe>
	</div>


	<div id="adminEditModal"
		style="display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0, 0, 0, 0.6); z-index: 9999; justify-content: center; align-items: center;">

		<div
			style="background: white; padding: 25px; border-radius: 10px; width: 350px;">

			<h4>Edit Profile</h4>

			<form action="updateAdminProfileData" method="post">

				<input type="hidden" name="id" value="${sessionScope.admin.id}">

				<label>Name</label> <input type="text" name="name"
					value="${sessionScope.admin.name}" class="form-control"><br>

				<label>Email</label> <input type="text" name="email"
					value="${sessionScope.admin.email}" class="form-control"><br>

				<label>Contact</label> <input type="text" name="contact"
					value="${sessionScope.admin.contact}" class="form-control"><br>

				<div class="d-flex justify-content-between">
					<button class="btn btn-success">Update</button>
					<button type="button" onclick="closeAdminEditModal()"
						class="btn btn-secondary">Cancel</button>
				</div>

			</form>

		</div>
	</div>



	<!-- ================= SCRIPT ================= -->
	<script>
		function openModal() {
			document.getElementById("modal").classList.add("show");
			document.getElementById("addOverlay").classList.add("show");
		}

		function closeModal() {
			document.getElementById("modal").classList.remove("show");
			document.getElementById("addOverlay").classList.remove("show");
		}

		function toggleDropdown() {
			let d = document.getElementById("dropdown");
			d.style.display = d.style.display === "block" ? "none" : "block";
		}

		window.onclick = function(e) {
			if (!e.target.closest(".admin-box")) {
				document.getElementById("dropdown").style.display = "none";
			}
		}

		/* edit teacher */

		function openEditModal(id) {
			document.getElementById("editFrame").src = "editteacher?id=" + id;

			document.getElementById("editModal").classList.add("show");
			document.getElementById("editOverlay").classList.add("show"); // ✅ correct
		}

		function closeEditModal() {
			document.getElementById("editModal").classList.remove("show");
			document.getElementById("editOverlay").classList.remove("show"); // ✅ correct
		}

		/* edit admin */

		function openAdminEditModal() {
			document.getElementById("adminEditModal").style.display = "flex";
		}

		function closeAdminEditModal() {
			document.getElementById("adminEditModal").style.display = "none";
		}
	</script>

</body>
</html>