<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Career Options Portal</title>

<style>
body {
  font-family: "Segoe UI";
  margin: 0;
  background: #f4f6f8;
}

/* HEADER */
.header {
  background: white;
  padding: 20px;
  text-align: center;
}

/* FILTER */
.filter-box {
  background: white;
  margin: 30px auto;
  padding: 20px;
  border-radius: 10px;
  display: flex;
  gap: 15px;
  justify-content: center;
  flex-wrap: wrap;
  max-width: 1100px;
}

select {
  padding: 10px;
  border-radius: 6px;
  min-width: 180px;
}

/* BUTTONS */
.btn-group {
  display: flex;
  gap: 8px;
}

.apply-btn {
  background: #1c1f26;
  color: white;
  padding: 10px 18px;
  border: none;
  cursor: pointer;
}

.clear-x-btn {
  background: transparent;
  border: none;
  font-size: 18px;
  cursor: pointer;
}

/* GRID */
.container {
  padding: 20px 40px;
}

.grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
  gap: 20px;
}

/* CARD */
.card {
  background: white;
  border-radius: 10px;
  overflow: hidden;
  transition: 0.3s;

  display: flex;
  flex-direction: column;
  height: 100%;
}

.card:hover {
  transform: translateY(-5px);
  box-shadow: 0 6px 18px rgba(0,0,0,0.15);
}

.card-img {
  width: 100%;
  height: 140px;
  object-fit: cover;
}

.card-body {
  padding: 15px;

  display: flex;
  flex-direction: column;
  flex-grow: 1;
}

/* TAG */
.tag {
  font-size: 12px;
  color: #666;
}

/* EXTRA INFO */
.extra {
  display: none;
  margin-top: 10px;
  font-size: 13px;
  color: #444;
}

