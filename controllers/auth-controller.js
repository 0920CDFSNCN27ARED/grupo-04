const bcrypt = require("bcrypt");
const { User } = require("../database/models");

module.exports = {
    showLogin: (req, res) => {
        if (req.session.loggedUserId) {
            return res.redirect("/");
        }
        res.render("login");
    },
    login: async (req, res) => {
        const user = await User.findOne({
            where: { email: req.body.email },
        });

        if (!user) return res.redirect("/auth/login");

        if (!bcrypt.compare(req.body.password, user.password)) {
            return res.redirect("/auth/login");
        }

        req.session.loggedUserId = user.toJSON().id;

        if (req.body.rememberMe != undefined) {
            res.cookie("rememberMe", user.toJSON().id, {
                maxAge: 1000 * 60 * 60,
            });
        }

        return res.redirect("/");
    },
    showRegister: (req, res) => {
        if (req.session.loggedUserId) {
            return res.redirect("/");
        }
        res.render("register");
    },
    register: async (req, res) => {
        const emailAlreadyRegistered = await User.findOne({
            where: { email: req.body.email },
        });

        if (emailAlreadyRegistered) return res.redirect("/auth/login");

        delete req.body.password_confirm; // TODO implementar validación desde el front y back

        await User.create({
            firstName: req.body.firstName,
            lastName: req.body.lastName,
            email: req.body.email,
            password: bcrypt.hashSync(req.body.password, 10),
            city: req.body.city,
            state: req.body.state,
            street: req.body.street,
            houseNumber: req.body.houseNumber,
            floor: req.body.floor,
            apartment: req.body.apartment,
            phoneNumber: req.body.phoneNumber,
            avatar: req.file.filename,
        });

        res.redirect("/auth/login");
    },
    logOut: (req, res) => {
        // TODO implementar estas mejoras en logOut
        req.session.loggedUserId = null;
        //req.session.destroy();
        res.cookie("rememberMe", null);
        //res.clearCookie("rememberMe");
        res.redirect("/");
    },
};
