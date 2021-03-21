const express = require("express");
const router = express.Router();
const productController = require("../controllers/product-controller");
const multer = require("multer");
const path = require("path");
const { check } = require("express-validator");

const assertSignedIn = require("../middlewares/auth/assertSignedIn");

const storage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, "public/images/products");
    },
    filename: function (req, file, cb) {
        cb(
            null,
            file.fieldname + "-" + Date.now() + path.extname(file.originalname) // TODO check size and extension
        );
    },
});

const fileFilter = (req, file, cb) => {
    const type = file.mimetype;
    const typeArray = type.split("/");

    if (typeArray[0] == "image") {
        cb(null, true);
    } else {
        cb(new multer.MulterError("not an image"));
    }
};

const upload = multer({
    fileFilter: fileFilter,
    storage: storage,
    limits: {
        fieldSize: 1 * 1024 * 1024 * 5, // 5 MB
        fieldNameSize: 200,
    },
});

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
router.post("/", upload.single("image"), productController.create),
    [
        check("name")
            .isLength({ min: 1, max: 50 })
            .withMessage("nombre minimo 1, max 50"),
        check("price")
            .isLength({ min: 1, max: 50 })
            .withMessage("precio min 1 max 50"),
        check("price")
            .isNumeric({ no_symbols: true })
            .withMessage("precio debe ser numero"),
        check("stock")
            .isNumeric({ no_symbols: true })
            .withMessage("sotck debe ser numero"),
        check("stock")
            .isLength({ min: 1, max: 50 })
            .withMessage("stock min 1 max 50"),
        check("description")
            .isLength({ min: 1, max: 1500 })
            .withMessage("descripción min 1 max 1500"),
        check("categoryId")
            .isLength({ min: 1, max: 15 })
            .withMessage("descripción min 1 max 15"), //TODO leer el length de categories
    ];

module.exports = router;
