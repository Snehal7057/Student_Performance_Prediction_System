<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Navbar Example</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">
<link rel="stylesheet" 
href="${pageContext.request.contextPath}/resources/CSS/style.css">

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
</head>
<body>

<div class="container-fluid p-0">
<!-- Navbar -->
<div class="container-fluid navbar-custom">

<div class="row align-items-center">

<!-- Logo -->
<div class="logo col-lg-3 col-md-4 col-sm-12 text-lg-start text-center">
<i class="bi bi-mortarboard-fill"></i> Smart<span id="lo">Grade</span>
</div>

<!-- Menu -->
<div class="col-lg-9 col-md-8 col-sm-12">
<ul class="center-menu">
<li><a href="#">Home</a></li>
<li><a href="#">About</a></li>
<li><a href="#">Our Courses</a></li>
<li><a href="#">Our Experts</a></li>
<li><a href="#">Careers After 10th</a></li>
<li><a href="#">Contact</a></li>
<li><a href="login" class="signin-btn">Sign In</a></li>
</ul>
</div>

</div>
</div>

<!-- announcement -->
<section class="announcement-bar">

<div class="announcement-track" id="announcementTrack">

<div class="announcement">
🚀 Admissions Open 2025–2026 | Limited Seats Available
</div>

<div class="announcement">
🎓 Join SmartGrade AI Learning Platform
</div>

<div class="announcement">
📚 New Courses Available for Class 10 Students
</div>

<div class="announcement">
🏆 98% Student Success Rate | Expert Mentors
</div>

</div>

</section>
<section class="hero">

<div class="hero-container">

<!-- LEFT SIDE -->
<div class="hero-left">

<h1><span id="typing-text"></span></h1>

<p>
SmartGrade helps students improve academic performance using intelligent analytics,
expert guidance, and personalized study resources.
</p>

<div class="course-buttons">
<button class="btn-course blue"> Science </button>
<button class="btn-course purple">Maths Formulae</button>
<button class="btn-course green">Social Studies</button>
<button class="btn-course orange">English Literature</button>
</div>

<div class="stats">

<div class="stat-card">
<h3>95%</h3>
<p>Performance</p>
</div>

<div class="stat-card">
<h3>24/7</h3>
<p>AI Insights</p>
</div>

<div class="stat-card">
<h3>98%</h3>
<p>Success Rate</p>
</div>

</div>

</div>

<!-- RIGHT FORM -->
<div class="hero-form">

<h2>Admissions Open for 2025–2026</h2>
<p class="sub">Register now to secure your seat</p>

<form action="addStudent" method="post">

<input type="text" name="name" placeholder="Enter full name">
<input type="email" name="email" placeholder="Enter email address">
<input type="text" name="contact" placeholder="Enter mobile number">
<input type="text" name="location" placeholder="Enter city">

<button class="apply-btn">Apply Now</button>

<p class="signin">Already have an account? 
<a href="login">Sign in</a></p>

</form>

</div>

</div>

</section>

<!--  hero -->
<section class="herooo">
    <div class="hero-contain">

        <!-- Left Content -->
        <div class="hero-text">
            <h1>
                The Best Way to Learn <br/>
                 Courses
            </h1>

            <p>
                Engage, challenge, and support students with modern learning
                experiences that inspire creativity and growth.
            </p>

            <button class="hero-btn">Get Started</button>
        </div>

        <!-- Right Image -->
        <div class="hero-image">

            <img src="resources/images/teacher.png" alt="Teacherss"/>

            <div class="hero-card card1">
                <h3>100%</h3>
                <p>Certified & Skillful Teacher</p>
            </div>

            <div class="hero-card card2">
                <h3>25,000+</h3>
                <p>Students Join Everyday</p>
            </div>

        </div>

    </div>
</section>

<!--  course-->
<section class="courses-section">

<h2 class="section-title">Our Courses</h2>

<div class="course-container">

<div class="course-card">
<div class="course-icon">📘</div>
<h3>CBSE Class 10 Science</h3>
<p>Complete preparation for Physics, Chemistry and Biology.</p>
<button>Explore</button>
</div>

<div class="course-card">
<div class="course-icon">📐</div>
<h3>Mathematics Mastery</h3>
<p>Learn algebra, trigonometry and geometry with expert guidance.</p>
<button>Explore</button>
</div>

<div class="course-card">
<div class="course-icon">🧪</div>
<h3>Social Science</h3>
<p>Understand history, geography and civics easily.</p>
<button>Explore</button>
</div>

<div class="course-card">
<div class="course-icon">📖</div>
<h3>English Preparation</h3>
<p>Improve grammar, writing and literature skills.</p>
<button>Explore</button>
</div>

</div>

</section>



