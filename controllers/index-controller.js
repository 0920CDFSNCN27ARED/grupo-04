const getProducts = require("../utils/getProducts");
const toThousand = require("../utils/toThousand");

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
                if (
                    product.name.toLowerCase().indexOf(word.toLowerCase()) > -1
                ) {
                    foundProducts.push(product);
                }
            });
        });
        // res.send(foundProducts);
        res.render("index", {
            products: foundProducts,
            moneda: "ARS",
            toThousand,
        });
    },
};

module.exports = indexController;
