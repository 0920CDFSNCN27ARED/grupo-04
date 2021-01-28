const getFromDB = require("../../utils/getFromDB");

function rememberMe(req, res, next) {
    const rememberMe = req.cookies.rememberMe;
    const loggedUser = req.session.loggedUserId;

    if (!rememberMe) {
        return next();
    }

    if (loggedUser) {
        return next();
    }

    const users = getFromDB("usersDataBase");
    const userToLogin = users.find((user) => user.id == req.cookies.rememberMe);

    if (userToLogin) {
        req.session.loggedUserId = userToLogin.id;
    }
    next();
}

module.exports = rememberMe;
