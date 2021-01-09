const fs = require("fs");
const path = require("path");

const editInDB = function (elements, oldElement, newElement, filenameDB) {
    elements.splice(elements.indexOf(oldElement), 1, newElement);

    fs.writeFileSync(
        path.join(__dirname, `../data/${filenameDB}.json`),
        JSON.stringify(elements, null, 4)
    );
};

module.exports = editInDB;
