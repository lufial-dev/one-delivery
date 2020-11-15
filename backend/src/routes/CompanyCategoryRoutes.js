const express = require('express');
const CompanyCategoryController = require('../controllers/CompanyCategoryController');
const CompanyCategoryValidation = require('../middlewares/CompanyCategoryValidation');


const router = express.Router();
const multer = require('multer');

const storage = multer.diskStorage({
    destination : function(req, file, cb){
        cb(null,'uploads/companycategory/icons');
    },
    filename : function(req, file, cb){
        cb(null, Date.now() + "-" + file.originalname);
    },
});

const fileFilter = (res, file, cb)=>{
    if(file.mimetype === 'image/svg'|| file.mimetype === 'image/svg+xml'){
        cb(null, true);
    }else{
        cb(null, false);
    }
}



const upload = multer({  storage : storage, fileFilter : fileFilter});




router.post('/', upload.single('icon'), CompanyCategoryValidation, CompanyCategoryController.create);
router.put('/:id', upload.single('icon'), CompanyCategoryValidation, CompanyCategoryController.update);
router.get('/all', CompanyCategoryController.all);

module.exports = router;