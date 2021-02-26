const { Product } = require("../../database/models");

const productController = {
    showAll: async (req, res) => {
        const page = req.query.page ? req.query.page : 0;
        const products = await Product.findAll({
            offset: page * 10,
            limit: 10,
        });
        const count = await Product.count();
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
                count: count,
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
