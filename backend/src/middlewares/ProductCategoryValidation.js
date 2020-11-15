const ProductCategory = require("../models/ProductCategory");



const ProductCategoryValidation = async (req, res, next) => {
    const { name } = req.body;
    const image  = req.file;

    if(!name)
        return res.status(400).json({ error : "O campo nome é obrigatório"});
    else if(!image)
        return res.status(400).json({ error : "O campo imagem é obrigatório e precisa ser .png , .jpg ou .jpeg"});
    else{
        next();
    }
        
}

module.exports = ProductCategoryValidation;