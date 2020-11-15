const express = require('express');
const ClientController = require('../controllers/ClientController');
const ClientValidation = require('../middlewares/ClientValidation');
const router = express.Router();

router.post('/', ClientValidation, ClientController.create);
router.put('/:id', ClientValidation, ClientController.update);
router.get('/id/:id', ClientController.findById);
router.get('/phone/:phone', ClientController.findByPhone);

module.exports = router;