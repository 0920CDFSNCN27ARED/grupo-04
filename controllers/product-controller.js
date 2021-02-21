const toThousand = require("../utils/toThousand");
const { render } = require("ejs");

const getFromDB = require("../utils/getFromDB");
const getOneFromDB = require("../utils/getOneFromDB");
const getLastId = require("../utils/getLastId");
const saveInDB = require("../utils/saveInDB");
const editInDB = require("../utils/editInDB");
const deleteFromDB = require("../utils/deleteFromDB");

const { Product, User } = require("../database/models");

const productController = {
    showCreate: (req, res) => {
        res.render("product/productCreate");
    },
    create: async (req, res, next) => {
        // necesito next??

        Product.create({
            name: req.body.name,
            price: Number(req.body.price),
            description: req.body.description,
            image: req.file.filename,
            stock: req.body.stock,
            isBanned: 0, // TODO poner valor default 0 en SQL
            categoryId: req.body.categoryId,
            userId: res.locals.user.id,
        });

        res.redirect("/");

        // TODO obtener el ID del registro creado para mandarlo a la ruta
        // https://github.com/sequelize/sequelize/issues/4914
        // res.redirect("product/" + newProductId); // esto es una ruta
    },
    showDetail: async (req, res) => {
        const resultProduct = await Product.findOne({
            where: {
                id: Number(req.params.id),
            },
        });

        if (!resultProduct) {
            return res.status(404).render("not-found");
        }

        const product = resultProduct.toJSON();

        const resultUser = await User.findOne({
            where: {
                id: product.UserId,
            },
        });

        const user = resultUser.toJSON();

        res.render("product/productDetail", {
            product,
            user,
        });
    },
    showEdit: async (req, res) => {
        const productResult = await Product.findOne({
            where: {
                id: req.params.id,
            },
        });

        if (!productResult) {
            return res.status(404).render("not-found");
        }

        const product = productResult.toJSON();

        res.render("product/productEdit", { product });
    },
    edit: async (req, res) => {
        if (req.file) {
            await Product.update(
                {
                    name: req.body.name,
                    price: Number(req.body.price),
                    description: req.body.description,
                    image: req.file.filename,
                    stock: Number(req.body.stock),
                    categoryId: req.body.categoryId,
                },
                {
                    where: {
                        id: req.params.id,
                    },
                }
            );
        } else {
            await Product.update(
                {
                    name: req.body.name,
                    price: Number(req.body.price),
                    description: req.body.description,
                    stock: Number(req.body.stock),
                    categoryId: req.body.categoryId,
                },
                {
                    where: {
                        id: req.params.id,
                    },
                }
            );
        }

        return res.redirect("/product/" + req.params.id);
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
