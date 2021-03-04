const Router = require("express").Router;
const router = Router();

const { check, validationResult, body } = require("express-validator");

const multer = require("multer");
const upload = multer({ dest: "public/profile_pics" });

const authController = require("../controllers/auth-controller");

router.get("/login", authController.showLogin);
router.post(
    "/login",
    [
        check("email")
            .isLength({ min: 1 })
            .withMessage("El mail es un campo requerido"),
        check("email").isEmail().withMessage("El mail es un campo requerido"),
    ],
    authController.login
);

router.get("/register", authController.showRegister);
router.post("/register", upload.single("avatar"), authController.register);
router.delete("/login", authController.logOut);

module.exports = router;
