const mongoose = require('../config/database');

const Schema = mongoose.Schema;

const ProductImgage = new Schema({
    dir : {type: String, required:true}
});

module.exports = mongoose.model('ProductImages', ProductImgage);