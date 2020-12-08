const { render } = require("ejs");
const productCartController = require("./product-cart-controller");

const productController = {
    create: (req, res) => {
        res.send("Crear un producto");
    },
};

module.exports = productController;
