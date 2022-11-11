const Inquiry = require('../models/inquiry')

//add an inquiry ========================================================================================
exports.add = async (req, res) => {
    const {orderID, title, message} = req.body;
    try{
        const inquiryObj = new Inquiry({orderID, title, message})
        const returnInquiry = await inquiryObj.save()
        res.status(200).json({message: 'Inquiry Added', Result: returnInquiry})
    }catch(err){
        res.status(500).json(err)
    }
}

//delete all inquiries ========================================================================================
exports.deleteAll = async (req, res) => {
    try{
        await Inquiry.deleteMany();
        res.status(200).json({message: "All Inquiries Deleted"})
    }catch(err){
        res.status(500).json(err)
    }
}

//delete an inquiry ========================================================================================
exports.deleteInquiry = async (req, res) => {
    const {id} = req.params;
    try{
        await Inquiry.deleteOne({_id: id});
        res.status(200).json({'message': 'Inquiry deleted Sucessfuly'});
    }catch(err){
        res.status(500).json({Error: err});
    }
}

//get an inquiry =============================================================================================
exports.getInquiry = async (req, res) => {
    const {id} = req.params;
    try{
        const inquiry = await Inquiry.findById(id);
        res.status(200).json({message: 'Inquiry Recieved SucessFully', 'Result': inquiry});
    }catch(err){
        res.status(500).json({'Error': 'Cannot get Inquiry details'});
    }
}

//get all inquiries ===========================================================================================
exports.getAllInquiries = async (req, res) => {
    try{
        const inquiries = await Inquiry.find();
        res.status(200).json({message: 'Inquiries fetched Successfully', Result: inquiries});
    }catch(err){
        res.status(500).json({'Error': 'Cannot get All Items details'});
    }
}
