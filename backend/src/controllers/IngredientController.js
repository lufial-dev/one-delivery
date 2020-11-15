const Ingredient = require('../models/Ingredient');

class IngredientController{

    async create(req, res){ 
        const ingredient = new Ingredient(req.body);

        await ingredient.save()
        .then(response => {
            return res.status(200).json(response);
        })
        .catch(error => {
            return res.status(500).json(error);
        })
    }

    async update(req, res){ 

        await Ingredient.findByIdAndUpdate({'_id': req.params.id}, req.body, {new : true})
        .then(response => {
            return res.status(200).json(response);
        })
        .catch(error => {
            return res.status(500).json(error);
        })
    }

    async findById(req, res){ 

        await Ingredient.findById({'_id': req.params.id})
        .then(response => {
            return res.status(200).json(response);
        })
        .catch(error => {
            return res.status(500).json(error);
        })
    }

    async findByPhone(req, res){ 

        await Ingredient.find({'phone': req.params.phone})
        .then(response => {
            return res.status(200).json(response);
        })
        .catch(error => {
            return res.status(500).json(error);
        })
    }

}

module.exports = new IngredientController();