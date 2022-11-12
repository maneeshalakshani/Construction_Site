const express = require('express')
const router = express.Router()

//import controller
const {
    add,
    getAllSuppliers
} = require('../controllers/supplier_controller')

//api routes
router.post('/add', add);
router.get('/getAll', getAllSuppliers)

module.exports = router;