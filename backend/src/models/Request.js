const mongoose = require("../config/database");
const Official = require("./Official");
const ProductRequest = require("./ProductRequest");

const Schema = mongoose.Schema;

const Request = new Schema({
    requested_at : { type : Date, required :  true, default : new Date()},
    delivered_at : { type : Date, required : false},
    form_payment : { type : String, required : true},
    status : { type : String, required : true},
    products_requests : [
        {type : Schema.Types.ObjectId, ref : ProductRequest}
    ],
    delivery_man : { type : Schema.Types.ObjectId, ref : Official}
});

module.exports = mongoose.model("Resquests", Request);