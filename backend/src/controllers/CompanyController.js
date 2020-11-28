const Company = require('../models/Company');

class CompanyController{

    async create(req, res){ 
        const company = new Company(req.body);

        await company.save()
        .then(response => {
            return res.status(200).json(response);
        })
        .catch(error => {
            return res.status(500).json(error);
        })
    }

    async update(req, res){ 

        await Company.findByIdAndUpdate({'_id': req.params.id}, req.body, {new : true})
        .then(response => {
            return res.status(200).json(response);
        })
        .catch(error => {
            return res.status(500).json(error);
        })
    }
}


module.exports = new CompanyController();