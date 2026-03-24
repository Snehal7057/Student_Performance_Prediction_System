<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<style>
.contact-section {
	position: relative;
	height: 100vh;
	font-family: 'Poppins', sans-serif;
	overflow: hidden;
}

.bg-video {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	object-fit: cover;
	z-index: -2;
}

.overlay {
	position: absolute;
	width: 100%;
	height: 100%;
	background: rgba(28, 31, 38, 0.9); /* grey transparent */
	z-index: -1;
}

/* CONTENT */
.contact-container {
	position: relative;
	padding: 80px 20px;
	color: white;
	text-align: center;
}

/* TITLE */
.contact-title {
	font-size: 40px;
	animation: fadeDown 1s ease;
}

.contact-subtitle {
	color: #ccc;
	margin-bottom: 40px;
	animation: fadeUp 1.2s ease;
}

/* BOX */
.contact-box {
	display: flex;
	justify-content: center;
	gap: 40px;
	flex-wrap: wrap;
}

/* CARDS */
.contact-info, .contact-form {
	width: 400px;
	padding: 30px;
	border-radius: 10px;
	background: rgba(42, 47, 58, 0.85);
	border: 1px solid #3a3f4a;
	backdrop-filter: blur(5px);
	transition: transform 0.4s ease;
}

.contact-info:hover, .contact-form:hover {
	transform: translateY(-8px);
}

.contact-info h3, .contact-form h3 {
	margin-bottom: 10px;
}

.contact-info p {
	color: #ccc;
	margin-bottom: 15px;
}

.contact-form input, .contact-form textarea {
	width: 100%;
	margin: 10px 0;
	padding: 12px;
	border-radius: 6px;
	border: 1px solid #444;
	background: rgba(28, 31, 38, 0.8);
	color: white;
	outline: none;
}

.contact-form input:focus, .contact-form textarea:focus {
	border: 1px solid #00c6ff;
}

.contact-form button {
	width: 100%;
	padding: 12px;
	margin-top: 10px;
	border: none;
	border-radius: 6px;
	background: #00c6ff;
	color: black;
	cursor: pointer;
	transition: 0.3s;
}

.contact-form button:hover {
	background: #009edc;
	transform: scale(1.03);
}

@
keyframes fadeDown {from { opacity:0;
	transform: translateY(-30px);
}

to {
	opacity: 1;
	transform: translateY(0);
}

}
@
keyframes fadeUp {from { opacity:0;
	transform: translateY(30px);
}

to {
	opacity: 1;
	transform: translateY(0);
}
}
</style>

<section class="contact-section">

	<video autoplay muted loop class="bg-video">
		<source
			src="${pageContext.request.contextPath}/resources/videos/contact.mp4"
			type="video/mp4">
	</video>

	<div class="overlay"></div>

	<div class="contact-container">

		<h2 class="contact-title">Contact Us</h2>
		<p class="contact-subtitle">Get in touch with our team</p>

		<div class="contact-box">

			<!-- LEFT -->
			<div class="contact-info">
				<h3>Visit Us</h3>
				<p>
					BrainlyEdu Hub<br> 123 Learning Street<br> Aurangabad,
					India - 431001
				</p>

				<h3>Email</h3>
				<p>info@brainlyedu.com</p>

				<h3>Phone</h3>
				<p>+91 98765 43210</p>
			</div>

			<!-- RIGHT -->
			<div class="contact-form">
				<h3>Quick Message</h3>

				<input type="text" placeholder="Your Name"> <input
					type="email" placeholder="Your Email">
				<textarea placeholder="Your Message"></textarea>

				<button>Send Message</button>
			</div>

		</div>

	</div>

</section>
