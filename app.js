const express = require("express");
const app = express();
const path = require("path");
const fs = require("fs");

app.use(express.static(path.resolve(__dirname, "public")));

app.listen(3000, () => {
    console.log("Servidor funcionando");
});

app.set("view engine", "ejs");
app.set("views", __dirname + "/views");

app.use(express.urlencoded({ extended: false }));
app.use(express.json());

getProducts = () => {
    const dbJson = fs.readFileSync(
        path.resolve(__dirname, "data/productsDataBase.json"),
        { encoding: "utf-8" }
    );
    return JSON.parse(dbJson);
};

const indexRouter = require("./routes/index");
const registerRouter = require("./routes/register");
const loginRouter = require("./routes/login");
const productDetailController = require("./routes/product-detail");
const productCartController = require("./routes/product-cart");

app.use("/", indexRouter);

app.use("/register", registerRouter);

app.use("/login", loginRouter);

app.use("/productDetail", productDetailController);

app.use("/productCart", productCartController);
