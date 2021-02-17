module.exports = (sequelize, DataTypes) => {
    const alias = "ProductOrder";

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
        tableName: "product_order",
    };

    const ProductOrder = sequelize.define(alias, cols, config);

    return ProductOrder;
};
