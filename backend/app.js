// import modules
const express = require('express');
const mongoose = require('mongoose');
const morgan = require('morgan');
const cors = require('cors');
require('dotenv').config();

// app
const app = express();
app.use(express.json()) // for parsing application/json
app.use(express.urlencoded({ extended: true }))

const URI = process.env.MONGODB_URI;
const port = process.env.PORT || 8002;


// db
mongoose.connect(URI, {
    useNewUrlParser: true,
    useUnifiedTopology: true,
}).then(() => console.log("DB connected Sucessfully")).catch(err => console.log("DB not connected", err));


// middleware
app.use(morgan("dev"));
app.use(cors({origin: true, credentials: true}));


// routes import
const authRoutes = require('./routes/auth_routes');
const itemRoute = require('./routes/item_route');
const orderRouter = require('./routes/order_routes');
const inquiryRoutes = require('./routes/inquiry_routes');
const supplierRoutes = require('./routes/supplier_routes');

//routes
app.use('/auth', authRoutes);
app.use('/item', itemRoute);
app.use('/order', orderRouter);
app.use('/inquiry', inquiryRoutes);
app.use('/supplier', supplierRoutes);


//listener
const server = app.listen(port, () => console.log(`Server is running on port ${port}`));