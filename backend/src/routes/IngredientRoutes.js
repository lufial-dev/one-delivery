const express = require('express');
const IngredientController = require('../controllers/IngredientController');
const IngredientValidation = require('../middlewares/IngredientValidation');
const router = express.Router();

router.post('/', IngredientValidation, IngredientController.create);
router.put('/:id', IngredientValidation, IngredientController.update);
router.get('/id/:id', IngredientController.findById);

module.exports = router;