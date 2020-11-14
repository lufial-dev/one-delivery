const mongoose = require('../config/database');

const Schema = mongoose.Schema;

const ProductCategory = new Schema({
    name : {type : String, required : true},
    image : {type: String, required : true, unique : true},

});

module.exports = mongoose.model('ProductCategories', ProductCategory);