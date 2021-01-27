const getUsers = require("../utils/getUsers");
const saveUsers = require("../utils/saveUsers");
const bcrypt = require("bcrypt");

module.exports = {
    login: (req, res) => {
        const users = getUsers();
        const user = users.find((user) => {
            return (
                user.user == req.body.user &&
                bcrypt.compareSync(req.body.password, user.password)
            );
        });
        if (!user) return res.redirect("/auth/login");

        req.session.loggedUserId = user.id;

        if (req.body.rememberMe != undefined) {
            res.cookie("rememberMe", user.id, {
                maxAge: 1000 * 60 * 60,
            });
        }

        return res.redirect("/");
    },

    register: (req, res) => {
        const users = getUsers();

        const lastUserIndex = users.length - 1;
        const lastUser = users[lastUserIndex];
        const newId = lastUser ? lastUser.id + 1 : 1;

        delete req.body.password_confirm;

        const newUser = {
            id: newId,
            ...req.body,
            password: bcrypt.hashSync(req.body.password, 10),
            avatar: req.file.filename,
        };

        //res.send(newUser);

        users.push(newUser);

        saveUsers(users);

        res.redirect("login");
    },

    showLogin: (req, res) => {
        res.render("login");
    },
    showRegister: (req, res) => {
        res.render("register");
    },
    logOut: (req, res) => {
        req.session.loggedUserId = null;
        res.cookie("rememberMe", null);
        res.redirect("/");
    },
};
