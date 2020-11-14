const mongoose = require("../config/database");

const Schema = mongoose.Schema;

const Client = new Schema({
    name : { type : String , required : true},
    phone  : { type : String, required : true},
    token : { type : String, required : true, unique : unique},
    birth : { type : Date, required : false}
});

module.exports = mongoose.model("Clients", Client);