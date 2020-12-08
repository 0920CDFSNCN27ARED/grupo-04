const express = require("express");
const router = express.Router();
const productDetailController = require("../controllers/product-detail-controller");

router.get("/:id", productDetailController.showDetail);

module.exports = router;
