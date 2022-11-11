const Order = require('../models/order')

exports.add = async (req, res) => {
    const {quantity, userID, itemID, totPrice, deliveryAddress} = req.body;
    var orderStatus;
    try{
        if(totPrice > 100000){
            orderStatus = 'Pending';
        }else {
            orderStatus = 'Accepted';
        }
        const order = new Order({userID, itemID, quantity, totPrice, orderStatus, deliveryAddress})
        const returnOrder = await order.save()
        res.status(200).json({message: 'Order Added', Result: returnOrder})
    }catch(err){
        res.status(500).json(err)
    }
}

exports.update = async (req, res) => {
    const {id} = req.params;
    const {orderStatus, reason} = req.body;
    try{        
        const orderToUpdate = await Order.findById(id);
        var orderObj = {
            "userID": orderToUpdate.userID,
            "itemID": orderToUpdate.itemID,
            "quantity": orderToUpdate.quantity,
            "totPrice": orderToUpdate.totPrice,
            "orderStatus": orderStatus,
            "deliveryAddress": orderToUpdate.deliveryAddress,
            "reason": reason
        }

        await Order.findByIdAndUpdate(id, orderObj);
        res.status(200).json({'message': 'Order Updated Sucessfully'})

    }catch(err){
        res.status(500).json({'Error': 'Cannot update Order'});
    }
}

exports.deleteOrder = async (req, res) => {
    const {id} = req.params;
    try{
        await Order.deleteOne({_id: id});
        res.status(200).json({message: 'Order deleted Sucessfuly'});
    }catch(err){
        res.status(500).json({'Error': err});
    }
}

exports.getAllPendingOrders = async (req, res) => {
    var pendingOrders = [];
    try{
        const orders = await Order.find();
        for(var order of orders){
            if(order.orderStatus == 'Pending'){
                pendingOrders.push(order)
            }
        }
        res.status(200).json({'Result': pendingOrders});
    }catch(err){
        res.status(500).json({'Error': 'Cannot get All Pending Order details'});
    }
}

exports.getAllRejectedOrders = async (req, res) => {
    var rejectedOrders = [];
    try{
        const orders = await Order.find();
        for(var order of orders){
            if(order.orderStatus == 'Rejected'){
                rejectedOrders.push(order)
            }
        }
        res.status(200).json({'Result': rejectedOrders});
    }catch(err){
        res.status(500).json({'Error': 'Cannot get All Rejected Order details'});
    }
}

exports.getAllAcceptedOrders = async (req, res) => {
    var AcceptedOrders = [];
    try{
        const orders = await Order.find();
        for(var order of orders){
            if(order.orderStatus == 'Accepted'){
                AcceptedOrders.push(order)
            }
        }
        res.status(200).json({'Result': AcceptedOrders});
    }catch(err){
        res.status(500).json({'Error': 'Cannot get All Accepted Order details'});
    }
}