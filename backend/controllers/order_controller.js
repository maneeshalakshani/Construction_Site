const Order = require('../models/order')

exports.add = async (req, res) => {
    const {quantity, userID, itemID, totPrice} = req.body;
    const orderStatus = 'Pending';
    try{
        const order = new Order({userID, itemID, quantity, totPrice, orderStatus})
        const returnOrder = await order.save()
        res.status(200).json(returnOrder)
    }catch(err){
        res.status(500).json(err)
    }
}

exports.update = async (req, res) => {
    const {id} = req.params;
    const {orderStatus} = req.body;
    try{        
        const orderToUpdate = await Order.findById(id);
        var orderObj = {
            "userID": orderToUpdate.userID,
            "itemID": orderToUpdate.itemID,
            "quantity": orderToUpdate.quantity,
            "totPrice": orderToUpdate.totPrice,
            "orderStatus": orderStatus
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
        res.status(200).json({'message': 'Order deleted Sucessfuly'});
    }catch(err){
        res.status(500).json({'Error': err});
    }
}