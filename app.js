const express = require("express");
const app = express();
const path = require("path");

app.use(express.static(path.resolve(__dirname, "public")));

app.listen(3000, () => {
    console.log("Servidor funcionando");
});

app.set("view engine", "ejs");
app.set("views", __dirname + "/views");

app.get("/", (req, res) => {
    res.render("index");
});

app.get("/register", (req, res) => {
    res.render("register");
});

app.get("/login", (req, res) => {
    res.render("login");
});

app.get("/productDetail", (req, res) => {
    res.render("productDetail");
});

app.get("/productCart", (req, res) => {
    res.render("productCart");
});
