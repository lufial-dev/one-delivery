const mongoose = require('mongoose');

const Schema = mongoose.Schema;

const CompanyCategory = new Schema({
    name : {type : String, required : true},
    icon : {type : String, required : true}
});

module.exports = mongoose.model('CompanyCategories', CompanyCategory);