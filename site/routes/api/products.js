const express = require("express");
const router = express.Router();
const productAPIController = require("../../controllers/api/product-controller");

router.get("/count", productAPIController.count);
router.get("/total-price", productAPIController.totalPrice);
router.get("/list", productAPIController.list);
router.get("/list/:id", productAPIController.detail);
router.get("/last", productAPIController.last);
router.get("/categories", productAPIController.categories);

module.exports = router;
