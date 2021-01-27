//const express = require("express");
//const router = express.Router();
//  creado para cuando este la ruta post de la registracion.... let logDBMiddleware = require("../middlewares/logDBMiddleware");

//router.get("/", registerController.show);
//router.post("/", registerController.newUserRegister);

//module.exports = router;

const Router = require("express").Router;
const router = Router();

const multer = require("multer");
const upload = multer({ dest: "public/profile_pics" });

const authController = require("../controllers/auth-controller");

router.get("/login", authController.showLogin);
router.post("/login", authController.login);

router.get("/register", authController.showRegister);
router.post("/register", upload.single("avatar"), authController.register);
router.delete("/login", authController.logOut);
//app.post("/register", upload.single("avatar"), authController.register);
//});

module.exports = router;
