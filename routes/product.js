const express = require("express");
const router = express.Router();
const productController = require("../controllers/product-controller");
const multer = require("multer");
const path = require("path");
const assertSignedIn = require("../middlewares/auth/assertSignedIn");

var storage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, "public/images/products");
    },
    filename: function (req, file, cb) {
        cb(
            null,
            file.fieldname + "-" + Date.now() + path.extname(file.originalname)
        );
    },
});

var upload = multer({ storage: storage });

router.get("/productCart/:id", productController.showCart);
router.get("/create", assertSignedIn, productController.showCreate);
router.get("/:id", productController.showDetail);
router.get("/:id/edit", productController.showEdit);
router.post("/", upload.single("image"), productController.create);
router.put("/", upload.single("image"), productController.edit);
router.delete("/", productController.delete);

module.exports = router;
