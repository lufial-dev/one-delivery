const Client = require("../models/Client");

const ClientValidation = async (req, res, next) => {
    const { name, phone, token, birth } = req.body;

    if(!name)
        return res.status(400).json({error : "O campo nome é obrigatório"});
    if(!phone)
        return res.status(400).json({error : "O campo phone é obrigatório"});
    if(!token)
        return res.status(400).json({error : "O campo token é obrigatório"});
    else{
        let exists;

        if(req.params.id){
            exists = await Client.findOne({
                '_id' : {'$ne': req.params.id} ,
                'phone' : {'$eq' : req.body.phone}
            })
        }else{
            exists = Client.findOne({
                'phone' : {'$eq' : req.body.phone}
            });
        }
        if(exists)
            return res.status(400).json({ error : "Já existe um cliente com este contato"});
        else
            next();
    }

}

module.exports = ClientValidation;