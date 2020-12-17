const express = require("express");
const router = express.Router();
const indexController = require("../controllers/index-controller");

router.get("/", indexController.show);

router.get("/pruebaSession", function (req, res) {
    if (req.session.numeroVisitas == undefined) {
        req.session.numeroVisitas = 0;
    }
    req.session.numeroVisitas++;

    res.send("Session tiene el número:" + req.session.numeroVisitas);
});

module.exports = router;
