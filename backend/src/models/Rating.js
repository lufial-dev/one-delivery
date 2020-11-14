const mongoose = require("../config/database");

const Schema = mongoose.Schema;

const Rating = new Schema({
    ponctuation : { type : int, required : true },
    description : { tupe : String, required : false },
    client : { type : Schema.Types.ObjectId , required : true }
});

module.exports = mongoose.model("Ratings", Rating);