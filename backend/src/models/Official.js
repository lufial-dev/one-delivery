const mongoose = require('mongoose');

const Schema = mongoose.Schema;

const Official = new Schema({
    name : { type : String , required : true},
    token : { type : String, required : false, unique : true},
    office : { type : String, required : true},
});

module.exports = mongoose.model('Officials', Official);