const mongoose = require('mongoose');

var inquirySchema = new mongoose.Schema({
    orderID: {type: String},
    title: {type: String},
    message: {type: String},
});

module.exports = new mongoose.model('inquiries', inquirySchema, 'inquiries');