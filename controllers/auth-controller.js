const getUsers = require("../utils/getUsers");
const saveUsers = require("../utils/saveUsers");
const bcrypt = require("bcrypt");

const { User } = require("../database/models");

module.exports = {
    showLogin: (req, res) => {
        res.render("login");
    },
    login: async (req, res) => {
        // const users = getUsers();
        const users = await User.findAll();

        // return res.send(users);

        const user = users.find((user) => {
            return (
                user.email == req.body.email &&
                req.body.password == user.password
                // TO DO al registrar un usuario con bcrypt, volver a implementarlo acá
                // bcrypt.compareSync(req.body.password, user.password)
            );
        });
        if (!user) return res.redirect("/auth/login");

        req.session.loggedUserId = user.id; // TO DO no carga correctamente el usuario como variable locals

        if (req.body.rememberMe != undefined) {
            res.cookie("rememberMe", user.id, {
                maxAge: 1000 * 60 * 60,
            });
        }

        return res.redirect("/");
    },
    showRegister: (req, res) => {
        res.render("register");
    },
    register: async (req, res) => {
        // const users = getUsers();
        const users = await User.findAll();

        // const lastUserIndex = users.length - 1;
        // const lastUser = users[lastUserIndex];
        // const newId = lastUser ? lastUser.id + 1 : 1;

        delete req.body.password_confirm; // TODO implementar validación desde el front y back

        // const newUser = {
        //     id: newId,
        //     ...req.body,
        //     password: bcrypt.hashSync(req.body.password, 10),
        //     avatar: req.file.filename,
        // };

        const user = users.find((user) => {
            return user.email == req.body.email;
        });
        if (user) return res.redirect("/auth/login");

        await User.create({
            firstName: req.body.firstName,
            lastName: req.body.lastName,
            email: req.body.email,
            password: req.body.password,
            // password: bcrypt.hashSync(req.body.password, 10),
            city: req.body.city,
            state: req.body.state,
            street: req.body.street,
            houseNumber: req.body.houseNumber,
            floor: req.body.floor,
            apartment: req.body.apartment,
            phoneNumber: req.body.phoneNumber,
            avatar: req.body.avatar,
            userCategoryId: 2, // TO DO modificar DB para que tenga valor default customer
            isBanned: 0, // TO DO modificar DB para que tenga valor default 0
        });

        //res.send(newUser);

        // users.push(newUser);

        // saveUsers(users);

        res.redirect("/");
    },
    logOut: (req, res) => {
        req.session.loggedUserId = null;
        //req.session.destroy();
        res.cookie("rememberMe", null);
        //res.clearCookie("rememberMe");
        res.redirect("/");
    },
};
