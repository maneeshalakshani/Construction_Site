const express = require('express')
const router = express.Router()

//import controller
const {
    add,
    deleteInquiry,
    deleteAll,
    getInquiry,
    getAllInquiries
} = require('../controllers/inquiry_controller')

//api routes
router.post('/add', add);
router.delete('/deleteAll', deleteAll);
router.delete('/delete/:id', deleteInquiry);
router.get('/get/:id', getInquiry);
router.get('/getAll', getAllInquiries);

module.exports = router;