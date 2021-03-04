const getLastId = function (elements) {
    if (elements == "") {
        return 1;
    }
    return elements[elements.length - 1].id + 1;
};

module.exports = getLastId;
