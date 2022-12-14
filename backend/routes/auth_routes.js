const express = require('express')
const router = express.Router()

//import controller
const {
    register,
    adminRegister,
    login,
    deleteAllUsers,
    getUserData,
    getUserDataFromEmail,
} = require('../controllers/auth_controller')

//api routes
router.post('/register', register);
router.post('/adminRegister', adminRegister);
router.post('/login', login);
router.delete('/deleteAllUsers', deleteAllUsers);
router.post('/getData', getUserData);
router.post('/getDataFromEmail', getUserDataFromEmail);

module.exports = router;