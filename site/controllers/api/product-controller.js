const { Product, ProductCategory } = require("../../database/models");

const productController = {
    count: async (req, res) => {
        const response = await Product.count();
        const count = {
            count: response,
        };
        res.send(count);
    },
    totalPrice: async (req, res) => {
        const response = await Product.findAll();
        const totalPriceValue = response.reduce((acc, prod) => {
            return acc + prod.price;
        }, 0);

        const totalPrice = {
            totalPriceValue,
        };

        res.send(totalPrice);
    },
    list: async (req, res) => {
        const page = req.query.page ? req.query.page : 0;

        const count = await Product.count();

        // const categoriesResponse = await ProductCategory.findAll({
        //     include: [ProductCategory.PRODUCTS_LIST_ALIAS],
        // });

        // const categoriesResponseJSON = JSON.parse(
        //     JSON.stringify(categoriesResponse)
        // );

        // let categories = [];

        // categoriesResponseJSON.map((category) => {
        //     categories.push({
        //         name: category.name,
        //         products: category.products.length,
        //     });
        // });

        const response = await Product.findAll({
            include: [Product.CATEGORY_ALIAS],
            offset: page * 10,
            limit: 10,
        });

        const responseJSON = JSON.parse(JSON.stringify(response));

        let products = [];

        responseJSON.map((product) => {
            products.push({
                id: product.id,
                name: product.name,
                description: product.description,
                image: `/images/products/${product.image}`,
                category: product.category.name,
                price: product.price,
                stock: product.stock,
                url: `${req.originalUrl}/${product.id}`,
            });
        });

        const apiResponse = {
            meta: {
                status: 200,
                count: count,
                url: req.originalUrl,
            },
            data: {
                products,
                // categories,
            },
        };
        res.json(apiResponse);
    },
    detail: async (req, res) => {
        const response = await Product.findByPk(req.params.id, {
            include: [Product.USER_ALIAS],
        });

        const responseJSON = response.toJSON();

        const product = {
            id: responseJSON.id,
            name: responseJSON.name,
            price: responseJSON.price,
            description: responseJSON.description,
            image: `/images/products/${responseJSON.image}`,
            stock: responseJSON.stock,
            url: `${req.originalUrl}/${responseJSON.id}`,
            user: responseJSON.user.email,
        };

        res.json(product);
    },
    last: async (req, res) => {
        const response = await Product.findAll({
            limit: 1,
            order: [["createdAt", "DESC"]],
        });

        const responseJSON = JSON.parse(JSON.stringify(response));

        const url = req.originalUrl;

        responseJSON[0].url = url;

        res.send(responseJSON[0]);
    },
    categories: async (req, res) => {
        const categoriesResponse = await ProductCategory.findAll({
            include: [ProductCategory.PRODUCTS_LIST_ALIAS],
        });

        const categoriesResponseJSON = JSON.parse(
            JSON.stringify(categoriesResponse)
        );

        res.send(categoriesResponseJSON);
    },
};

module.exports = productController;
