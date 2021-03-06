const fs = require("fs");
const path = require("path");

function getProducts() {
    const dbJson = fs.readFileSync(
        path.resolve(__dirname, "../data/productsDataBase.json"),
        {
            encoding: "utf-8",
        }
    );
    return JSON.parse(dbJson);
}

module.exports = getProducts;
