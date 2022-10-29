const express = require('express')
const router = express.Router()

//import controller
const {
    add,
    deleteItem,
    deleteAllItems,
    getAllItems,
    getItem,
} = require('../controllers/item_controller')

//api routes
router.post('/add', add);
router.delete('/deleteAll', deleteAllItems);
router.delete('/delete/:id', deleteItem);
router.get('/get/:id', getItem);
router.get('/getAll', getAllItems);

module.exports = router;