const getFromDB = require("../../utils/getFromDB");

function rememberMe(req, res, next) {
    const rememberMe = req.cookies.rememberMe;
    const loggedUser = req.session.loggedUserId;

    if (!rememberMe) {
        console.log("no hay cookie remember me");
        return next();
    }

    if (loggedUser) {
        console.log("el usuario ya está logueado");
        return next();
    }

    const users = getFromDB("usersDB");
    const userToLogin = users.find((user) => user.id == req.cookies.rememberMe);

    if (userToLogin) {
        req.session.loggedUserId = userToLogin.id;
        console.log("se cargó la cookie en la session");
    }
    next();
}

module.exports = rememberMe;
