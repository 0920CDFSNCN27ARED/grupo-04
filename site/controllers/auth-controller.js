const bcrypt = require("bcrypt");
const { User } = require("../database/models");
const { validationResult } = require("express-validator");

module.exports = {
    showLogin: (req, res) => {
        if (req.session.loggedUserId) {
            return res.redirect("/");
        }
        
        const returnUrl = req.query.returnUrl;

        res.render("login", {returnUrl});
    },
    login: async (req, res) => {        

        const returnUrl = req.query.returnUrl;

        const validation = validationResult(req);
        const errors = validation.errors;

        if (errors.length > 0) {
            return res.redirect("/auth/login?validation=false");
        }

        const user = await User.findOne({
            where: { email: req.body.email },
        });

        if (!user) return res.redirect("/auth/login?user=false");

        if (!(await bcrypt.compare(req.body.password, user.password))) {
            return res.redirect("/auth/login?password=false");
        }

        req.session.loggedUserId = user.toJSON().id;

        if (req.body.rememberMe != undefined) {
            res.cookie("rememberMe", user.toJSON().id, {
                maxAge: 1000 * 60 * 60,
            });
        }

        if (returnUrl) {
            return res.redirect(returnUrl);
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
        const validation = validationResult(req); 

        const errors = validation.errors;

        // console.log(errors)

        // for (const error of errors) {
        //     console.log(error.msg)
        // }

        if (errors.length > 0) {
            return res.redirect("/auth/register?validation=false");
        }

        const emailAlreadyRegistered = await User.findOne({
            where: { email: req.body.email },
        });

        if (emailAlreadyRegistered) return res.redirect("/auth/login?emailAlreadyRegistered=true");

        delete req.body.password_confirm; // TODO implementar validación desde el front y back

        if (req.file) {
            userAvatar = req.file.filename
        } else {
            userAvatar = "no-image.png"
        }

        const newUser = await User.create({
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
            avatar: userAvatar,
        });

        req.session.loggedUserId = newUser.id;        

        res.redirect("/");
    },
    logOut: (req, res) => {
        req.session.destroy();
        res.clearCookie("rememberMe");
        res.redirect("/");
    },
};
