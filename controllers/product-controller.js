const productController = {
    create: (req, res) => {
        res.send("Crear un producto");
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

        res.render("productDetail", { product: productDetail });
    },
    showCart: (req, res) => {
        res.render("productCart");
    },
};

module.exports = productController;
