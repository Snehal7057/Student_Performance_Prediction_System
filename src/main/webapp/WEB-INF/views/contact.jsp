<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>




<section class="contact-section">

  <!-- 🎥 VIDEO -->
  <video autoplay muted loop class="bg-video">
    <source src="${pageContext.request.contextPath}/resources/videos/contact.mp4" type="video/mp4">
  </video>

  <!-- GREY OVERLAY -->
  <div class="overlay"></div>

  <!-- CONTENT -->
  <div class="contact-container">

    <h2 class="contact-title">Contact Us</h2>
    <p class="contact-subtitle">Get in touch with our team</p>

    <div class="contact-box">

      <!-- LEFT -->
      <div class="contact-info">
        <h3>Visit Us</h3>
        <p>
         BrainlyEdu Hub<br>
123 Learning Street<br>
Aurangabad, India - 431001
        </p>

        <h3>Email</h3>
        <p>info@brainlyedu.com</p>

        <h3>Phone</h3>
        <p>+91 98765 43210</p>
      </div>

      <!-- RIGHT -->
      <div class="contact-form">
        <h3>Quick Message</h3>

        <input type="text" placeholder="Your Name">
        <input type="email" placeholder="Your Email">
        <textarea placeholder="Your Message"></textarea>

        <button>Send Message</button>
      </div>

    </div>

  </div>

</section>
