const express = require('express');
const CompanyController = require('../controllers/CompanyController');
const CompanyValidation = require('../middlewares/CompanyValidation');
const router = express.Router();

router.post('/',CompanyValidation,CompanyController.create);
router.put('/:id',CompanyValidation,CompanyController.update);

module.exports = router;