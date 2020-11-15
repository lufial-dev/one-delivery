const ProductImage = require('../models/ProductImage');
const path = require("path");
const URL = require('../config/utilconfig');

class ProductImageController{

    async create(req, res){
        const file = req.file;

        const dir = file.filename;

        const data = {
            dir
        }
        
        

        const productImage = new ProductImage(data);
        
        await productImage.save()
            .then( response => {
                response.dir = URL.PRODUCT_IMAGE + response.dir;
                return res.status(200).json(response);
            })
            .catch( error => {
                return res.status(500).json(error)
            });
    }

    async update(req, res){
        const file = req.file;

        const dir = file.filename;

        const data ={
            dir
        }
        await ProductImage.findByIdAndUpdate({'_id': req.params.id}, data, { new : true })
            .then(response => {
                response.dir = URL.PRODUCT_IMAGE + response.dir;
                return res.status(200).json(response);
            })
            .catch(error => {
                return res.status(500).json(error);
            })
        
    }

    async findById(req, res){
        await ProductImage.find()
            .then(response => {
                response.map(r => r.dir = URL.PRODUCT_IMAGE +  r.dir);
                return res.status(200).json(response);
            })
            .catch(error => {
                return res.status(500).json(error);
            });
    }

}

module.exports = new ProductImageController();