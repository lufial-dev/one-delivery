const Company = require("../models/Company");

const CompanyValidation = async (req, res, next) => {
    const { 
        name,
        image,
        cover_image,
        min_value_delivery,
        value_delivery,
        time_delivery,
        score,
        company_category

    } = req.body;

    if(!name)
        return res.status(400).json({error : "O campo descrição é obrigatório"});
    if(!image)
        return res.status(400).json({error : "O campo pontuação é obrigatório"});
    if(!cover_image)
        return res.status(400).json({error : "O campo cliente é obrigatório"});
    if(!min_value_delivery)
        return res.status(400).json({error : "O campo cliente é obrigatório"});
    if(!value_delivery)
        return res.status(400).json({error : "O campo cliente é obrigatório"});
    if(!time_delivery)
            return res.status(400).json({error : "O campo cliente é obrigatório"}); 
    if(!score)
        return res.status(400).json({error : "O campo cliente é obrigatório"});
    if(!company_category)
        return res.status(400).json({error : "O campo cliente é obrigatório"});
    else
        next();

}

module.exports = CompanyValidation;