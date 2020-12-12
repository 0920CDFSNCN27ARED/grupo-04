const getProducts = require("../utils/getProducts");
const productsList = getProducts();

const indexController = {
    show: (req, res) => {
        res.render("index", { products: productsList });
    },
};

module.exports = indexController;
