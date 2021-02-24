const { Product } = require("../../database/models");

const productController = {
    showAll: async (req, res) => {
        const products = await Product.findAll();
        products.forEach((product) => {
            product.setDataValue(
                "endpoint",
                `${req.originalUrl}/${product.id}`
            );
        });
        const apiResponse = {
            meta: {
                status: 200,
                total: products.length,
                url: req.originalUrl,
            },
            data: products,
        };
        res.json(apiResponse);
    },
    showDetail: async (req, res) => {
        const result = await Product.findOne({
            include: [Product.USER_ALIAS],
            where: {
                id: Number(req.params.id),
            },
        });

        const product = result.toJSON();
        product.user = product.user.email; // owerwrite sensitive data with email

        res.json(product);
    },
};

module.exports = productController;
