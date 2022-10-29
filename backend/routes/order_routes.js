const express = require('express')
const router = express.Router()

//import controller
const {
    add,
    update,
    deleteOrder
} = require('../controllers/order_controller')

//api routes
router.post('/add', add);
router.delete('/delete/:id', deleteOrder);
router.put('/update/:id', update);

module.exports = router;