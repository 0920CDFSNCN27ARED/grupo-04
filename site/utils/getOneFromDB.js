const getFromDB = require("./getFromDB");

const getOneFromDB = function (id, filenameDB) {
    const elements = getFromDB(filenameDB);
    const element = elements.find((element) => {
        return element.id == id;
    });
    return element;
};

module.exports = getOneFromDB;
