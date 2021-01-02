//REQUIRE
const express = require("express");
const path = require("path");
const fs = require("fs");
const methodOverride = require("method-override");
const session = require("express-session");

const indexRouter = require("./routes/index");
const registerRouter = require("./routes/auth-router");
const loginRouter = require("./routes/login");
const productRouter = require("./routes/product");
const logMiddleware = require("./middlewares/logMiddleware");
const authRouter = require("./routes/auth-router");

// APP CONFIG
const app = express();

// VIEW ENGINE CONFIG
app.set("view engine", "ejs");
app.set("views", path.join(__dirname, "views"));
app.listen(3001, () => {
    console.log("Servidor funcionando");
});

// MIDDLEWARES
app.use(express.static(path.resolve(__dirname, "public")));

app.use(session({ secret: "secreto !" }));
app.use(methodOverride("_method"));
app.use(express.urlencoded({ extended: false }));
app.use(express.json());
app.use(logMiddleware);

// ROUTES
app.use("/", indexRouter);

//app.use("/register", router);

//app.use("/login", loginRouter);

app.use("/product", productRouter);

app.use("/auth", authRouter);

app.use((req, res, next) => {
    res.status(404).render("not-found");
    // next();
});
