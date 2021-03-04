const getFromDB = require("./getFromDB");
const fs = require("fs");
const path = require("path");

const deleteFromDB = function (id, filenameDB) {
    const elements = getFromDB(filenameDB);

    const element = elements.find((element) => {
        return element.id == id;
    });

    let deleted;

    if (!element) {
        return (deleted = false);
    }

    elements.splice(elements.indexOf(element), 1);

    fs.writeFileSync(
        path.join(__dirname, `../data/${filenameDB}.json`),
        JSON.stringify(elements, null, 4)
    );

    return (deleted = true);
};

module.exports = deleteFromDB;
