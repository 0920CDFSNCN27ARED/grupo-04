const getProducts = require("../utils/getProducts");
const productsList = getProducts();
const toThousand = require("../utils/toThousand");

const indexController = {
    show: (req, res) => {
        res.render("index", {
            products: productsList,
            moneda: "ARS",
            toThousand,
        });
    },
};

module.exports = indexController;
