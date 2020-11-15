const Official = require("../models/Official");

class OfficialController{
    async create(req, res){
        const official = new Official(req.body);

        official.save()
        .then(response => {
            return res.status(200).json(response);
        })
        .catch(error => {
            return res.status(500).json(error);
        })
    }

    async update(req, res){
        Official.findByIdAndUpdate({'_id' : req.params.id}, req.body, { new : true })
        .then(response => {
            return res.status(200).json(response);
        })
        .catch(error => {
            return res.status(500).json(error);
        })
    }

    async findById(req, res){
        Official.findById({'_id' : req.params.id})
        .then(response => {
            return res.status(200).json(response);
        })
        .catch(error => {
            return res.status(500).json(error);
        })
    }

}

module.exports = new OfficialController();