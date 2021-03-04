const fs = require("fs");
const path = require("path");

const saveInDB = function (elements, newElement, filenameDB) {
    elements.push(newElement);
    const elementsJSON = JSON.stringify(elements, null, 4);
    fs.writeFileSync(
        path.join(__dirname, `../data/${filenameDB}.json`),
        elementsJSON
    );
};

module.exports = saveInDB;
