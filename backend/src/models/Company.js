const mongoose = require('../config/database');
const CompanyCategory = require('./CompanyCategory');
const Oficial = require('./Official');
const Product = require('./Product');
const Rating = require('./Rating');

const Schema = mongoose.Schema;

const Company = new Schema({
    name : { type: String, required : true, unique : true },
    image : { type : String, required : true, unique : true},
    cover_image : {type : String, required : true, unique : true},
    closed_manually : { type : Boolean, required : true, default : false},
    min_value_delivery : { type : Number, required : false  },
    value_delivery : { type : Number, required : true },
    time_delivery : { type : String, required : true},
    score : { type : Number, required : false },
    company_category : { type : Schema.Types.ObjectId, ref : CompanyCategory},
    officials : [
        { type : Schema.Types.ObjectId, ref : Oficial}
    ],
    products : [
        { type : Schema.Types.ObjectId, ref : Product}
    ], 
    ratings : [
        { type : Schema.Types.ObjectId, ref : Rating }
    ]


});

module.exports = mongoose.model('Companies', Company);