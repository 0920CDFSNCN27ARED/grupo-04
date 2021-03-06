let errors = [];

window.addEventListener("load", () => {

    
    const form = document.getElementById("registerForm");
    
    form.addEventListener("submit", (event) => {
        // event.preventDefault();

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
                { min: 8, max:50 },
                "La contraseña debe contener al menos 8 caracteres y no más de 50.",
            ],
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
                "Debe contener una minúscula, una mayúscula, un número, un símbolo y un mínimo total de 8 caracteres.",
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
                "El piso no puede tener más de 2 caracteres.",
            ],
        ]);
        validateInput("apartment", [
            [
                validator.isLength,
                { max: 3 },
                "El departamento no puede tener más de 3 caracteres.",
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

        const avatar = document.getElementById("avatar")

        const avatarValue = avatar.value;

        fileValidation(avatarValue);
        
        function fileValidation(fileInputValue) {        
            // Allowing file type 
            var allowedExtensions =  /(\.jpg|\.jpeg|\.png|\.bmp|\.gif)$/i; 
              
            if (!allowedExtensions.exec(fileInputValue)) { 
                // alert('Invalid file type'); 
                //TODO mandar mensaje al feedback de imagen
                fileInputValue = ''; 
                return false; 
            }  

            //TODO implementar preview de imagen si está OK
        } 

    });
});
