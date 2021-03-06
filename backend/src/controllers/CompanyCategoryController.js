const CompanyCategory = require('../models/CompanyCategory');
const path = require("path");
const URL = require('../config/utilconfig');

class CompanyCategoryController{

    async create(req, res){
        const { name } = req.body;
        const file = req.file;

        const icon = file.filename;

        const data = {
            name,
            icon
        }
        
        

        const companyCategory = new CompanyCategory(data);
        
        await companyCategory.save()
            .then( response => {
                response.dir = URL.COMPANY_CATEGORY + response.dir;
                return res.status(200).json(response);
            })
            .catch( error => {
                return res.status(500).json(error)
            });
    }

    async update(req, res){
        const {name} = req.body;
        const file = req.file;

        const icon = file.filename;

        const data = {
            name,
            icon
        }
        await CompanyCategory.findByIdAndUpdate({'_id': req.params.id}, data, { new : true })
            .then(response => {
                response.dir = URL.COMPANY_CATEGORY + response.dir;
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
                response.map(r => r.icon = URL.COMPANY_CATEGORY +  r.icon);
                return res.status(200).json(response);
            })
            .catch(error => {
                return res.status(500).json(error);
            });
    }

}

module.exports = new CompanyCategoryController();