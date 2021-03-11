const { User } = require("../../database/models");

async function authenticate(req, res, next) {
    const id = req.session.loggedUserId;

    if (!id) return next();

    const loggedUser = await User.findByPk(id);

    if (!loggedUser) {
        delete req.session.loggedUserId;
        return next();
    }

    res.locals.user = loggedUser.toJSON();

    next();
}

module.exports = authenticate;
