const registerController = {
    show: (req, res) => {
        res.render("register");
    },
    newUserRegister: (req, res) => {
        res.send("USUARIO CREADO");
    },
};

module.exports = registerController;

// creat: function(req,res){res.send(req.body)}
