const getProducts = require("../utils/getProducts");
const toThousand = require("../utils/toThousand");

const { User, UserCategory } = require("../database/models");

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
            include: User.CATEGORY_ALIAS,
        });
        res.send(users);
    },
    categories: async (req, res) => {
        const categories = await UserCategory.findAll({
            include: UserCategory.USERS_LIST_ALIAS,
        });
        res.send(categories);
    },
};

module.exports = indexController;
