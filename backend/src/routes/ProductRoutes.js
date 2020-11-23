const express = require('express');
const ProductController = require('../controllers/ProductController');
const ProductValidation = require('../middlewares/ProductValidation');
const router = express.Router();

router.post('/',ProductValidation,ProductController.create);
router.put('/:id',ProductValidation,ProductController.update);
router.get('/all',ProductController.all);
router.get('/count/:count',ProductController.count);

module.exports = router;