/* READ BUTTON */
.read-btn {
  margin-top: auto; /* 🔥 pushes button to bottom */
  padding: 6px 12px;
  background: #1c1f26;
  color: white;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

/* VIEW BUTTON */
.view-btn {
  text-align: center;
  margin: 20px;
}

.view-btn button {
  padding: 10px 20px;
  background: #1c1f26;
  color: white;
  border: none;
  cursor: pointer;
  border-radius: 5px;
  transition: 0.3s;
}

.view-btn button:hover {
  background: black;
  transform: scale(1.05);
}






/* SECTION */
.main-section {
  max-width: 1200px;
  margin: auto;
  padding: 50px 20px;
}

/* TITLE */
.section-title {
  color: black;
  font-size: 32px;
  margin-bottom: 30px;
  text-align: center;
}

/* COURSES GRID */
.courses-container {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: 20px;
}

/* COURSE CARD */
.course-card {
  background: #111;
  border-radius: 12px;
  overflow: hidden;
  transition: 0.4s;
}

.course-card img {
  width: 100%;
  height: 180px;
  object-fit: cover;
  transition: 0.5s;
}

/* ZOOM */
.course-card:hover img {
  transform: scale(1.08);
}

.course-content {
  padding: 15px;
  color: white;
}

.course-content h3 {
  margin: 0 0 8px;
  font-size: 18px;
}

.course-content p {
  font-size: 14px;
  color: #aaa;
}

/* FEATURES */
.features-section {
  display: flex;
  align-items: center;
  gap: 40px;
  margin: 80px 0;
}

.feature-img img {
  width: 350px;
  border-radius: 12px;
}

.feature-text {
    color: black;
}

.feature-text ul {
  list-style: none;
  padding: 0;
}

.feature-text li {
  margin: 10px 0;
}

/* MENTORS */
.mentors-container {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: 20px;
}

.mentor-card {
  text-align: center;
  color: black;
}

.mentor-card img {
  width: 100%;
  height: 220px;
  object-fit: cover;
  border-radius: 12px;

  filter: grayscale(100%);
  transition: 0.5s;
}

.mentor-card:hover img {
  filter: grayscale(0%);
  transform: scale(1.05);
}

/* RESPONSIVE */
@media (max-width: 900px) {
  .courses-container,
  .mentors-container {
    grid-template-columns: repeat(2, 1fr);
  }

  .features-section {
    flex-direction: column;
    text-align: center;
  }
}




.testimonial-section {
  padding: 60px 20px;
  text-align: center;
}

.testimonial-section h2 {
  font-size: 32px;
  margin-bottom: 40px;
  color: #0b1c39;
}

/* GRID */
.testimonial-container {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 25px;
  max-width: 1200px;
  margin: auto;
}

/* CARD */
.card {
  background: #fff;
  padding: 20px;
  border-radius: 12px;
  text-align: left;
  box-shadow: 0 5px 15px rgba(0,0,0,0.08);
  transition: 0.3s;
}

.card:hover {
  transform: translateY(-8px);
  box-shadow: 0 10px 25px rgba(0,0,0,0.15);
}

/* TOP */
.top {
  display: flex;
  align-items: center;
  gap: 15px;
}

.top img {
  width: 50px;
  height: 50px;
  border-radius: 50%;
}

.top h3 {
  margin: 0;
  font-size: 16px;
}

.top p {
  margin: 0;
  font-size: 13px;
  color: gray;
}

/* STARS */
.stars {
  margin-left: auto;
  color: #f5a623;
  font-size: 14px;
}

/* DESCRIPTION */
.desc {
  margin-top: 15px;
  font-size: 14px;
  color: #555;
  line-height: 1.6;
}

/* RESPONSIVE */
@media (max-width: 992px) {
  .testimonial-container {
    grid-template-columns: repeat(2, 1fr);
  }
}

@media (max-width: 600px) {
  .testimonial-container {
    grid-template-columns: 1fr;
  }
}

</style>
</head>

<body>
<section class="main-section">

  <!-- TITLE -->
  <h2 class="section-title">Courses for 10th Students</h2>

  <!-- COURSES -->
  <div class="courses-container">

    <div class="course-card">
      <img src="https://images.unsplash.com/photo-1588072432836-e10032774350">
      <div class="course-content">
        <h3>Science Foundation</h3>
        <p>Strong base in Physics, Chemistry & Biology.</p>
      </div>
    </div>

    <div class="course-card">
      <img src="https://images.unsplash.com/photo-1606326608606-aa0b62935f2b">
      <div class="course-content">
        <h3>Mathematics Mastery</h3>
        <p>Improve problem solving & board exam preparation.</p>
      </div>
    </div>

    <div class="course-card">
      <img src="https://images.unsplash.com/photo-1522202176988-66273c2fd55f">
      <div class="course-content">
        <h3>Career Guidance</h3>
        <p>Choose best stream after 10th with expert advice.</p>
      </div>
    </div>

    <div class="course-card">
      <img src="https://images.unsplash.com/photo-1498050108023-c5249f4df085">
      <div class="course-content">
        <h3>Basic Coding</h3>
        <p>Start programming with easy concepts & projects.</p>
      </div>
    </div>

  </div>

  <!-- FEATURES -->
  <div class="features-section">

    <div class="feature-img">
      <img src="https://images.unsplash.com/photo-1509062522246-3755977927d7">
    </div>

    <div class="feature-text">
      <h2>Why Choose Us?</h2>

      <ul>
        <li>✔ Daily practice worksheets</li>
        <li>✔ Doubt solving sessions</li>
        <li>✔ Live interactive classes</li>
        <li>✔ Career guidance after 10th</li>
      </ul>
    </div>

  </div>

  <!-- MENTORS -->
  <h2 class="section-title">Our Expert Teachers</h2>

  <div class="mentors-container">

    <div class="mentor-card">
      <img src="https://images.unsplash.com/photo-1607746882042-944635dfe10e">
      <h3>Mrs. Kavita Patil</h3>
      <p>Science Teacher (10+ yrs)</p>
    </div>

    <div class="mentor-card">
      <img src="https://images.unsplash.com/photo-1595152772835-219674b2a8a6">
      <h3>Mr. Rahul Sharma</h3>
      <p>Math Expert</p>
    </div>

    <div class="mentor-card">
      <img src="https://images.unsplash.com/photo-1580894908361-967195033215">
      <h3>Ms. Sneha Joshi</h3>
      <p>Career Counselor</p>
    </div>

    <div class="mentor-card">
      <img src="https://images.unsplash.com/photo-1527980965255-d3b416303d12">
      <h3>Mr. Amit Verma</h3>
      <p>Coding Mentor</p>
    </div>

  </div>

</section>




<div class="header">
<h1>Explore Career Options </h1>
</div>

<div class="filter-box">

<select id="stream">
<option value="">Stream</option>
<option value="science">Science</option>
<option value="commerce">Commerce</option>
<option value="arts">Arts</option>
<option value="technical">Technical</option>
</select>

<select id="interest">
<option value="">Interest</option>
<option value="coding">Coding</option>
<option value="medical">Medical</option>
<option value="business">Business</option>
<option value="creative">Creative</option>
<option value="practical">Practical</option>
<option value="social">Social</option>
<option value="defense">Defense</option>
<option value="research">Research</option>
</select>

<select id="type">
<option value="">Career Type</option>
<option value="job">Job</option>
<option value="business">Business</option>
<option value="govt">Government</option>
</select>

<div class="btn-group">
<button class="apply-btn" onclick="filterCareers()">Apply</button>
<button class="clear-x-btn" onclick="clearFilters()">Clear ✖</button>
</div>

</div>

<div class="container">
<div id="careerGrid" class="grid"></div>
</div>

<div class="view-btn">
<button onclick="toggleView()" id="viewBtn">View More</button>
</div>



<section class="testimonial-section">
  <h2>What says our student</h2>

  <div class="testimonial-container">

    <!-- CARD 1 -->
    <div class="card">
      <div class="top">
        <img src="https://randomuser.me/api/portraits/women/44.jpg">
        <div>
          <h3>Markus Alina</h3>
          <p>Content Creator</p>
        </div>
        <div class="stars">★★★★★</div>
      </div>
      <p class="desc">
        I'm the student in this platforms of some courses enroll and they are excellent complete workshop.
      </p>
    </div>

    <!-- CARD 2 -->
    <div class="card">
      <div class="top">
        <img src="https://randomuser.me/api/portraits/men/32.jpg">
        <div>
          <h3>Rahul Sharma</h3>
          <p>Web Developer</p>
        </div>
        <div class="stars">★★★★★</div>
      </div>
      <p class="desc">
        Best platform for 10th students. Courses are easy and very helpful for future.
      </p>
    </div>

    <!-- CARD 3 -->
    <div class="card">
      <div class="top">
        <img src="https://randomuser.me/api/portraits/women/65.jpg">
        <div>
          <h3>Priya Patil</h3>
          <p>Student</p>
        </div>
        <div class="stars">★★★★★</div>
      </div>
      <p class="desc">
        I improved my coding and confidence. Teachers are very supportive.
      </p>
    </div>

    <!-- CARD 4 -->
    <div class="card">
      <div class="top">
        <img src="https://randomuser.me/api/portraits/men/75.jpg">
        <div>
          <h3>Amit Joshi</h3>
          <p>Designer</p>
        </div>
        <div class="stars">★★★★★</div>
      </div>
      <p class="desc">
        Very clean UI and amazing learning experience. Highly recommended!
      </p>
    </div>

    <!-- CARD 5 -->
    <div class="card">
      <div class="top">
        <img src="https://randomuser.me/api/portraits/women/22.jpg">
        <div>
          <h3>Sneha Kulkarni</h3>
          <p>Student</p>
        </div>
        <div class="stars">★★★★★</div>
      </div>
      <p class="desc">
        Perfect for beginners. Concepts explained very clearly.
      </p>
    </div>

    <!-- CARD 6 -->
    <div class="card">
      <div class="top">
        <img src="https://randomuser.me/api/portraits/men/18.jpg">
        <div>
          <h3>Rohit Deshmukh</h3>
          <p>Student</p>
        </div>
        <div class="stars">★★★★★</div>
      </div>
      <p class="desc">
        Helped me prepare for exams and future IT career.
      </p>
    </div>

  </div>
</section>

<script>

var careers = [
{name:"Engineering",stream:"science",interest:"coding",type:"job",img:"https://images.unsplash.com/photo-1581092335397-9583eb92d232",desc:"Engineering involves designing and building systems.",salary:"₹4-10 LPA",skills:"Math, Coding"},
{name:"Doctor",stream:"science",interest:"medical",type:"job",img:"https://images.unsplash.com/photo-1582750433449-648ed127bb54",desc:"Doctors treat patients and save lives.",salary:"₹6-15 LPA",skills:"Biology"},
{name:"Pharmacy",stream:"science",interest:"medical",type:"job",img:"https://images.unsplash.com/photo-1587854692152-cbe660dbde88",desc:"Pharmacy deals with medicines.",salary:"₹3-8 LPA",skills:"Chemistry"},
{name:"Biotechnology",stream:"science",interest:"medical",type:"job",img:"https://images.unsplash.com/photo-1532187863486-abf9dbad1b69",desc:"Biotech research field.",salary:"₹4-9 LPA",skills:"Biology"},
{name:"Data Scientist",stream:"science",interest:"coding",type:"job",img:"https://images.unsplash.com/photo-1551288049-bebda4e38f71",desc:"Analyze data and AI models.",salary:"₹8-20 LPA",skills:"Python"},
{name:"AI Engineer",stream:"science",interest:"coding",type:"job",img:"https://images.unsplash.com/photo-1677442136019-21780ecad995",desc:"Build AI systems.",salary:"₹10-25 LPA",skills:"AI"},
{name:"Research Scientist",stream:"science",interest:"research",type:"job",img:"https://images.unsplash.com/photo-1582719478250-c89cae4dc85b",desc:"Scientific research.",salary:"₹6-12 LPA",skills:"Research"},

{name:"CA",stream:"commerce",interest:"business",type:"job",img:"https://images.unsplash.com/photo-1554224155-6726b3ff858f",desc:"Finance expert.",salary:"₹7-15 LPA",skills:"Accounts"},
{name:"Company Secretary",stream:"commerce",interest:"business",type:"job",img:"https://images.unsplash.com/photo-1454165804606-c3d57bc86b40",desc:"Corporate law expert.",salary:"₹6-12 LPA",skills:"Law"},
{name:"Banking Officer",stream:"commerce",interest:"business",type:"job",img:"https://images.unsplash.com/photo-1567427017947-545c5f8d16ad",desc:"Bank job.",salary:"₹5-10 LPA",skills:"Finance"},
{name:"Entrepreneur",stream:"commerce",interest:"business",type:"business",img:"https://images.unsplash.com/photo-1556740738-b6a63e27c4df",desc:"Start your own business.",salary:"Variable",skills:"Leadership"},

{name:"UPSC",stream:"arts",interest:"social",type:"govt",img:"https://images.unsplash.com/photo-1589829545856-d10d557cf95f",desc:"Civil services.",salary:"₹10 LPA",skills:"GK"},
{name:"Law",stream:"arts",interest:"social",type:"job",img:"https://images.unsplash.com/photo-1589829545856-d10d557cf95f",desc:"Legal field.",salary:"₹5-12 LPA",skills:"Law"},
{name:"Journalist",stream:"arts",interest:"creative",type:"job",img:"https://images.unsplash.com/photo-1495020689067-958852a7765e",desc:"Media field.",salary:"₹3-8 LPA",skills:"Communication"},
{name:"Psychologist",stream:"arts",interest:"social",type:"job",img:"https://images.unsplash.com/photo-1559757175-0eb30cd8c063",desc:"Mental health expert.",salary:"₹4-9 LPA",skills:"Counseling"},

{name:"Diploma Mechanical",stream:"technical",interest:"practical",type:"job",img:"https://images.unsplash.com/photo-1581092335397-9583eb92d232",desc:"Mechanical field.",salary:"₹3-7 LPA",skills:"Machines"},
{name:"ITI Electrician",stream:"technical",interest:"practical",type:"job",img:"https://images.unsplash.com/photo-1581091012184-5c3c6c1b77c4",desc:"Electrical work.",salary:"₹2-6 LPA",skills:"Electrical"},

{name:"Web Developer",stream:"science",interest:"coding",type:"job",img:"https://images.unsplash.com/photo-1498050108023-c5249f4df085",desc:"Build websites.",salary:"₹5-12 LPA",skills:"HTML"},
{name:"UI Designer",stream:"arts",interest:"creative",type:"job",img:"https://images.unsplash.com/photo-1559027615-cd4628902d4a",desc:"Design interfaces.",salary:"₹4-10 LPA",skills:"Design"},

{name:"YouTuber",stream:"arts",interest:"creative",type:"business",img:"https://images.unsplash.com/photo-1526170375885-4d8ecf77b99f",desc:"Content creation.",salary:"Variable",skills:"Creativity"},
{name:"Graphic Designer",stream:"arts",interest:"creative",type:"job",img:"https://images.unsplash.com/photo-1529336953121-ad6c6ab5d9a7",desc:"Design graphics.",salary:"₹3-8 LPA",skills:"Photoshop"},

{name:"Indian Army",stream:"science",interest:"defense",type:"govt",img:"https://images.unsplash.com/photo-1605902711622-cfb43c44367e",desc:"Serve the nation.",salary:"₹6-12 LPA",skills:"Fitness"},
{name:"Police Officer",stream:"arts",interest:"defense",type:"govt",img:"https://images.unsplash.com/photo-1593113598332-cd288d649433",desc:"Law enforcement.",salary:"₹4-10 LPA",skills:"Discipline"}
];

var showAll=false;
var currentList=careers;

function displayCareers(list){
currentList=list;
var grid=document.getElementById("careerGrid");
var btn=document.getElementById("viewBtn");
grid.innerHTML="";

var data=showAll?list:list.slice(0,8);

for(var i=0;i<data.length;i++){
grid.innerHTML+=
"<div class='card'>"+
"<img src='"+data[i].img+"' class='card-img'>"+
"<div class='card-body'>"+
"<h3>"+data[i].name+"</h3>"+
"<p class='tag'>"+data[i].stream+" | "+data[i].interest+"</p>"+

"<div class='extra' id='extra"+i+"'>"+
"<p>"+data[i].desc+"</p>"+
"<p><b>Salary:</b> "+data[i].salary+"</p>"+
"<p><b>Skills:</b> "+data[i].skills+"</p>"+
"</div>"+

"<button class='read-btn' onclick='toggleDetails("+i+", this)'>Read More</button>"+
"</div></div>";
}

btn.innerText=showAll?"View Less":"View More";
}

function toggleDetails(i,btn){
var section=document.getElementById("extra"+i);

if(section.style.display==="block"){
section.style.display="none";
btn.innerText="Read More";
}else{
section.style.display="block";
btn.innerText="Show Less";
}
}

function toggleView(){
showAll=!showAll;
displayCareers(currentList);
}

function filterCareers(){
showAll=false;
var stream=document.getElementById("stream").value;
var interest=document.getElementById("interest").value;
var type=document.getElementById("type").value;

var filtered=[];
for(var i=0;i<careers.length;i++){
var c=careers[i];
if((!stream||c.stream===stream)&&(!interest||c.interest===interest)&&(!type||c.type===type)){
filtered.push(c);
}
}
displayCareers(filtered);
}

function clearFilters(){
document.getElementById("stream").value="";
document.getElementById("interest").value="";
document.getElementById("type").value="";
showAll=false;
displayCareers(careers);
}

displayCareers(careers);



const cards = document.querySelectorAll(".expert-card");

cards.forEach(card => {
  card.addEventListener("mousemove", (e) => {
    const inner = card.querySelector(".card-inner");

    const rect = card.getBoundingClientRect();
    const x = e.clientX - rect.left;
    const y = e.clientY - rect.top;

    const rotateX = (y / rect.height - 0.5) * 10;
    const rotateY = (x / rect.width - 0.5) * -10;

    inner.style.transform = `rotateX(${rotateX}deg) rotateY(${rotateY}deg)`;
  });

  card.addEventListener("mouseleave", () => {
    const inner = card.querySelector(".card-inner");
    inner.style.transform = "rotateX(0deg) rotateY(0deg)";
  });
});



const elements = document.querySelectorAll(".course-card, .mentor-card");

window.addEventListener("scroll", () => {
  elements.forEach(el => {
    const top = el.getBoundingClientRect().top;
    if(top < window.innerHeight - 100){
      el.style.opacity = "1";
      el.style.transform = "translateY(0)";
    }
  });
});
</script>

</body>
</html>