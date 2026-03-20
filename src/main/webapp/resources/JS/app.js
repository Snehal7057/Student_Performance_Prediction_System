

// ================= SCROLL CARDS =================
function scrollCards(direction) {
    const container = document.getElementById("cardSlider");
    if (!container) return;

    container.scrollBy({
        left: direction * 320,
        behavior: "smooth"
    });
}


// ================= ANNOUNCEMENT SLIDER =================
document.addEventListener("DOMContentLoaded", function () {

    const track = document.getElementById("announcementTrack");
    if (track) {
        track.innerHTML += track.innerHTML;
    }

    // ================= HERO TYPING =================
    const text = "AI-Powered Learning for Future Achievers";
    let index = 0;

    function typingEffect() {
        const element = document.getElementById("typing-text");
        if (!element) return;

        if (index < text.length) {
            element.innerHTML += text.charAt(index);
            index++;
            setTimeout(typingEffect, 60);
        }
    }
    typingEffect();


    // ================= STATS COUNTER =================
    const counters = document.querySelectorAll(".stat-card h3");

    counters.forEach(counter => {
        const target = +counter.innerText.replace(/\D/g, "");

        let count = 0;

        const updateCount = () => {
            const increment = target / 100;

            if (count < target) {
                count += increment;
                counter.innerText = Math.ceil(count) + "%";
                setTimeout(updateCount, 20);
            } else {
                counter.innerText = target + "%";
            }
        };

        updateCount();
    });

});


// ================= SCROLL REVEAL =================
window.addEventListener("scroll", function () {

    const reveals = document.querySelectorAll(".reveal");

    reveals.forEach(el => {
        const windowHeight = window.innerHeight;
        const elementTop = el.getBoundingClientRect().top;

        if (elementTop < windowHeight - 120) {
            el.classList.add("active");
        }
    });

});


// ================= BACK TO TOP =================
const topBtn = document.getElementById("topBtn");

window.onscroll = function () {

    if (!topBtn) return;

    if (document.documentElement.scrollTop > 300) {
        topBtn.style.display = "block";
    } else {
        topBtn.style.display = "none";
    }
};

function topFunction() {
    document.documentElement.scrollTop = 0;
}


// ================= SUBSCRIBE =================
function subscribe() {

    let email = document.getElementById("subscribeEmail").value;

    if (email === "") {
        alert("Please enter your email");
        return;
    }

    alert("Thank you for joining SmartGrade community!");
    document.getElementById("subscribeEmail").value = "";
}
// =========nav============
function toggleMenu() {
  document.getElementById("navLinks").classList.toggle("active");
}

// ================= ABOUT SECTION =================
function showContent(type){

  const imgBox = document.getElementById("image-box");
  const contentBox = document.getElementById("content-box");
  const title = document.getElementById("content-title");
  const text = document.getElementById("content-text");

  if (!imgBox || !contentBox) return;

  imgBox.style.display = "none";
  contentBox.style.display = "block";

  if(type === "vision"){
    title.innerText = "Our Vision";
    text.innerText = "To guide students after 10th and 12th towards the right career path using AI.";
  }

  else if(type === "mission"){
    title.innerText = "Our Mission";
    text.innerText = "Provide personalized career guidance based on student skills.";
  }

  else if(type === "leadership"){
    title.innerText = "Leadership";
    text.innerText = "Our team consists of educators and industry experts.";
  }

  else if(type === "values"){
    title.innerText = "Values";
    text.innerText = "We believe in innovation, honesty and student-first approach.";
  }

}