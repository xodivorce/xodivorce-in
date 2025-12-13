//Cursor Hover Animination
const animate_card_mouseover_effect = e => {
  const { currentTarget: target } = e;
  const rect = target.getBoundingClientRect();
  const x = e.clientX - rect.left;
  const y = e.clientY - rect.top;

  target.style.setProperty("--mouse-x", `${x}px`);
  target.style.setProperty("--mouse-y", `${y}px`);
};

document.addEventListener("DOMContentLoaded", () => {
  const cards = Array.from(document.querySelectorAll(".hoverAnimatedContainer"));
  if (!cards.length) return;

  for (const card of cards) {
    const rect = card.getBoundingClientRect();
    card.style.setProperty("--mouse-x", `${rect.width / 2}px`);
    card.style.setProperty("--mouse-y", `${rect.height / 2}px`);
  }

  let activeCard = null;

  document.addEventListener("pointermove", (e) => {
    const el = document.elementFromPoint(e.clientX, e.clientY);
    const card = el && el.closest ? el.closest(".hoverAnimatedContainer") : null;

    if (card) {

      if (card !== activeCard) {
        if (activeCard) {
          activeCard.classList.remove("cursor-active");
        }
        activeCard = card;
        activeCard.classList.add("cursor-active");
      }

      const rect = card.getBoundingClientRect();
      card.style.setProperty("--mouse-x", `${e.clientX - rect.left}px`);
      card.style.setProperty("--mouse-y", `${e.clientY - rect.top}px`);
    } else {

      if (activeCard) {
        activeCard.classList.remove("cursor-active");

        activeCard.style.setProperty("--mouse-x", `-9999px`);
        activeCard.style.setProperty("--mouse-y", `-9999px`);
        activeCard = null;
      }
    }
  }, { passive: true });

  for (const card of cards) {
    card.addEventListener("pointerenter", (e) => {
      card.classList.add("cursor-active");
      animate_card_mouseover_effect({ currentTarget: card, clientX: e.clientX, clientY: e.clientY });
    });
    card.addEventListener("pointerleave", () => {
      card.classList.remove("cursor-active");
      card.style.setProperty("--mouse-x", `-9999px`);
      card.style.setProperty("--mouse-y", `-9999px`);
      if (activeCard === card) activeCard = null;
    });
  }
});

// element toggle function
const elementToggleFunc = function (elem) { elem.classList.toggle("active"); }


// sidebar variables
const sidebar = document.querySelector("[data-sidebar]");
const sidebarBtn = document.querySelector("[data-sidebar-btn]");

// sidebar toggle functionality for mobile
sidebarBtn.addEventListener("click", function () { elementToggleFunc(sidebar); });



// testimonials variables
const testimonialsItem = document.querySelectorAll("[data-testimonials-item]");
const modalContainer = document.querySelector("[data-modal-container]");
const modalCloseBtn = document.querySelector("[data-modal-close-btn]");
const overlay = document.querySelector("[data-overlay]");

// modal variables
const modalImg = document.querySelector("[data-modal-img]");
const modalTitle = document.querySelector("[data-modal-title]");
const modalDate = document.querySelector("[data-modal-date]");
const modalText = document.querySelector("[data-modal-text]");

// modal toggle function
const testimonialsModalFunc = function () {
  modalContainer.classList.toggle("active");
  overlay.classList.toggle("active");
}

for (let i = 0; i < testimonialsItem.length; i++) {
  testimonialsItem[i].addEventListener("click", function () {
    modalImg.src = this.querySelector("[data-testimonials-avatar]").src;
    modalImg.alt = this.querySelector("[data-testimonials-avatar]").alt;
    modalTitle.innerHTML = this.querySelector("[data-testimonials-title]").innerHTML;
    modalText.innerHTML = this.querySelector("[data-testimonials-text]").innerHTML;

    // Fetch the date from the clicked testimonial's data attribute
    const rawDate = this.getAttribute("data-date");

    if (rawDate && rawDate !== "N/A") {
      const formattedDate = new Date(rawDate).toLocaleDateString("en-US", {
        day: "2-digit", month: "long", year: "numeric"
      });

      modalDate.setAttribute("datetime", rawDate);  // Update the datetime attribute
      modalDate.innerHTML = formattedDate;  // Set the formatted date as content
    } else {
      modalDate.innerHTML = "Date not available";
    }

    testimonialsModalFunc();
  });
}


// add click event to modal close button
modalCloseBtn.addEventListener("click", testimonialsModalFunc);
overlay.addEventListener("click", testimonialsModalFunc);


// custom select variables
const select = document.querySelector("[data-select]");
const selectItems = document.querySelectorAll("[data-select-item]");
const selectValue = document.querySelector("[data-selecct-value]");
const filterBtn = document.querySelectorAll("[data-filter-btn]");

select.addEventListener("click", function () { elementToggleFunc(this); });

// add event in all select items
for (let i = 0; i < selectItems.length; i++) {
  selectItems[i].addEventListener("click", function () {

    let selectedValue = this.innerText.toLowerCase();
    selectValue.innerText = this.innerText;
    elementToggleFunc(select);
    filterFunc(selectedValue);

  });
}

// filter variables
const filterItems = document.querySelectorAll("[data-filter-item]");

const filterFunc = function (selectedValue) {

  for (let i = 0; i < filterItems.length; i++) {

    if (selectedValue === "all") {
      filterItems[i].classList.add("active");
    } else if (selectedValue === filterItems[i].dataset.category) {
      filterItems[i].classList.add("active");
    } else {
      filterItems[i].classList.remove("active");
    }

  }

}

// add event in all filter button items for large screen
let lastClickedBtn = filterBtn[0];

for (let i = 0; i < filterBtn.length; i++) {

  filterBtn[i].addEventListener("click", function () {

    let selectedValue = this.innerText.toLowerCase();
    selectValue.innerText = this.innerText;
    filterFunc(selectedValue);

    lastClickedBtn.classList.remove("active");
    this.classList.add("active");
    lastClickedBtn = this;

  });

}



// contact form variables
const form = document.querySelector("[data-form]");
const formInputs = document.querySelectorAll("[data-form-input]");
const formBtn = document.querySelector("[data-form-btn]");

// add event to all form input field
for (let i = 0; i < formInputs.length; i++) {
  formInputs[i].addEventListener("input", function () {

    // check form validation
    if (form.checkValidity()) {
      formBtn.removeAttribute("disabled");
    } else {
      formBtn.setAttribute("disabled", "");
    }

  });
}

// page navigation variables
const navigationLinks = document.querySelectorAll("[data-nav-link]");
const pages = document.querySelectorAll("[data-page]");

// add event to all nav link
for (let i = 0; i < navigationLinks.length; i++) {
  navigationLinks[i].addEventListener("click", function () {

    for (let i = 0; i < pages.length; i++) {
      if (this.innerHTML.toLowerCase() === pages[i].dataset.page) {
        pages[i].classList.add("active");
        navigationLinks[i].classList.add("active");
        window.scrollTo(0, 0);
      } else {
        pages[i].classList.remove("active");
        navigationLinks[i].classList.remove("active");
      }
    }

  });
}
