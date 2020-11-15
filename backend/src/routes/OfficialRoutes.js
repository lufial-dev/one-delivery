const express = require('express');
const OfficialController = require('../controllers/OfficialController');
const OfficialValidation = require('../middlewares/OfficialValidation');
const router = express.Router();

router.post('/', OfficialValidation, OfficialController.create);
router.put('/:id', OfficialValidation, OfficialController.update);
router.get('/id/:id', OfficialController.findById);

module.exports = router;