const express = require('express')
const router = express.Router()

//import controller
const {
    add,
    getAllSuppliers,
    deleteSupplier,
    update,
    getSupplier
} = require('../controllers/supplier_controller')

//api routes
router.post('/add', add);
router.get('/getAll', getAllSuppliers)
router.delete('/delete/:id', deleteSupplier)
router.put('/update/:id', update)
router.get('/get/:id', getSupplier)

module.exports = router;