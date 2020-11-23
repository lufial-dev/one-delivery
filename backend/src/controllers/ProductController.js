const Product = require('../models/Product');
const IngredientController = require('../controllers/IngredientController');
const Ingredient = require('../models/Ingredient');
const ProductImage = require('../models/ProductImage');
const ProductCategory = require('../models/ProductCategory');
const { PRODUCT_IMAGE } = require('../config/utilconfig');

class ProductController{

    async create(req, res){ 
        const product = new Product(req.body);

        await product.save()
        .then(response => {
            return res.status(200).json(response);
        })
        .catch(error => {
            return res.status(500).json(error);
        })
    }

    async update(req, res){ 

        await Product.findByIdAndUpdate({'_id': req.params.id}, req.body, {new : true})
        .then(response => {
            return res.status(200).json(response);
        })
        .catch(error => {
            return res.status(500).json(error);
        })
    }

    async findById(req, res){ 

        await Product.findById({'_id': req.params.id})
        .then(response => {
            return res.status(200).json(response);
        })
        .catch(error => {
            return res.status(500).json(error);
        })
    }

    async all(req, res){ 
        await Product.find()
        .then(async response => {           

            return res.status(200).json(response);
        })
        .catch(error => {
            return res.status(500).json(error);
        })
    }

    async findIngredients(response){
        response.forEach(r => {
            r.ingredients.forEach(item =>
                Ingredient.findById({'_id' : item}).then(r=>
                    item = r
                )
            )
        });

        return response;
    }

    async count(req, res){ 
        
        await Product.find().limit(parseInt(req.params.count))
        .then(async products =>  {  
            var data = [];
            for(var i=0 ; i < products.length ; i++) { 
                var ingredients = await Ingredient.find({_id: {$in: products[i].ingredients}});
                var images = await ProductImage.find({_id: {$in: products[i].images}});

                images.map(image => image.dir = PRODUCT_IMAGE + image.dir);
                
                data.push( {
                        _id : products[i].id,
                        name : products[i].name,
                        description : products[i].description,
                        value : products[i].value,
                        ingredients : ingredients,
                        images : images
        
                    })
                }

            return res.status(200).json(data);
        })
        .catch(error => {
            return res.status(500).json(error);
        })
    }

}

module.exports = new ProductController();