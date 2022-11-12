const Supplier = require('../models/supplier')

exports.add = async (req, res) => {
    const {supplierID, businessName, fullName, tele, email, address} = req.body;
    try{
        const supplier = new Supplier({supplierID, businessName, fullName, tele, email, address})
        const returnSupplier = await supplier.save()
        res.status(200).json({message: 'Supplier Added', Result: returnSupplier})
    }catch(err){
        res.status(500).json(err)
    }
}

exports.getAllSuppliers = async (req, res) => {
    try{
        const suppliers = await Supplier.find();
        res.status(200).json({'Result': suppliers});
    }catch(err){
        res.status(500).json({'Error': 'Cannot get All Suppliers'});
    }
}

exports.deleteSupplier = async (req, res) => {
    const {id} = req.params;
    try{
        await Supplier.deleteOne({_id: id});
        res.status(200).json({message: 'Supplier deleted Sucessfuly'});
    }catch(err){
        res.status(500).json({'Error': err});
    }
}

exports.update = async (req, res) => {
    const {id} = req.params;
    const {supplierID, businessName, fullName, tele, email, address} = req.body;
    try{        
        var supplierObj = {
            "supplierID": supplierID,
            "businessName": businessName,
            "fullName": fullName,
            "tele": tele,
            "email": email,
            "address": address
        }

        await Supplier.findByIdAndUpdate(id, supplierObj);
        res.status(200).json({'message': 'Supplier Updated Sucessfully'})

    }catch(err){
        res.status(500).json({'Error': 'Cannot update Supplier'});
    }
}

exports.getSupplier = async (req, res) => {
    const {id} = req.params;
    try{
        var data = await Supplier.findOne({_id: id})
        res.send({status: "Ok", supplier: data})
    }catch(err){
        res.status(500).json(err);
    }
}

// exports.deleteOrder = async (req, res) => {
//     const {id} = req.params;
//     try{
//         await Supplier.deleteOne({_id: id});
//         res.status(200).json({message: 'Order deleted Sucessfuly'});
//     }catch(err){
//         res.status(500).json({'Error': err});
//     }
// }

// exports.getAllPendingOrders = async (req, res) => {
//     var pendingOrders = [];
//     try{
//         const orders = await Supplier.find();
//         for(var order of orders){
//             if(order.orderStatus == 'Pending'){
//                 pendingOrders.push(order)
//             }
//         }
//         res.status(200).json({'Result': pendingOrders});
//     }catch(err){
//         res.status(500).json({'Error': 'Cannot get All Pending Order details'});
//     }
// }

// exports.getAllRejectedOrders = async (req, res) => {
//     var rejectedOrders = [];
//     try{
//         const orders = await Supplier.find();
//         for(var order of orders){
//             if(order.orderStatus == 'Rejected'){
//                 rejectedOrders.push(order)
//             }
//         }
//         res.status(200).json({'Result': rejectedOrders});
//     }catch(err){
//         res.status(500).json({'Error': 'Cannot get All Rejected Order details'});
//     }
// }

// exports.getAllAcceptedOrders = async (req, res) => {
//     var AcceptedOrders = [];
//     try{
//         const orders = await Supplier.find();
//         for(var order of orders){
//             if(order.orderStatus == 'Accepted'){
//                 AcceptedOrders.push(order)
//             }
//         }
//         res.status(200).json({'Result': AcceptedOrders});
//     }catch(err){
//         res.status(500).json({'Error': 'Cannot get All Accepted Order details'});
//     }
// }