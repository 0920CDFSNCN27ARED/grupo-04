let errors = [];

window.addEventListener("load", () => {
    const form = document.getElementById("registerForm");

    form.addEventListener("submit", (event) => {
        event.preventDefault();

        errors = [];
        clearValidations();

        validateInput("firstName", [
            [
                validator.isLength,
                { max: 40 },
                "El nombre no puede tener más de 40 caracteres.",
            ],
            [
                validator.isLength,
                { min: 1 },
                "El nombre es un campo requerido.",
            ],
        ]);
        validateInput("lastName", [
            [
                validator.isLength,
                { max: 40 },
                "El apellido no puede tener más de 40 caracteres.",
            ],
            [
                validator.isLength,
                { min: 1 },
                "El apellido es un campo requerido.",
            ],
        ]);
        validateInput("email", [
            [
                validator.isLength,
                { max: 40 },
                "El correo electrónico no puede tener más de 40 caracteres.",
            ],
            [
                validator.isEmail,
                "El correo electrónico debe ser un email valido.",
            ],
            [
                validator.isLength,
                { min: 1 },
                "El correo electrónico es un campo requerido.",
            ],
        ]);
        validateInput("password", [
            [
                validator.isLength,
                { min: 1 },
                "La contraseña es un campo requerido.",
            ],
        ]);
        validateInput("passwordConfirmation", [
            [
                validator.isLength,
                { min: 1 },
                "Debe escribir nuevamente la contraseña.",
            ],
        ]);
        validateInput("city", [
            [validator.isLength, { min: 1 }, "La ciudad es un campo requerido"],
        ]);
        validateInput("state", [
            [
                validator.isLength,
                { min: 1 },
                "La provincia es un campo requerido",
            ],
        ]);
        validateInput("street", [
            [validator.isLength, { min: 1 }, "La calle es un campo requerido"],
        ]);
        validateInput("houseNumber", [
            [validator.isLength, { min: 1 }, "El número es un campo requerido"],
        ]);
        validateInput("floor", [
            [
                validator.isLength,
                { max: 2 },
                "El piso no puede tener más de 2 caracteres",
            ],
        ]);
        validateInput("apartment", [
            [
                validator.isLength,
                { max: 2 },
                "El departamento no puede tener más de 2 caracteres",
            ],
        ]);
        validateInput("phoneNumber", [
            [
                validator.isLength,
                { min: 1 },
                "El número de teléfono es requerido",
            ],
            [
                validator.isLength,
                { max: 20 },
                "El número de teléfono no puede tener más de 20 caracteres",
            ],
        ]);
        validateInput("termsAndConditions", [
            [isTrue, "Debés aceptar los terminos y condiciones."],
        ]);

        if (checkErrors()) {
            event.preventDefault();
        }
    });
});

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

function isTrue(value) {
    return value;
}
