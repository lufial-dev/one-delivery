const mongoose = require('mongoose');

const url = 'mongodb://localhost:27017/um_delivery';

mongoose.connect(url, {useNewUrlParser: true});

module.exports = mongoose;