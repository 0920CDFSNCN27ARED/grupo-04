const fs = require("fs");
const path = require("path");

/**
 *
 * @param {string} filenameDB
 */

const getFromDB = function (filenameDB) {
    const elementsJSON = fs.readFileSync(
        path.join(__dirname, `../data/${filenameDB}.json`),
        {
            encoding: "utf-8",
        }
    );

    let elements;

    if (elementsJSON == "") {
        return (elements = []);
    } else {
        return (elements = JSON.parse(elementsJSON));
    }
};

module.exports = getFromDB;
