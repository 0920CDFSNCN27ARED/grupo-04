const express = require("express");
const router = express.Router();
const productDetailController = require("../controllers/product-detail-controller");

router.get("/", productDetailController.show);

module.exports = router;
