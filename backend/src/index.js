const express = require("express");
const cors = require("cors");
const path = require('path');
const server = express();
const CompanyCategoryRoutes = require('./routes/CompanyCategoryRoutes');

server.use(cors());
server.use(express.json());
server.use('/companycategory', CompanyCategoryRoutes);
server.use('/uploads', express.static(path.join(__dirname, '..', 'uploads')));

server.listen(3000);