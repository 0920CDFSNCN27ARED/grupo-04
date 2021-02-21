module.exports = (sequelize, DataTypes) => {
    const alias = "Product";

    const cols = {
        id: {
            primaryKey: true,
            autoIncrement: true,
            type: DataTypes.INTEGER.UNSIGNED,
        },
        name: DataTypes.STRING(50),
        price: DataTypes.INTEGER.UNSIGNED,
        description: DataTypes.STRING(1500),
        image: DataTypes.STRING(50),
        stock: DataTypes.INTEGER.UNSIGNED,
        isBanned: DataTypes.INTEGER.UNSIGNED,
        categoryId: DataTypes.INTEGER.UNSIGNED,
        userId: DataTypes.INTEGER.UNSIGNED,
    };

    const config = {
        tableName: "products",
    };

    const Product = sequelize.define(alias, cols, config);

    Product.USER_ALIAS = "user";
    Product.CATEGORY_ALIAS = "category";
    Product.ORDERS_ALIAS = "orders";

    Product.associate = function (models) {
        Product.belongsTo(models.User, {
            as: Product.USER_ALIAS,
            foreingKey: "userId",
        });
        Product.belongsTo(models.ProductCategory, {
            as: Product.CATEGORY_ALIAS,
            foreingKey: "categoryId",
        });
        Product.belongsToMany(models.Order, {
            as: Product.ORDERS_ALIAS,
            through: "order_product",
            foreingKey: "productId",
            // otherKey: "orderId",
            timestamps: false,
        });
    };

    return Product;
};