<section class="facilities-section">
      <div class="container facility-wrapper">
        <div class="facility-image">
          <img src="resources/images/classroom.png" alt="Classroom" />
        </div>

        <div class="facility-content">
          <span class="tag">Facilities</span>

          <h2>World-Class Facilities for Optimal Learning</h2>

          <p class="facility-desc">
            Our modern school supports every aspect of your child's learning
            journey with facilities that inspire creativity and growth.
          </p>

          <div class="facility-features">
            <div class="feature">
              <i class="bi bi-display"></i>
              <div>
                <h5>Interactive Classrooms</h5>
                <p>
                  Smart boards, comfortable seating, and bright spaces designed
                  for engaging collaborative learning.
                </p>
              </div>
            </div>

            <div class="feature">
              <i class="bi bi-flask"></i>
              <div>
                <h5>Creative Labs</h5>
                <p>
                  Dedicated spaces for art, science experiments, and hands-on
                  projects that spark imagination.
                </p>
              </div>
            </div>
          </div>

          <a href="#" class="btn view-btn">View Programme</a>
        </div>
      </div>
    </section>
    <section class="program-section">
      <div class="container">
        <h2 class="section-title">Our Academic Programs</h2>

        <p class="section-subtitle">
          Comprehensive learning programs designed to nurture each child's
          unique potential and prepare them for future success
        </p>

        <div class="program-card">
          <div class="program-text">
            <span class="program-tag">Programme 01</span>

            <h3>Early Years Foundation</h3>

            <p>
              Building fundamental skills in literacy, numeracy, and social
              development through play-based learning and hands-on activities
              that spark curiosity and enthusiasm for school.
            </p>
          </div>

          <div class="program-image">
            <img src="resources/images/program1.png" />
          </div>
        </div>
      </div>
    </section>
    
    
    <!-- Advanteges -->

<section class="smartgrade-advantage">

<h2>Why Choose <span>SmartGrade?</span></h2>

<div class="adv-section">

<button class="arrow left" onclick="scrollCards(-1)">❮</button>

<div class="advantage-container" id="cardSlider">

<div class="adv-card">
<img src="resources/images/visual-learning.png">
<h3>Conceptual Clarity</h3>
<p>Understand difficult concepts with visual explanations and smart learning techniques.</p>
</div>

<div class="adv-card">
<img src="resources/images/personal-learning.png">
<h3>Personalised Learning</h3>
<p>Customized learning programs designed for every student’s strengths and weaknesses.</p>
</div>

<div class="adv-card">
<img src="resources/images/expert-guidance.png">
<h3>Expert Guidance</h3>
<p>Get one-to-one mentorship and support from experienced teachers and subject experts.</p>
</div>

<div class="adv-card">
<img src="resources/images/sport.png">
<h3>Sports & Physical Activities</h3>
<p>At SmartGrade, we believe that physical fitness is just as important as academic success.</p>
</div>

<div class="adv-card">
<img src="resources/images/lib.png">
<h3>Library Learning Sessions</h3>
<p>Our library sessions encourage students to develop a love for reading and independent learning. </p>
</div>

</div>

<button class="arrow right" onclick="scrollCards(1)">❯</button>

</div>

</section>



    
    
    <section class="contact-section">
      <div class="container">
        <h2 class="contact-title">Contact Us</h2>
        <p class="contact-subtitle">Get in touch with our team</p>

        <div class="contact-box">
          <!-- Left Info -->
          <div class="contact-info">
            <h3>Visit Us</h3>
            <p>
              SmartGrade Education Hub <br />
              123 Learning Street <br />
              New Delhi, India - 110001
            </p>

            <h3>Email</h3>
            <p>info@smartgrade.edu</p>

            <h3>Phone</h3>
            <p>+91 98765 43210</p>
          </div>

          <!-- Contact Form -->

          <div class="contact-form">
            <h3>Quick Message</h3>

            <form>
              <input type="text" placeholder="Your Name" />

              <input type="email" placeholder="Your Email" />

              <textarea placeholder="Your Message"></textarea>

              <button type="submit" class="send-btn">Send Message</button>
            </form>
          </div>
        </div>
      </div>
    </section>
    
    
    



<!-- Footer -->
<!-- ================= FOOTER ================= -->

<footer class="footer">

<div class="container-fluid">

<div class="row footer-container">

<!-- ABOUT -->

<div class="col-lg-4 col-md-12 col-sm-12 footer-about">

<h3 class="footer-logo">
<i class="bi bi-mortarboard-fill"></i> Smart<span>Grade</span>
</h3>

<p>
SmartGrade is an AI-powered learning platform helping students improve
academic performance with smart analytics, personalized learning,
and expert mentorship.
</p>

</div>



<!-- LEGAL -->

<div class="col-lg-2 col-md-4 col-sm-6 footer-links">

<h4>Legal</h4>

<a href="#">Home Page</a>
<a href="#">Privacy Policy</a>
<a href="#">Terms of Services</a>
<a href="#">Career</a>
<a href="#">Portal</a>

</div>



<!-- SOCIAL -->

<div class="col-lg-2 col-md-4 col-sm-6 footer-links">

<h4>Social</h4>

<a href="#"><i class="bi bi-facebook"></i> Facebook</a>
<a href="#"><i class="bi bi-instagram"></i> Instagram</a>
<a href="#"><i class="bi bi-twitter"></i> Twitter</a>
<a href="#"><i class="bi bi-google"></i> Google</a>
<a href="#"><i class="bi bi-skype"></i> Skype</a>

</div>



<!-- JOIN COMMUNITY -->

<div class="col-lg-4 col-md-12 col-sm-12 footer-community">

<h4>Join Our Community</h4>

<p class="community-text">
Stay updated with new courses, learning tips, and SmartGrade updates.
</p>

<div class="newsletter">

<input type="email" id="subscribeEmail" placeholder="Enter your email">

<button onclick="subscribe()">Subscribe</button>

</div>




</div>

</div>

<hr>

<div class="footer-bottom">

<p>© 2025 SmartGrade. All Rights Reserved.</p>

</div>

</div>

</footer>

</div>

<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
<script src="${pageContext.request.contextPath}/resources/JS/app.js"></script>
</body>
</html>
