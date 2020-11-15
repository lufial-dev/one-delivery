const mongoose = require('../config/database');

const Schema = mongoose.Schema;

const Ingredient = new Schema({
    name : {type : String, required : true},
    value : {type : Number},
});

module.exports = mongoose.model('Ingredients', Ingredient);