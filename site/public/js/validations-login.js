let errors = [];

window.addEventListener("load", () => {
    const form = document.getElementById("loginForm");

    form.addEventListener("submit", (event) => {
        // event.preventDefault();

        errors = [];
        clearValidations();

        validateInput("email", [
            [validator.isEmail, "Debe ser un email válido."],
            [
                validator.isLength,
                { max: 50 },
                "El email no puede ser mayor a 50 caracteres.",
            ],
            [validator.isLength, { min: 1 }, "El email es un campo requerido."],
        ]);
        validateInput("password", [
            [
                validator.isStrongPassword,
                {
                    minLength: 8,
                    minLowercase: 1,
                    minUppercase: 1,
                    minNumbers: 1,
                    minSymbols: 1,
                    returnScore: false,
                },
                "Debe contener una minúscula, una mayúscula, un número y un símbolo.",
            ],
            [
                validator.isLength,
                { max: 50 },
                "La contraseña no puede ser mayor a 50 caracteres.",
            ],
            [
                validator.isLength,
                { min: 8 },
                "La contraseña debe tener al menos 8 caracteres.",
            ],
        ]);
        if (checkErrors()) {
            event.preventDefault();
        }
    });
});
