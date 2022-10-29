const Item = require('../models/item')

exports.add = async (req, res) => {
    const {name, unitPrice, unitType} = req.body;
    try{
        const item = new Item({name, unitPrice, unitType})
        const oldItem = await Item.findOne({name});
        if(oldItem){
            return res.send({error: 'Item Already Exists'})
        }
        const returnItem = await item.save()
        res.status(200).json(returnItem)
    }catch(err){
        res.status(500).json(err)
    }
}

exports.deleteAllItems = async (req, res) => {
    try{
        await Item.deleteMany();
        res.status(200).json({"message": "All Items Deleted"})
    }catch(err){
        res.status(500).json(err)
    }
}

//delete an item ========================================================================================
exports.deleteItem = async (req, res) => {
    const {id} = req.params;
    try{
        await Item.deleteOne({_id: id});
        res.status(200).json({'message': 'Item deleted Sucessfuly'});
    }catch(err){
        res.status(500).json({'Error': err});
    }
}

//get an item =============================================================================================
exports.getItem = async (req, res) => {
    const {id} = req.params;
    try{
        const item = await Item.findById(id);
        res.status(200).json({'message': 'Item Recieved SucessFully', 'Result': item});
    }catch(err){
        res.status(500).json({'Error': 'Cannot get Item details'});
    }
}

//get all items ===========================================================================================
exports.getAllItems = async (req, res) => {
    try{
        const items = await Item.find();
        res.status(200).json({'Result': items});
    }catch(err){
        res.status(500).json({'Error': 'Cannot get All Items details'});
    }
}
