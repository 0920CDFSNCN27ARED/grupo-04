//REQUIRE
const express = require("express");
const path = require("path");
const methodOverride = require("method-override");
const session = require("express-session");
const cookieParser = require("cookie-parser");

const indexRouter = require("./routes/index");
const registerRouter = require("./routes/auth-router");
const productRouter = require("./routes/product");
const apiProductsRouter = require("./routes/api/products");
const apiUsersRouter = require("./routes/api/users");

const logMiddleware = require("./middlewares/logMiddleware");
const authRouter = require("./routes/auth-router");
const authenticate = require("./middlewares/auth/authenticate");
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
app.use((req, res, next) => {
    res.header("Access-Control-Allow-Origin", "*");
    res.header(
        "Access-Control-Allow-Headers",
        "Authorization, X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Allow-Request-Method"
    );
    res.header(
        "Access-Control-Allow-Methods",
        "GET, POST, OPTIONS, PUT, DELETE"
    );
    res.header("Allow", "GET, POST, OPTIONS, PUT, DELETE");
    next();
});

// ROUTES
app.use("/", indexRouter);
app.use("/product", productRouter);
app.use("/auth", authRouter);
app.use("/api/products", apiProductsRouter);
app.use("/api/users", apiUsersRouter);

app.use((req, res, next) => {
    res.status(404).render("not-found");
});
