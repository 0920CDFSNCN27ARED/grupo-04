const Router = require("express").Router;
const router = Router();

const { check, validationResult, body } = require("express-validator");

const multer = require("multer");
const upload = multer({ dest: "public/profile_pics" }); // TODO pasar a kebab-case y cambiar link en controller y vistas

const authController = require("../controllers/auth-controller");

router.get("/login", authController.showLogin);
router.post(
    "/login",
    [
        check("email")
            .isLength({ min: 1 })
            .withMessage("El mail es un campo requerido."),
        check("email").isEmail().withMessage("Debe ser un email válido."),
        check("email")
            .isLength({ max: 50 })
            .withMessage("El email no puede ser mayor a 50 caracteres."),
        check("password")
            .isLength({ min: 1, max: 50 })
            .withMessage(
                "La contraseña es obligatorio y no puede tener más de 50 caracteres."
            ),
        check("password")
            .isStrongPassword({
                minLength: 8,
                minLowercase: 1,
                minUppercase: 1,
                minNumbers: 1,
                minSymbols: 1,
                returnScore: false,
            })
            .withMessage(
                "Debe contener una minúscula, una mayúscula, un número y un símbolo."
            ),
    ],
    authController.login
);

router.get("/register", authController.showRegister);
router.post(
    "/register",
    upload.single("avatar"), // TODO validar con multer si es archivo permitido y ¿manejo de error si no hay archivo?
    [
        check("firstName")
            .isLength({ min: 1, max: 40 })
            .withMessage(
                "El nombre es obligatorio y no puede tener más de 40 caracteres."
            ),
        check("lastName")
            .isLength({ min: 1, max: 40 })
            .withMessage(
                "El apellido es obligatorio y no puede tener más de 40 caracteres."
            ),
        check("email").isEmail().withMessage("Debe ser un email válido."),
        check("email")
            .isLength({ min: 1, max: 40 })
            .withMessage(
                "El email es obligatorio y no puede tener más de 40 caracteres."
            ),
        check("password")
            .isLength({ min: 8, max: 50 })
            .withMessage(
                "La contraseña debe contener al menos 8 caracteres y no más de 50."
            ),
        check("password")
            .isStrongPassword({
                minLength: 8,
                minLowercase: 1,
                minUppercase: 1,
                minNumbers: 1,
                minSymbols: 1,
                returnScore: false,
            })
            .withMessage(
                "Debe contener una minúscula, una mayúscula, un número, un símbolo y un mínimo total de 8 caracteres."
            ),
        check("passwordConfirmation")
            .isLength({ min: 1 })
            .withMessage("Debe escribir nuevamente la contraseña."),
        // TODO hacer custom para confirm de constraseña
        check("city")
            .isLength({ min: 1 })
            .withMessage("La ciudad es un campo requerido."),
        check("state")
            .isLength({ min: 1 })
            .withMessage("La provincia es un campo requerido."),
        check("street")
            .isLength({ min: 1 })
            .withMessage("La calle es un campo requerido."),
        check("houseNumber")
            .isLength({ min: 1 })
            .withMessage("El número es un campo requerido."),
        check("floor")
            .isLength({ max: 2 })
            .withMessage("El piso no puede tener más de 2 caracteres."),
        check("apartment")
            .isLength({ max: 3 })
            .withMessage("El departamento no puede tener más de 3 caracteres."),
        check("phoneNumber")
            .isLength({ min: 1, max: 20 })
            .withMessage(
                "El número de teléfono es requerido y no puede tener más de 20 caracteres."
            ),
        // TO DO hacer un custom validatior para el check de términos y condiciones
    ],
    authController.register
);
router.delete("/login", authController.logOut);

module.exports = router;
