const IngredientValidation = async (req, res, next) => {
    const { name, value } = req.body;

    if(!name)
        return res.status(400).json({error : "O campo nome é obrigatório"});
    else
        next();

}

module.exports = IngredientValidation;