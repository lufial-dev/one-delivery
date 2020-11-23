const Product = require("../models/Product");

const ProductValidation = async (req, res, next) => {
    const { name, description, value,images} = req.body;

    if(!name)
        return res.status(400).json({error : "O campo nome é obrigatório"});
    if(!description)
        return res.status(400).json({error : "O campo descrição é obrigatório"});
    if(!value)
        return res.status(400).json({error : "O campo valor é obrigatório"});
    if(!images)
        return res.status(400).json({error : "O campo imagens é obrigatório"});
    else
        next();

}

module.exports = ProductValidation;