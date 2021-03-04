function checkErrors() {
    if (errors.length > 0) {
        errors.forEach((e) => {
            const feedbackId = e.inputId + "Feedback";
            const feedbackDiv = document.getElementById(feedbackId);
            const input = document.getElementById(e.inputId);
            const iconId = e.inputId + "Icon";
            const isInvalidIcon = document.getElementById(iconId);
            input.classList.add("is-invalid");
            feedbackDiv.innerHTML = e.msg;
            feedbackDiv.classList.add("has-message");
            isInvalidIcon.classList.add(
                "fa-exclamation-circle",
                "is-invalid-icon"
            );
        });
        return true;
    }

    return false;
}
