const express = require('express');

const router = express.Router();

const CompanyCategoryController = require('../controllers/CompanyCategoryController');

router.post('/', CompanyCategoryController.create);


module.exports = router;