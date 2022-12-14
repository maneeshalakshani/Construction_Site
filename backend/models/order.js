const mongoose = require('mongoose');

var orderSchema = new mongoose.Schema({
    userID: {type: String},
    itemID: {type: String},
    quantity: {type: Number},
    totPrice: {type: Number},
    orderStatus: {type: String},
    deliveryAddress: {type: String},
    reason: {type: String},
    supplierName: {type: String}
});

module.exports = new mongoose.model('orders', orderSchema, 'orders');