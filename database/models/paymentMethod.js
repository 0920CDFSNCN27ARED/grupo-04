module.exports = (sequelize, DataTypes) => {
    const alias = "PaymentMethod";
    const cols = {
        id: {
            primaryKey: true,
            autoIncrement: true,
            type: DataTypes.INTEGER.UNSIGNED,
        },
        name: DataTypes.STRING(20),
    };

    const config = {
        tableName: "paymentMethods",
        timestamps: false,
    };

    const PaymentMethod = sequelize.define(alias, cols, config);

    PaymentMethod.ORDERS_LIST_ALIAS = "orders";

    PaymentMethod.associate = (models) => {
        PaymentMethod.hasMany(models.Order, {
            as: PaymentMethod.ORDERS_LIST_ALIAS,
            foreignKey: "paymentMethodId",
        });
    };

    return PaymentMethod;
};
