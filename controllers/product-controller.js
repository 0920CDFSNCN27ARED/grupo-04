const getProducts = require("../utils/getProducts");
const toThousand = require("../utils/toThousand");
const path = require("path");
const fs = require("fs");
const { render } = require("ejs");

const getFromDB = require("../utils/getFromDB");
const getOneFromDB = require("../utils/getOneFromDB");
const getLastId = require("../utils/getLastId");
const saveInDB = require("../utils/saveInDB");

const productController = {
    showCreate: (req, res) => {
        res.render("product/productCreate");
    },
    create: (req, res, next) => {
        // necesito next??
        const products = getFromDB("productsDataBase");

        const newProductId = getLastId(products);

        const newProduct = {
            id: Number(newProductId),
            name: req.body.name,
            price: Number(req.body.price),
            description: req.body.description,
            location: req.body.location,
            image: req.files[0].filename,
        };

        saveInDB(products, newProduct, "productsDataBase");

        res.redirect("product/" + newProductId); // esto es una ruta
    },
    showDetail: (req, res) => {
        const product = getOneFromDB(req.params.id, "productsDataBase");

        if (!product) {
            return res.status(404).render("not-found");
        }

        res.render("product/productDetail", {
            product,
            toThousand,
        });
    },
    showEdit: (req, res) => {
        const products = getProducts();
        const productToEdit = products.find(
            (product) => product.id == req.params.id
        );
        res.render("product/productEdit", { productToEdit: productToEdit });
    },
    edit: (req, res) => {
        const products = getProducts();

        const selectedProduct = products.find((product) => {
            return product.id == req.body.id;
        });

        let filename =
            req.files.length == 0
                ? selectedProduct.image
                : req.files[0].filename;

        const editedProduct = {
            id: Number(req.body.id),
            name: req.body.name,
            price: Number(req.body.price),
            description: req.body.description,
            location: req.body.location,
            image: filename,
        };

        products.splice(products.indexOf(selectedProduct), 1, editedProduct);

        fs.writeFileSync(
            path.join(__dirname, "../data/productsDataBase.json"),
            JSON.stringify(products, null, 4)
        );
        res.redirect("/product/" + editedProduct.id);
    },
    delete: (req, res) => {
        const products = getProducts();

        const selectedProduct = products.find((product) => {
            return product.id == req.body.id;
        });

        products.splice(products.indexOf(selectedProduct), 1);

        fs.writeFileSync(
            path.join(__dirname, "../data/productsDataBase.json"),
            JSON.stringify(products, null, 4)
        );

        res.redirect("/product/productDeleteConfirmation");
    },
    deleteConfirmation: (req, res) => {
        res.render("product/productDeleteConfirmation");
    },
    showCart: (req, res) => {
        const products = getProducts();

        const addedToCartProduct = products.find((product) => {
            return product.id == req.params.id;
        });

        res.render("product/productCart", {
            addedToCartProduct: addedToCartProduct,
            toThousand,
        });
    },
};

module.exports = productController;
