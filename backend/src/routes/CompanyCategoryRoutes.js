const express = require('express');

const router = express.Router();

const CompanyCategoryController = require('../controllers/CompanyCategoryController');
const CompanyCategoryValidation = require('../middlewares/CompanyCategoryValidation');
const CompanyCategory = require('../models/CompanyCategory');

router.post('/', CompanyCategoryValidation, CompanyCategoryController.create);
router.put('/:id', CompanyCategoryValidation, CompanyCategoryController.update);
router.get('/all', CompanyCategoryController.all);

module.exports = router;