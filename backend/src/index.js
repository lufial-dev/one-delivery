const express = require("express");
const cors = require("cors");
const path = require('path');
const server = express();

server.use(cors());
server.use(express.json());

const CompanyCategoryRoutes = require('./routes/CompanyCategoryRoutes');
const ProductCategoryRoutes = require("./routes/ProductCategoryRoutes");
const ClientRouter = require("./routes/ClientRoutes");
const OfficialRoutes = require('./routes/OfficialRoutes');
const IngredientRoutes = require('./routes/IngredientRoutes');

server.use('/companycategory', CompanyCategoryRoutes);
server.use('/productcategory', ProductCategoryRoutes);
server.use('/client', ClientRouter);
server.use('/official', OfficialRoutes);
server.use('/ingredient', IngredientRoutes);

server.use('/uploads', express.static(path.join(__dirname, '..', 'uploads')));

server.listen(3000);