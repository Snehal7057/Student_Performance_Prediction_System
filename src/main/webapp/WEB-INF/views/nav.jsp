<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.modal {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.5);
	display: flex;
	justify-content: center;
	align-items: center;
}

/* Form box */
.modal-content {
	background: white;
	padding: 30px;
	border-radius: 8px;
	position: relative;
	width: 350px;
}

/* Close button */
.close-btn {
	position: absolute;
	top: 0;
	right: 15px;
	font-size: 30px;
	cursor: pointer;
}
</style>
<nav class="navbar">
	<!-- Logo -->
	<div class="logo">
		<span class="brand-icon"> <svg width="28" height="28"
				viewBox="0 0 24 24" fill="white">
        <path d="M12 3L1 9L12 15L21 10.09V17H23V9L12 3Z" />
        <path
					d="M5 12V17C5 19.21 8.13 21 12 21C15.87 21 19 19.21 19 17V12L12 17L5 12Z" />
      </svg>
		</span> Brainly<span class="edu">Edu</span>
	</div>

	<div class="menu-toggle" onclick="toggleMenu()">☰</div>

	<!-- Menu -->
	<ul class="nav-links" id="navLinks">

		<li class="mega-dropdown">Home
			<div class="mega-menu">
				<div class="mega-left">
					<h2>Welcome</h2>
					<p>Explore smart learning with BrainlyEdu platform.</p>
					<a href="#">Start Learning →</a>
				</div>
				<div class="mega-right">
					<p>Dashboard</p>
					<p>Latest Courses</p>
					<p>Top Students</p>
				</div>
			</div>
		</li>

		<li class="mega-dropdown">About
			<div class="mega-menu">
				<div class="mega-left">
					<h2>About Us</h2>
					<p>We deliver excellence and build strong student careers.</p>
					<a href="#">Discover More →</a>
				</div>
				<div class="mega-right">
					<p>Our Vision</p>
					<p>Our Mission</p>
					<p>Leadership</p>
					<p>Values</p>
				</div>
			</div>
		</li>

		<li class="mega-dropdown">Our Courses
			<div class="mega-menu">
				<div class="mega-left">
					<h2>Courses</h2>
					<p>Explore a wide range of academic and skill-based courses.</p>
					<a href="#">View Courses →</a>
				</div>
				<div class="mega-right">
					<p>10th / 12th</p>
					<p>Competitive Exams</p>
					<p>Programming</p>
					<p>Skill Development</p>
				</div>
			</div>
		</li>

		<li class="mega-dropdown">Our Experts
			<div class="mega-menu">
				<div class="mega-left">
					<h2>Experts</h2>
					<p>Learn from experienced teachers and industry mentors.</p>
					<a href="#">Meet Experts →</a>
				</div>
				<div class="mega-right">
					<p>Teachers</p>
					<p>Mentors</p>
					<p>Guest Lectures</p>
				</div>
			</div>
		</li>

		<li class="mega-dropdown">Careers
			<div class="mega-menu">
				<div class="mega-left">
					<h2>Career Guidance</h2>
					<p>Plan your future with the right career path.</p>
					<a href="#">Explore Careers →</a>
				</div>
				<div class="mega-right">
					<p>After 10th</p>
					<p>After 12th</p>
					<p>Career Paths</p>
				</div>
			</div>
		</li>

		<li class="mega-dropdown">Contact
			<div class="mega-menu">
				<div class="mega-left">
					<h2>Contact Us</h2>
					<p>Get in touch with us for support and queries.</p>
					<a href="#">Reach Us →</a>
				</div>
				<div class="mega-right">
					<p>Email Support</p>
					<p>Call Us</p>
					<p>Visit Office</p>
				</div>
			</div>
		</li>

	</ul>

	<!-- Right -->
	<div class="nav-right">
		<span class="search">🔍</span> <span class="lang">Global (En) ▾</span>


		<button onclick="openLogin()" class="signin">Sign In</button>

	</div>
</nav>

<!-- Login Modal -->
<div id="loginModal" class="modal" style="display: none;">
	<div class="modal-content">
		<span onclick="closeLogin()" style="float: right; cursor: pointer;"
			class="close-btn">&times;</span>

		<h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Login</h3>
		
		<form method="post" action="${pageContext.request.contextPath}/login">
	
			<label>Username</label></br> <input type="text" name="username"
				placeholder="username" required class="form-control mb-2" /> <label>Password</label></br>
			<input type="password" name="password" placeholder="password"
				required class="form-control mb-2" />
			<button type="submit" class="btn btn-primary w-100">Sign In</button>
		</form>
	</div>
</div>