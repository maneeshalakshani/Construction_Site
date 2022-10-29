const mongoose = require('mongoose');

var itemSchema = new mongoose.Schema({
    name: {type: String},
    unitPrice: {type: Number},
    unitType: {type: String},
});

module.exports = new mongoose.model('items', itemSchema, 'items');