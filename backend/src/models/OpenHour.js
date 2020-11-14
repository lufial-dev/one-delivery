const mongoose = require('../config/database');

const Schema = mongoose.Schema;

const OpenHour = new Schema({
    day_week : { type: Number, required : true },
    open_morning : { type : Date, required : false },
    close_morning : { type : Date, required : false },
    open_evening : { type : Date, required : false },
    close_evening : { type : Date, required : false },
    open_night : { type : Date, required : false },
    close_night : { type : Date, required : false },
});

module.exports = mongoose.model('OpenHours', OpenHour);