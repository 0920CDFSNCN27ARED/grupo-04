const express = require("express");
const router = express.Router();
const productAPIController = require("../../controllers/api/product-controller");

router.get("/", productAPIController.showAll);
router.get("/:id", productAPIController.showDetail);

module.exports = router;
