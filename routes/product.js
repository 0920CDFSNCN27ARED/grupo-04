const express = require("express");
const router = express.Router();
const productController = require("../controllers/product-controller");
const multer = require("multer");
const path = require("path");
const authenticate = require("../middlewares/auth/authenticate");
const assertSignedIn = require("../middlewares/auth/assertSignedIn");
const assertIsAdmin = require("../middlewares/auth/assertIsAdmin");

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
router.get("/:id", assertSignedIn, productController.showDetail);
router.get(
    "/:id/edit",

    assertSignedIn,
    assertIsAdmin,
    productController.showEdit
);
router.put("/:id/edit", upload.single("image"), productController.edit);
router.post("/", upload.single("image"), productController.create);
router.delete("/", productController.delete);

module.exports = router;
