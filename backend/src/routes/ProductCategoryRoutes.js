const express = require('express');
const ProductCategoryController = require('../controllers/ProductCategoryController');
const ProductCategoryValidation = require('../middlewares/ProductCategoryValidation');


const router = express.Router();
const multer = require('multer');

const storage = multer.diskStorage({
    destination : function(req, file, cb){
        cb(null,'uploads/productcategory/images');
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




router.post('/', upload.single('image'),ProductCategoryValidation,ProductCategoryController.create);
router.put('/:id', upload.single('image'),ProductCategoryValidation,ProductCategoryController.update);
router.get('/find',ProductCategoryController.find);

module.exports = router;