const getProducts = require("../utils/getProducts");
const toThousand = require("../utils/toThousand");

const {
    User,
    UserCategory,
    Product,
    ProductCategory,
    Order,
    OrderStatus,
    PaymentMethod,
} = require("../database/models");

const indexController = {
    show: (req, res) => {
        const productsList = getProducts();
        res.render("index", {
            products: productsList,
            moneda: "ARS",
            toThousand,
        });
    },
    search: (req, res) => {
        const products = getProducts();

        const searchString = req.query.search;

        const searchArray = searchString.split(" ");

        let foundProducts = [];
        searchArray.forEach((word) => {
            products.forEach((product) => {
                if (product.name.toLowerCase().includes(word.toLowerCase())) {
                    const alreadyFound = foundProducts.find(
                        (foundProduct) => foundProduct.id == product.id
                    );
                    if (!alreadyFound) {
                        foundProducts.push(product);
                    }
                }
            });
        });

        res.render("index", {
            products: foundProducts,
            moneda: "ARS",
            toThousand,
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
            include: [Product.USER_ALIAS, Product.CATEGORY_ALIAS],
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
