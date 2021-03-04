function clearValidations() {
    const arrayInputs = document.getElementsByClassName("validate");
    const arrayFeedbacks = document.getElementsByClassName("feedback");
    const validationIcons = document.getElementsByClassName("validation-icon");

    for (const input of arrayInputs) {
        input.classList.remove("is-invalid", "is-valid");
    }
    for (const feedback of arrayFeedbacks) {
        feedback.classList.remove("has-message");
        feedback.innerHTML = "";
    }
    for (const validationIcon of validationIcons) {
        validationIcon.classList.remove(
            "fa-exclamation-circle",
            "is-invalid-icon",
            "fa-check-circle",
            "is-valid-icon"
        );
    }
}
