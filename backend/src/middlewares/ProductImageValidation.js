const ProductImage = require("../models/ProductImage");



const ProductImageValidation = async (req, res, next) => {
    const image  = req.file;

    if(!image)
        return res.status(400).json({ error : "O campo imagem é obrigatório"});
   else{
        next();
    }
        
}

module.exports = ProductImageValidation;