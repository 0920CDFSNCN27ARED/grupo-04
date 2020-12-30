const getUsers = require("../utils/getUsers");

module.exports = {
    login: () => {},
    register: (req, res) => {
        const users = getUsers();

        console.log(req.body);
        return;

        const newUser = {};

        users.push(newUser);

        saveUsers(users);
    },

    showLogin: (req, res) => {
        res.render("login");
    },
    showRegister: (req, res) => {
        res.render("register");
    },
};
