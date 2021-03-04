module.exports = (sequelize, DataTypes) => {
    const alias = "OrderProduct";

    const cols = {
        id: {
            primaryKey: true,
            autoIncrement: true,
            type: DataTypes.INTEGER.UNSIGNED,
        },
        orderId: DataTypes.INTEGER.UNSIGNED,
        productId: DataTypes.INTEGER.UNSIGNED,
        itemPrice: DataTypes.INTEGER.UNSIGNED,
        quantity: DataTypes.INTEGER.UNSIGNED,
    };

    const config = {
        tableName: "order_product",
    };

    const OrderProduct = sequelize.define(alias, cols, config);

    return OrderProduct;
};
