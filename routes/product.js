const express = require("express");
const router = express.Router();
const productController = require("../controllers/product-controller");

router.get("/productCart", productController.showCart);
router.get("/create", productController.showCreate);
router.get("/:id", productController.showDetail);
router.post("/", productController.create);

module.exports = router;
