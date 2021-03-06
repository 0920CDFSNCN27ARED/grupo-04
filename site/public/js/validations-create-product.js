let errors = [];

window.addEventListener("load", () => {

    
    const form = document.getElementById("create-product-form");
    const category = document.getElementById("categoryId");
    const categorySelects =  Number(category.length - 1)
    
    form.addEventListener("submit", (event) => {
        // event.preventDefault();

        errors = [];
        clearValidations();

        validateInput("name", [
            [
                validator.isLength,
                { max: 50 },
                "El nombre no puede tener más de 50 caracteres.",
            ],
            [
                validator.isLength,
                { min: 1 },
                "El nombre es un campo requerido.",
            ],
        ]);
        validateInput("price", [
            [
                validator.isNumeric,
                { no_symbols: true },
                "El precio debe ser un valor numérico.",
            ],
            [
                validator.isLength,
                { min: 1 },
                "El precio es un campo requerido.",
            ],
        ]);
        validateInput("stock", [
            [
                validator.isNumeric,
                { no_symbols: true },
                "El precio debe ser un valor numérico.",
            ],
            [
                validator.isLength,
                { max: 5 },
                "El stock no puede ser mayor a 5 cifras.",
            ],
            [
                validator.isLength,
                { min: 1 },
                "El stock es un campo requerido.",
            ],
        ]);
        validateInput("description", [
            [
                validator.isLength,
                { min: 1 },
                "La descripción es un campo requerido.",
            ],
            [
                validator.isLength,
                { max: 1500 },
                "La descripción no puede exceder los 1500 caracteres.",
            ],
        ]);
        validateInput("categoryId", [
            [
                validator.isLength,
                { min: 1 },
                "La categoría es un campo requerido.",
            ],
            [
                validator.isInt,
                { min: 1, max: categorySelects },
                "La categoría debe ser una de las brindadas.",
            ],
        ]);
        
        if (checkErrors()) {
            event.preventDefault();
        }


        // const avatar = document.getElementById("avatar")

        // const avatarValue = avatar.value;

        // fileValidation(avatarValue);
        
        // function fileValidation(fileInputValue) {        
        //     // Allowing file type 
        //     var allowedExtensions =  /(\.jpg|\.jpeg|\.png|\.bmp|\.gif)$/i; 
              
        //     if (!allowedExtensions.exec(fileInputValue)) { 
        //         // alert('Invalid file type'); 
        //         //TODO mandar mensaje al feedback de imagen
        //         fileInputValue = ''; 
        //         return false; 
        //     }  

        //     //TODO implementar preview de imagen si está OK
        // } 

    });
});
