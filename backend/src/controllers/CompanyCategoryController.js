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

    async update(req, res){
        await CompanyCategory.findByIdAndUpdate({'_id': req.params.id}, req.body, { new : true })
            .then(response => {
                return res.status(200).json(response);
            })
            .catch(error => {
                return res.status(500).json(error);
            })
        
    }

    async all(req, res){
        await CompanyCategory.find()
            .sort('name')
            .then(response => {
                return res.status(200).json(response);
            })
            .catch(error => {
                return res.status(500).json(error);
            });
    }

}

module.exports = new CompanyCategoryController();