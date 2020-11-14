const mongoose = require("../config/database");
const Product = require("./Product");

const Schema = mongoose.Schema;

const ProductRequest = new Schema({
    observation : { type : String, required : false },
    product : { type : Schema.Types.ObjectId, ref : Product},

});

module.exports = mongoose.models("ProductsRequests", ProductRequest);