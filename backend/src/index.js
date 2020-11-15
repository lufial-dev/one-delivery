const express = require("express");
const cors = require("cors");
const path = require('path');
const server = express();
const CompanyCategoryRoutes = require('./routes/CompanyCategoryRoutes');
const ProductCategoryRoutes = require("./routes/ProductCategoryRoutes");

server.use(cors());
server.use(express.json());
server.use('/companycategory', CompanyCategoryRoutes);
server.use('/productcategory', ProductCategoryRoutes)
server.use('/uploads', express.static(path.join(__dirname, '..', 'uploads')));

server.listen(3000);