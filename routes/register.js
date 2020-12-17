const express = require("express");
const router = express.Router();
const registerController = require("../controllers/register-controller");
//  creado para cuando este la ruta post de la registracion.... let logDBMiddleware = require("../middlewares/logDBMiddleware");

router.get("/", registerController.show);
router.post("/", registerController.newUserRegister);

module.exports = router;
