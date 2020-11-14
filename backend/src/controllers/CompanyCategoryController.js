const CompanyCategory = require('../models/CompanyCategory');

class CompanyCategoryController{

    async create(req, res){
        const companyCategory = new CompanyCategory(req.body);
        
        await companyCategory.save()
            .then( response => {
                return res.status(200).json(response);
            })
            .catch( error => {
                return res.status(500).json(error)
            });
    }

}

model.exports = new CompanyCategoryController();