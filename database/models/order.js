module.exports = (sequelize, DataTypes) => {
    const alias = "Order";
    const cols = {
        id: {
            primaryKey: true,
            autoIncrement: true,
            type: DataTypes.INTEGER.UNSIGNED,
        },
        statusId: DataTypes.INTEGER.UNSIGNED,
        userId: DataTypes.INTEGER.UNSIGNED,
        paymentMethodId: DataTypes.INTEGER.UNSIGNED,
    };
    const config = {
        tableName: "orders",
    };

    const Order = sequelize.define(alias, cols, config);

    Order.STATUS_ALIAS = "orderStatus";
    Order.USER_ALIAS = "user";
    Order.PAYMENT_METHOD_ALIAS = "paymentMethod";

    Order.associate = (models) => {
        Order.belongsTo(models.OrderStatus, {
            as: Order.STATUS_ALIAS,
            foreignKey: "statusId",
        });
        Order.belongsTo(models.User, {
            as: Order.USER_ALIAS,
            foreignKey: "userId",
        });
        Order.belongsTo(models.PaymentMethod, {
            as: Order.PAYMENT_METHOD_ALIAS,
            foreignKey: "paymentMethodId",
        });
    };

    return Order;
};
