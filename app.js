const express = require("express");
const app = express();
const path = require("path");
const fs = require("fs");
const methodOverride = require("method-override");
const session = require("express-session");

app.use(express.static(path.resolve(__dirname, "public")));

app.listen(3000, () => {
    console.log("Servidor funcionando");
});

app.set("view engine", "ejs");
app.set("views", __dirname + "/views");

app.use(methodOverride("_method"));

app.use(express.urlencoded({ extended: false }));

app.use(express.json());

// getProducts = () => {
//     const dbJson = fs.readFileSync(
//         path.resolve(__dirname, "data/productsDataBase.json"),
//         { encoding: "utf-8" }
//     );
//     return JSON.parse(dbJson);
// };

const indexRouter = require("./routes/index");
const registerRouter = require("./routes/auth-router");
const loginRouter = require("./routes/login");
const productRouter = require("./routes/product");
const logMiddleware = require("./middlewares/logMiddleware");
const authRouter = require("./routes/auth-router");

app.use(logMiddleware);

app.use(session({ secret: "secreto !" }));

app.use("/", indexRouter);

//app.use("/register", router);

//app.use("/login", loginRouter);

app.use("/product", productRouter);

app.use("/auth", authRouter);

app.use((req, res, next) => {
    res.status(404).render("not-found");
    // next();
});
