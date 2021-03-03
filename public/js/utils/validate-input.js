function validateInput(inputId, validations) {
    const input = document.getElementById(inputId);

    let foundErrors = false;
    for (const validation of validations) {
        const validationFunction = validation[0]; // validator's function
        const errorMsg = validation[validation.length - 1]; // last index
        const validationOptions =
            validation.length > 2 ? validation[1] : undefined; // function's options
        let inputValue;
        switch (input.type) {
            case "checkbox": {
                inputValue = input.checked;
                break;
            }
            default:
                inputValue = input.value;
        }
        if (!validationFunction(inputValue, validationOptions)) {
            const error = {
                inputId,
                msg: errorMsg,
            };
            errors.push(error);
            foundErrors = true;
        }
    }

    const validationIconId = inputId + "Icon";
    const validationIcon = document.getElementById(validationIconId);

    if (!foundErrors) {
        input.classList.add("is-valid");
        validationIcon.classList.add("fa-check-circle", "is-valid-icon");
    }
}
