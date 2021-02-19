module.exports = (sequelize, DataTypes) => {
    const alias = "ProductCategory";
    const cols = {
        id: {
            primaryKey: true,
            autoIncrement: true,
            type: DataTypes.INTEGER.UNSIGNED,
        },
        name: DataTypes.STRING(50),
    };
    const config = {
        tableName: "productCategories",
        timestamps: false,
    };
    const ProductCategory = sequelize.define(alias, cols, config);

    ProductCategory.PRODUCTS_LIST_ALIAS = "products";

    ProductCategory.associate = function (models) {
        ProductCategory.hasMany(models.Product, {
            as: ProductCategory.PRODUCTS_LIST_ALIAS,
            foreignKey: "categoryId",
        });
    };

    return ProductCategory;
};
