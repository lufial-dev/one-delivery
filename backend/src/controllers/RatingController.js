const Rating = require('../models/Rating');

class RatingController{

    async create(req, res){ 
        const rating = new Rating(req.body);

        await rating.save()
        .then(response => {
            return res.status(200).json(response);
        })
        .catch(error => {
            return res.status(500).json(error);
        })
    }

    async update(req, res){ 

        await Rating.findByIdAndUpdate({'_id': req.params.id}, req.body, {new : true})
        .then(response => {
            return res.status(200).json(response);
        })
        .catch(error => {
            return res.status(500).json(error);
        })
    }

    async findById(req, res){ 

        await Rating.findById({'_id': req.params.id})
        .then(response => {
            return res.status(200).json(response);
        })
        .catch(error => {
            return res.status(500).json(error);
        })
    }

    async all(req, res){ 
        await Rating.find()
        .then(async response => {           

            return res.status(200).json(response);
        })
        .catch(error => {
            return res.status(500).json(error);
        })
    }
}

module.exports = new RatingController();