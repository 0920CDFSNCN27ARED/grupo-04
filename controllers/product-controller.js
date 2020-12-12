const getProducts = require("../utils/getProducts");
const toThousand = require("../utils/toThousand");

const productController = {
    showCreate: (req, res) => {
        res.render("product/productCreate");
    },
    create: (req, res) => {
        res.send("OK");
    },
    showDetail: (req, res) => {
        const products = getProducts();
        const productDetail = products.find((product) => {
            return req.params.id == product.id;
        });
        if (productDetail == null) {
            return (
                res
                    // TO DO vincular con vista 404
                    .status(404)
                    .send("404 not found. <br> ¡Houston, poseemos problemas!")
            );
        }

        res.render("product/productDetail", {
            product: productDetail,
            toThousand,
        });
    },
    showCart: (req, res) => {
        res.render("product/productCart");
    },
};

module.exports = productController;
