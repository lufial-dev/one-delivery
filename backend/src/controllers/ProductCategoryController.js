const ProductCategory = require('../models/ProductCategory');
const path = require("path");
const URL = require('../config/utilconfig');

class ProductCategoryController{

    async create(req, res){
        const { name } = req.body;
        const file = req.file;

        const image = file.filename;

        const data = {
            name,
            image
        }
        
        

        const productCategory = new ProductCategory(data);
        
        await productCategory.save()
            .then( response => {
                response.dir = URL.PRODUCT_CATEGORY + response.dir;
                return res.status(200).json(response);
            })
            .catch( error => {
                return res.status(500).json(error)
            });
    }

    async update(req, res){
        const {name} = req.body;
        const file = req.file;

        const image = file.filename;

        const data = {
            name,
            image
        }
        await ProductCategory.findByIdAndUpdate({'_id': req.params.id}, data, { new : true })
            .then(response => {
                response.dir = URL.PRODUCT_CATEGORY + response.dir;
                return res.status(200).json(response);
            })
            .catch(error => {
                return res.status(500).json(error);
            })
        
    }

    async find(req, res){
        await ProductCategory.find()
            .sort('name')
            .then(response => {
                response.map(r => r.image = URL.PRODUCT_CATEGORY +  r.image);
                return res.status(200).json(response);
            })
            .catch(error => {
                return res.status(500).json(error);
            });
    }

}

module.exports = new ProductCategoryController();