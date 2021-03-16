const express = require("express");
const router = express.Router();
const usersAPIController = require("../../controllers/api/users-controller");

router.get("/count", usersAPIController.count);
router.get("/list", usersAPIController.list);
router.get("/list/:id", usersAPIController.detail);

module.exports = router;
