const productDetailController = require("./product-detail-controller");

const productCartController = {
    show: (req, res) => {
        res.render("productCart");
    },
};

module.exports = productCartController;
