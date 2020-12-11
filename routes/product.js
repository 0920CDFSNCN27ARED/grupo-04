const express = require("express");
const router = express.Router();
const productController = require("../controllers/product-controller");

router.get("/productCart", productController.showCart);
router.get("/:id", productController.showDetail);
// router.get("/crear", productController.showDetail);

module.exports = router;
