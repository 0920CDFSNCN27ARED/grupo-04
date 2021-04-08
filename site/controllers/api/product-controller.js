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
        const count = await Product.count();

        const page = req.query.page ? Number(req.query.page) : 1; // 6
        const limit = 10;
        const offset = page > 1 ? (page - 1) * limit : 0; // 50

        const response = await Product.findAll({
            include: [Product.CATEGORY_ALIAS],
            offset: offset,
            limit: limit,
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

        const lastPage = Math.floor((count + limit) / limit);

        const previousPage =
            page > 1 ? `${req.baseUrl + req.path}?page=${page - 1}` : "";

        const nextPage =
            page * limit > count // 60 > 52
                ? ""
                : `${req.baseUrl + req.path}?page=${page + 1}`;

        const apiResponse = {
            meta: {
                status: 200,
                count: count,
                url: req.originalUrl,
                lastPage: lastPage,
                currentPage: page,
                previousPage: previousPage,
                nextPage: nextPage,
            },
            data: {
                products,
                // categories,
            },
        };
        res.json(apiResponse);

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
