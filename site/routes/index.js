const express = require("express");
const router = express.Router();
const indexController = require("../controllers/index-controller");

router.get("/", indexController.show);
router.get("/search", indexController.search);

//
// TEST de modelos
//
// router.get("/users", indexController.users);
// router.get("/user-categories", indexController.userCategories);
// router.get("/products", indexController.products);
// router.get("/product-categories", indexController.productCategories);
// router.get("/orders", indexController.orders);
// router.get("/order-statuses", indexController.orderStatuses);
// router.get("/payment-methods", indexController.paymentMethods);
//
//
//

router.get("/pruebaSession", function (req, res) {
    if (req.session.numeroVisitas == undefined) {
        req.session.numeroVisitas = 0;
    }
    req.session.numeroVisitas++;

    res.send("Session tiene el número:" + req.session.numeroVisitas);
});

module.exports = router;
