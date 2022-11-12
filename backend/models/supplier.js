const mongoose = require('mongoose');

var supplierSchema = new mongoose.Schema({
    supplierID: {type: String},
    businessName: {type: String},
    fullName: {type: String},
    tele: {type: Number},
    email: {type: String},
    address: {type: String},
});

module.exports = new mongoose.model('suppliers', supplierSchema, 'suppliers');