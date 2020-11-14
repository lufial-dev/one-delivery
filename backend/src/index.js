const express = require("express");

const server = express();

const CompanyCategoryRoutes = require('./routes/CompanyCategoryRoutes');

server.use(express.json());

server.use('/companycategory', CompanyCategoryRoutes);


server.listen(3000, () => {
    console.log("API ONLINE");
});