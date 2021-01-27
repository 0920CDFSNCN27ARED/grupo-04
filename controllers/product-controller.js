const toThousand = require("../utils/toThousand");
const { render } = require("ejs");

const getFromDB = require("../utils/getFromDB");
const getOneFromDB = require("../utils/getOneFromDB");
const getLastId = require("../utils/getLastId");
const saveInDB = require("../utils/saveInDB");
const editInDB = require("../utils/editInDB");
const deleteFromDB = require("../utils/deleteFromDB");

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
            image: req.file.filename,
        };

        saveInDB(products, newProduct, "productsDataBase");

        res.redirect("product/" + newProductId); // esto es una ruta
    },
    showDetail: (req, res) => {
        const product = getOneFromDB(req.params.id, "productsDataBase");

        if (!product) {
            return res.status(404).render("not-found");
        }

        const users = getFromDB("usersDataBase");
        const user = users.find((user) => user.id == product.idUsuario);
        const userImage = user.avatar;

        res.render("product/productDetail", {
            product,
            toThousand,
            userImage,
        });
    },
    showEdit: (req, res) => {
        const products = getFromDB("productsDataBase");

        const productToEdit = products.find(
            (product) => product.id == req.params.id
        );

        if (!productToEdit) {
            return res.status(404).render("not-found");
        }

        res.render("product/productEdit", { productToEdit: productToEdit });
    },
    edit: (req, res) => {
        const products = getFromDB("productsDataBase");

        const selectedProduct = products.find((product) => {
            return product.id == req.body.id;
        });

        if (!selectedProduct) {
            return res.status(404).render("not-found");
        }

        let filename = req.file ? req.file.filename : selectedProduct.image;

        const editedProduct = {
            id: Number(req.body.id),
            name: req.body.name,
            price: Number(req.body.price),
            description: req.body.description,
            location: req.body.location,
            image: filename,
        };

        editInDB(products, selectedProduct, editedProduct, "productsDataBase");

        res.redirect("/product/" + editedProduct.id);
    },
    delete: (req, res) => {
        const deleted = deleteFromDB(req.body.id, "productsDataBase");

        if (!deleted) {
            res.render("product/productNotDeleted");
        } else {
            res.render("product/productDeleted"); // es una vista, sin barra al principio
        }
    },
    showCart: (req, res) => {
        const products = getFromDB("productsDataBase"); // TO DO que almacene con session si hay cosas o no. Si no tiene cosas mostrar el carrito vacío

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
