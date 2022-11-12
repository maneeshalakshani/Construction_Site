const express = require('express')
const router = express.Router()

//import controller
const {
    add,
    getAllSuppliers,
    deleteSupplier
} = require('../controllers/supplier_controller')

//api routes
router.post('/add', add);
router.get('/getAll', getAllSuppliers)
router.delete('/delete/:id', deleteSupplier)

module.exports = router;