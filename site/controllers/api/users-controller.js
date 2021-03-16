const { User } = require("../../database/models");

const usersController = {
    count: async (req, res) => {
        const response = await User.count();
        const count = {
            count: response,
        };
        res.send(count);
    },
    list: async (req, res) => {
        const responseCount = await User.count();
        const responseAll = await User.findAll();
        const responseJSON = JSON.parse(JSON.stringify(responseAll));
        let users = [];
        responseJSON.map((user) => {
            users.push({
                id: user.id,
                name: `${user.firstName} ${user.lastName}`,
                email: user.email,
                detail: `${req.originalUrl}/${user.id}`,
            });
        });

        const apiResponse = {
            meta: {
                count: responseCount,
            },
            data: { users },
        };

        return res.send(apiResponse);
    },
    detail: async (req, res) => {
        const response = await User.findByPk(req.params.id);
        const responseJSON = response.toJSON();
        const user = {
            id: responseJSON.id,
            name: `${responseJSON.firstName} ${responseJSON.lastName}`,
            email: responseJSON.email,
            avatar: `/profile_pics/${response.avatar}`,
            detail: req.originalUrl,
        };
        res.send(user);
    },
};

module.exports = usersController;
