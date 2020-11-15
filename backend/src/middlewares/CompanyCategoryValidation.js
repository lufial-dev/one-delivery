const CompanyCategory = require("../models/CompanyCategory");



const CompanyCategoryValidation = async (req, res, next) => {
    const { name } = req.body;
    const icon  = req.file;

    if(!name)
        return res.status(400).json({ error : "O campo nome é obrigatório"});
    else if(!icon)
        return res.status(400).json({ error : "O campo ícone é obrigatório, ou precisa ser .svg "});
    else{
        let exists;

        if(req.params.id){
            exists = await CompanyCategory.findOne({
                '_id' : {'$ne': req.params.id} ,
                'name' : {'$eq' : name}
                })
        }else{
            exists = await CompanyCategory.findOne({
                'name' : {'$eq' : name}
            });
        }

        
        if(exists)
            return res.status(400).json({ error : "Já existe uma categoria com este nome"});
        else
            next();
    }
        
}

module.exports = CompanyCategoryValidation;