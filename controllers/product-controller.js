const getProducts = require("../utils/getProducts");
const toThousand = require("../utils/toThousand");
const path = require("path");
const fs = require("fs");
const { render } = require("ejs");

const productController = {
    showCreate: (req, res) => {
        res.render("product/productCreate");
    },
    create: (req, res, next) => {
        const products = getProducts();
        const createdProductId = products[products.length - 1].id + 1;
        const createdProduct = {
            id: Number(createdProductId),
            name: req.body.name,
            price: Number(req.body.price),
            description: req.body.description,
            location: req.body.location,
            image: req.files[0].filename,
        };
        products.push(createdProduct);
        fs.writeFileSync(
            path.join(__dirname, "../data/productsDataBase.json"),
            JSON.stringify(products, null, 4)
        );
        res.redirect("product/" + createdProductId);
    },
    showDetail: (req, res) => {
        const products = getProducts();
        const productDetail = products.find((product) => {
            return req.params.id == product.id;
        });
        if (productDetail == null) {
            return (
                res
                    // TO DO vincular con vista 404
                    .status(404)
                    .send("404 not found. <br> ¡Houston, poseemos problemas!")
            );
        }

        res.render("product/productDetail", {
            product: productDetail,
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
        });
    },
};

module.exports = productController;
