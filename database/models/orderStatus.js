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
    return OrderStatus;
};
