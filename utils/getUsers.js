const fs = require("fs");
const path = require("path");

function getUsers() {
    const dbJson = fs.readFileSync(
        path.resolve(__dirname, "../data/usersDataBase.json"),
        {
            encoding: "utf-8",
        }
    );
    return JSON.parse(dbJson);
}

module.exports = getUsers;
