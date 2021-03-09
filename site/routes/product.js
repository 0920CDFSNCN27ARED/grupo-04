const express = require("express");
const router = express.Router();
const productController = require("../controllers/product-controller");
const multer = require("multer");
const path = require("path");
const {check} = require("express-validator");

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
    productController.showEdit
);
router.put("/:id/edit", upload.single("image"), productController.edit);
router.delete("/:id/delete", productController.delete);
router.post("/",
upload.single("image"), productController.create),
[
    check("name").isLength({min:1, max: 50}).withMessage("nombre minimo 1, max 50"),
    check("price").isLength({min:1, max: 50}).withMessage("precio min 1 max 50"),
    check("price").isNumeric({ no_symbols: true }).withMessage("precio debe ser numero"),
    check("stock").isNumeric({ no_symbols: true }).withMessage("sotck debe ser numero"),
    check("stock").isLength({min:1, max: 50}).withMessage("stock min 1 max 50"),
    check("description").isLength({min:1, max: 1500}).withMessage("descripción min 1 max 1500"),
    check("categoryId").isLength({min:1, max: 15}).withMessage("descripción min 1 max 15"), //TODO leer el length de categories
    
];

module.exports = router;
