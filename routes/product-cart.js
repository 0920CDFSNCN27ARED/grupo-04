const express = require("express");
const router = express.Router();
const productCartController = require("../controllers/product-cart-controller");

router.get("/", productCartController.show);

module.exports = router;
