module.exports = (sequelize, DataTypes) => {
    const alias = "User";

    const cols = {
        id: {
            primaryKey: true,
            autoIncrement: true,
            type: DataTypes.INTEGER.UNSIGNED,
        },
        firstName: DataTypes.STRING(40),
        lastName: DataTypes.STRING(40),
        email: DataTypes.STRING(50),
        password: DataTypes.STRING(40),
        city: DataTypes.STRING(50),
        state: DataTypes.STRING(30),
        street: DataTypes.STRING(50),
        houseNumber: DataTypes.INTEGER.UNSIGNED,
        floor: DataTypes.STRING(2),
        apartment: DataTypes.STRING(3),
        phoneNumber: DataTypes.STRING(20),
        avatar: DataTypes.STRING(50),
        categoryId: DataTypes.INTEGER.UNSIGNED,
        isBanned: DataTypes.INTEGER.UNSIGNED,
    };

    const config = {
        tableName: "users",
    };

    const User = sequelize.define(alias, cols, config);

    User.CATEGORY_ALIAS = "category";
    User.PRODUCTS_ALIAS = "products";
    User.ORDERS_LIST_ALIAS = "orders";

    User.associate = function (models) {
        User.belongsTo(models.UserCategory, {
            as: User.CATEGORY_ALIAS,
            foreingKey: "categoryId",
        });
        User.hasMany(models.Product, {
            as: User.PRODUCTS_ALIAS,
            foreingKey: "userId",
        });
        User.hasMany(models.Order, {
            as: User.ORDERS_LIST_ALIAS,
            foreignKey: "userId",
        });
    };

    return User;
};
