const express = require('express');
const ProductImageController = require('../controllers/ProductImageController');
const ProductImageValidation = require('../middlewares/ProductImageValidation');


const router = express.Router();
const multer = require('multer');

const storage = multer.diskStorage({
    destination : function(req, file, cb){
        cb(null,'uploads/product/images');
    },
    filename : function(req, file, cb){
        cb(null, Date.now() + "-" + file.originalname);
    },
});

const fileFilter = (res, file, cb)=>{
    if(file.mimetype === 'image/png'|| file.mimetype === 'image/jpg'|| file.mimetype === 'image/jpeg'){
        cb(null, true);
    }else{
        cb(null, false);
    }
}



const upload = multer({  storage : storage, fileFilter : fileFilter});




router.post('/', upload.single('image'),ProductImageValidation,ProductImageController.create);
router.put('/:id', upload.single('image'),ProductImageValidation,ProductImageController.update);
router.get('/id/:id',ProductImageController.findById);

module.exports = router;