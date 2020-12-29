module.exports = {
    login: () => {},
    register: () => {},
    showLogin: (req, res) => {
        res.render("login");
    },
    showRegister: (req, res) => {
        res.render("register");
    },
};
