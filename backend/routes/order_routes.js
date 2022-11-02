const express = require('express')
const router = express.Router()

//import controller
const {
    add,
    update,
    deleteOrder,
    getAllPendingOrders,
    getAllRejectedOrders,
    getAllAcceptedOrders
} = require('../controllers/order_controller')

//api routes
router.post('/add', add);
router.delete('/delete/:id', deleteOrder);
router.put('/update/:id', update);
router.get('/getAllPendingOrders', getAllPendingOrders);
router.get('/getAllRejecedOrders', getAllRejectedOrders);
router.get('/getAllAcceptedOrders', getAllAcceptedOrders);

module.exports = router;