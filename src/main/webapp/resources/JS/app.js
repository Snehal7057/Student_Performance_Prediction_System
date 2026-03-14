/**
 * 
 */

function scrollCards(direction){

const container = document.getElementById("cardSlider");

container.scrollBy({
left: direction * 320,
behavior: "smooth"
});

}
// ================= ANNOUNCEMENT SLIDER =================

document.addEventListener("DOMContentLoaded", function () {

    const track = document.getElementById("announcementTrack");

    if (track) {
        track.innerHTML += track.innerHTML; // duplicate for infinite scroll
    }

});



// ================= HERO TYPING EFFECT =================

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




// ================= ADVANTAGE SLIDER =================

function scrollCards(direction) {

    const container = document.getElementById("cardSlider");

    if (!container) return;

    container.scrollBy({
        left: direction * 320,
        behavior: "smooth"
    });

}




// ================= SCROLL REVEAL ANIMATION =================

window.addEventListener("scroll", function () {

    const reveals = document.querySelectorAll(".reveal");

    for (let i = 0; i < reveals.length; i++) {

        const windowHeight = window.innerHeight;

        const elementTop = reveals[i].getBoundingClientRect().top;

        const revealPoint = 120;

        if (elementTop < windowHeight - revealPoint) {
            reveals[i].classList.add("active");
        }

    }

});




// ================= BACK TO TOP BUTTON =================

const topBtn = document.getElementById("topBtn");

window.onscroll = function () {

    if (!topBtn) return;

    if (document.body.scrollTop > 300 || document.documentElement.scrollTop > 300) {

        topBtn.style.display = "block";

    } else {

        topBtn.style.display = "none";

    }

};

function topFunction() {

    document.body.scrollTop = 0;

    document.documentElement.scrollTop = 0;

}




// ================= STATS COUNTER ANIMATION =================

const counters = document.querySelectorAll(".stat-card h3");

const speed = 100;

counters.forEach(counter => {

    const updateCount = () => {

        const target = counter.innerText.replace(/\D/g, "");

        const count = +counter.innerText.replace(/\D/g, "");

        const increment = target / speed;

        if (count < target) {

            counter.innerText = Math.ceil(count + increment) + "%";

            setTimeout(updateCount, 20);

        } else {

            counter.innerText = target + "%";

        }

    };

    updateCount();

});


function subscribe(){

let email=document.getElementById("subscribeEmail").value;

if(email===""){
alert("Please enter your email");
return;
}

alert("Thank you for joining SmartGrade community!");

document.getElementById("subscribeEmail").value="";

}