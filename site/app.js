//REQUIRE
const express = require("express");
const path = require("path");
const fs = require("fs");
const methodOverride = require("method-override");
const session = require("express-session");
const cookieParser = require("cookie-parser");

const indexRouter = require("./routes/index");
const registerRouter = require("./routes/auth-router");
const productRouter = require("./routes/product");
const apiProductRouter = require("./routes/api/product");

const logMiddleware = require("./middlewares/logMiddleware");
const authRouter = require("./routes/auth-router");
const authenticate = require("./middlewares/auth/authenticate");
const getProducts = require("./utils/getProducts");
const rememberMe = require("./middlewares/auth/remember-me");
const toThousand = require("./utils/toThousand");

// APP CONFIG
const app = express();

// VIEW ENGINE CONFIG
app.set("view engine", "ejs");
app.set("views", path.join(__dirname, "views"));
app.listen(3000, () => {
    console.log("Servidor funcionando");
});

// MIDDLEWARES
app.use(express.static(path.resolve(__dirname, "public")));
app.use(cookieParser());
app.use(session({ secret: "secreto !" }));
app.use(methodOverride("_method"));
app.use(express.urlencoded());
app.use(express.json());
app.use(logMiddleware);

app.locals.user = null;
app.locals.toThousand = toThousand;

app.use(rememberMe);
app.use(authenticate);

// ROUTES
app.use("/", indexRouter);
app.use("/product", productRouter);
app.use("/auth", authRouter);
app.use("/api/product", apiProductRouter);

app.use((req, res, next) => {
    res.status(404).render("not-found");
});
