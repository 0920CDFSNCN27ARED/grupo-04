const getUsers = require("../utils/getUsers");
const saveUsers = require("../utils/saveUsers");
const bcrypt = require("bcrypt");

module.exports = {
    login: () => {},
    register: (req, res) => {
        const users = getUsers();

        const lastUserIndex = users.length - 1;
        const lastUser = users[lastUserIndex];
        const newId = lastUser ? lastUser.id + 1 : 1;

        delete req.body.password_confirm;

        const newUser = {
            id: newId,
            ...req.body,
            pass: bcrypt.hashSync(req.body.password, 10),
            //avatar: req.file.filename,
        };

        res.send(newUser);

        //users.push(newUser);

        //saveUsers(users);

        // res.redirect("auth/login");
    },

    showLogin: (req, res) => {
        res.render("login");
    },
    showRegister: (req, res) => {
        res.render("register");
    },
};
