module.exports = (sequelize, DataTypes) => {
    const alias = "OrderStatus";
    const cols = {
        id: {
            primaryKey: true,
            autoIncrement: true,
            type: DataTypes.INTEGER.UNSIGNED,
        },
        name: DataTypes.STRING(20),
    };
    const config = {
        tableName: "orderStatuses",
        timestamps: false,
    };

    const OrderStatus = sequelize.define(alias, cols, config);

    OrderStatus.ORDERS_LIST_ALIAS = "orders";

    OrderStatus.associate = (models) => {
        OrderStatus.hasMany(models.Order, {
            as: OrderStatus.ORDERS_LIST_ALIAS,
            foreignKey: "statusId",
        });
    };

    return OrderStatus;
};
