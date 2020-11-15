const Official = require("../models/Official");

const OfficialValidation = async (req, res, next) => {
    const { name, token, office } = req.body;

    if(!name)
        return res.status(400).json({error : "O campo nome é obrigatório"});
    if(!office)
        return res.status(400).json({error : "O campo cargo é obrigatório"});
    if(!token)
        return res.status(400).json({error : "O campo token é obrigatório"});
    else
        next();

}

module.exports = OfficialValidation;