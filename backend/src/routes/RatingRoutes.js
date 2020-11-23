const express = require('express');
const RatingController = require('../controllers/RatingController');
const RatingValidation = require('../middlewares/RatingValidation');
const router = express.Router();

router.post('/',RatingValidation,RatingController.create);
router.put('/:id',RatingValidation,RatingController.update);
router.get('/all',RatingController.all);

module.exports = router;