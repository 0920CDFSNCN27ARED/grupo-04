const { User } = require("../../database/models");

async function rememberMe(req, res, next) {
    const rememberMe = req.cookies.rememberMe;
    const loggedUser = req.session.loggedUserId;

    if (!rememberMe) {
        return next();
    }

    if (loggedUser) {
        return next();
    }

    // const users = getFromDB("usersDataBase");
    // const userToLogin = users.find((user) => user.id == req.cookies.rememberMe);

    const userToLogin = await User.findOne({
        where: { id: req.cookies.rememberMe },
    });

    if (userToLogin) {
        req.session.loggedUserId = userToLogin.toJSON().id;
    }
    next();
}

module.exports = rememberMe;
