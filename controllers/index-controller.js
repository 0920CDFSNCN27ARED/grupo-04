const {
    User,
    UserCategory,
    Product,
    ProductCategory,
    Order,
    OrderStatus,
    PaymentMethod,
} = require("../database/models");

const { Op } = require("sequelize");

const indexController = {
    show: async (req, res) => {
        const products = await Product.findAll();

        res.render("index", {
            products,
        });
    },
    search: async (req, res) => {
        const searchString = req.query.search;
        const searchArray = searchString.split(" ");

        const products = await Product.findAll({
            where: {
                name: { [Op.substring]: searchString }, // TODO que acepte múltiples palabras
            },
        });
        const search = true;

        res.render("index", {
            products,
            search,
        });
    },
    //
    // TEST de modelos
    //
    users: async (req, res) => {
        const users = await User.findAll({
            include: [
                User.CATEGORY_ALIAS,
                User.PRODUCTS_ALIAS,
                User.ORDERS_LIST_ALIAS,
            ],
        });
        res.send(users);
    },
    userCategories: async (req, res) => {
        const categories = await UserCategory.findAll({
            include: UserCategory.USERS_LIST_ALIAS,
        });
        res.send(categories);
    },
    products: async (req, res) => {
        const products = await Product.findAll({
            include: [
                Product.USER_ALIAS,
                Product.CATEGORY_ALIAS,
                Product.ORDERS_ALIAS, // TODO No acepta como válido el nombre del modelo en through y solo arroja la primera orden del array
            ],
        });
        res.send(products);
    },
    productCategories: async (req, res) => {
        const productCategories = await ProductCategory.findAll({
            include: [ProductCategory.PRODUCTS_LIST_ALIAS],
        });
        res.send(productCategories);
    },
    orders: async (req, res) => {
        const orders = await Order.findAll({
            include: [
                Order.STATUS_ALIAS,
                Order.USER_ALIAS,
                Order.PAYMENT_METHOD_ALIAS,
                Order.PRODUCTS_ALIAS, // TODO No acepta como válido el nombre del modelo en through y solo arroja el primer producto del array
            ],
        });
        res.send(orders);
    },
    orderStatuses: async (req, res) => {
        const orderStatuses = await OrderStatus.findAll({
            include: [OrderStatus.ORDERS_LIST_ALIAS],
        });
        res.send(orderStatuses);
    },
    paymentMethods: async (req, res) => {
        const paymentMethods = await PaymentMethod.findAll({
            include: [PaymentMethod.ORDERS_LIST_ALIAS],
        });
        res.send(paymentMethods);
    },
};

module.exports = indexController;
