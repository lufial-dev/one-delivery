const Rating = require("../models/Rating");

const RatingValidation = async (req, res, next) => {
    const { description, ponctuation, client} = req.body;

    if(!description)
        return res.status(400).json({error : "O campo descrição é obrigatório"});
    if(!ponctuation)
        return res.status(400).json({error : "O campo pontuação é obrigatório"});
    if(!client)
        return res.status(400).json({error : "O campo cliente é obrigatório"});
    else
        next();

}

module.exports = RatingValidation;