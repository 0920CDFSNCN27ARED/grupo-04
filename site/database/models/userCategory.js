module.exports = (sequelize, DataTypes) => {
    const alias = "UserCategory";
    const cols = {
        id: {
            primaryKey: true,
            autoIncrement: true,
            type: DataTypes.INTEGER.UNSIGNED,
        },
        name: DataTypes.STRING(20),
    };

    const config = {
        tableName: "userCategories",
        timestamps: false,
    };

    const UserCategory = sequelize.define(alias, cols, config);
    UserCategory.USERS_LIST_ALIAS = "users";

    UserCategory.associate = function (models) {
        UserCategory.hasMany(models.User, {
            as: UserCategory.USERS_LIST_ALIAS,
            foreignKey: "categoryId",
        });
    };

    return UserCategory;
};
