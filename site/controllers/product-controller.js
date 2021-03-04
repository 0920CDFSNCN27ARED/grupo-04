// const toThousand = require("../utils/toThousand");
// const { render } = require("ejs");

const { Product } = require("../database/models");

const productController = {
    showCreate: (req, res) => {
        res.render("product/productCreate");
    },
    create: async (req, res, next) => {
        // necesito next??

        const result = await Product.create({
            name: req.body.name,
            price: Number(req.body.price),
            description: req.body.description,
            image: req.file.filename,
            stock: req.body.stock,
            categoryId: req.body.categoryId,
            userId: res.locals.user.id,
        });

        const product = result.toJSON();
        const productId = product.id;

        res.redirect("/product/" + productId);
    },
    showDetail: async (req, res) => {
        const resultProduct = await Product.findByPk(req.params.id, {
            include: [Product.USER_ALIAS],
        });

        if (!resultProduct) {
            return res.status(404).render("not-found");
        }

        const product = resultProduct.toJSON();

        res.render("product/productDetail", {
            product,
        });
    },
    showEdit: async (req, res) => {
        const user = res.locals.user;
        const productResult = await Product.findByPk(req.params.id);

        if (!productResult) {
            return res.status(404).render("not-found");
        }

        const product = productResult.toJSON();

        if (user.id != product.userId) {
            return res.redirect("/");
        }

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
    delete: async (req, res) => {
        const product = await Product.findByPk(req.params.id);
        const user = res.locals.user;

        if (user.id != product.userId) {
            return res.redirect("/");
        }

        const deleted = await Product.destroy({
            where: {
                id: req.params.id,
            },
        });

        // TODO redirigir a una vista de verificación SI/NO para borrar
        switch (deleted) {
            case 0:
                res.render("product/productNotDeleted");
                break;
            case 1:
                res.render("product/productDeleted"); // es una vista, sin barra al principio
                break;
            default:
                res.status(404).render("not-found");
                break;
        }
    },
    showCart: async (req, res) => {
        // TO DO que almacene con session si hay cosas o no. Si no tiene cosas mostrar el carrito vacío

        const resultProduct = await Product.findOne({
            include: [Product.USER_ALIAS],
            where: {
                id: req.params.id,
            },
        });

        const product = resultProduct.toJSON();

        if (product.user.id == res.locals.user.id) {
            return res.render("product/product-own");
        }

        res.render("product/productCart", {
            product,
        });
    },
};

module.exports = productController;
