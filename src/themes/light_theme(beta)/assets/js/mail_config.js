document.addEventListener("DOMContentLoaded", function () {
    const form = document.getElementById("contact-form");

    form.addEventListener("submit", async function (event) {
        event.preventDefault();

        const button = document.getElementById("form-btn");
        const span = button.querySelector("span");
        const statusMessage = document.getElementById("form-status");

        if (button.disabled) return;

        span.innerHTML = "Sending... &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
        button.disabled = true;

        let formData = new FormData(this);

        try {
            let response = await fetch("core/mail_config.php", {
                method: "POST",
                body: formData,
                headers: {
                    "Cache-Control": "no-cache",
                },
            });

            let result = await response.text();
            statusMessage.style.display = "block";
            statusMessage.innerHTML = result;

            span.textContent = "Send Message";
            button.disabled = false;
            this.reset();

        } catch (error) {
            statusMessage.style.display = "block";
            statusMessage.innerHTML = "An Error Occurred.";
            span.textContent = "Send Message";
            button.disabled = false;
        }
    });
});
