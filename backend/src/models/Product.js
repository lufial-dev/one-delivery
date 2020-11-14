const mongoose = require('../config/database');
const ProductImage = require('./ProductImage');
const ProductCategory = require('./ProductCategory');
const Ingredient = require('./Ingredient'); 
const Schema = mongoose.Schema;

const Product = new Schema({
    name : { type : String, required : true },
    description : { type : String, required : true },
    value : { type : double, required : true},
    ingredients : [
        { type : Schema.Types.ObjectId, ref : Ingredient }
    ],
    images : [
        { type : Schema.Types.ObjectId, ref : ProductImage}
    ],
    categories : [
        { type : Schema.Types.ObjectId, ref : ProductCategory}
    ]
    
});

module.exports = mongoose.model('Products', Product);