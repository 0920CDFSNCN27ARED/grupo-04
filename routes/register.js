const express = require("express");
const router = express.Router();
const registerController = require("../controllers/register-controller");
//  creado para cuando este la ruta post de la registracion.... let logDBMiddleware = require("../middlewares/logDBMiddleware");

router.get("/", registerController.show);
// armar la ruta por metodo post router.post("/", registerController.show)

module.exports = router;
