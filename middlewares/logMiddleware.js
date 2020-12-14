const fs = require("fs");

function logMiddleware(req, res, next) {
    fs.appendFileSync("log", "se ingresó en la página " + req.url);

    next();
}

module.exports = logMiddleware;
