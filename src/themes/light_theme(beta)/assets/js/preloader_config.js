//Controls the page preloader behaviour

window.addEventListener("load", function () {
    document.querySelector(".preloader").style.display = "none";
    document.body.style.overflow = "auto"; // Enable scrolling after loading
});

// Disable scrolling while preloader is active
document.body.style.overflow = "hidden";
