module.exports = (sequelize, DataTypes) => {
    const alias = "Order";
    const cols = {
        id: {
            primaryKey: true,
            autoIncrement: true,
            type: DataTypes.INTEGER.UNSIGNED,
        },
        orderStatusId: DataTypes.INTEGER.UNSIGNED,
        userId: DataTypes.INTEGER.UNSIGNED,
        paymentMethodId: DataTypes.INTEGER.UNSIGNED,
    };
    const config = {
        tableName: "orders",
    };

    const Order = sequelize.define(alias, cols, config);

    return Order;
};
