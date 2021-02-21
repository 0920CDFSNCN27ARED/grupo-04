const toThousand = require("../utils/toThousand");
const { render } = require("ejs");

const getFromDB = require("../utils/getFromDB");
const getOneFromDB = require("../utils/getOneFromDB");
const getLastId = require("../utils/getLastId");
const saveInDB = require("../utils/saveInDB");
const editInDB = require("../utils/editInDB");
const deleteFromDB = require("../utils/deleteFromDB");

const { Product } = require("../database/models");

const productController = {
    showCreate: (req, res) => {
        res.render("product/productCreate");
    },
    create: async (req, res, next) => {
        // necesito next??

        const newProduct = {
            name: req.body.name,
            price: Number(req.body.price),
            description: req.body.description,
            image: req.file.filename,
            stock: req.body.stock,
            isBanned: 0, // TODO poner valor default 0 en SQL
            categoryId: req.body.categoryId,
            userId: res.locals.user.id,
        };

        return res.send(newProduct); // TODO crear con sequelize nuevo registro en DB

        // TODO obtener el ID del registro creado para mandarlo a la ruta
        // https://github.com/sequelize/sequelize/issues/4914
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
            // toThousand,
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
            // toThousand,
        });
    },
};

module.exports = productController;
