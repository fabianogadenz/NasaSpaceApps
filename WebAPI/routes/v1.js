const express = require('express')
const router = express.Router()

const probabilityController = require('../controllers/ProbabilityController')

router.get('/getfireprobability', probabilityController.getFireProbability)
router.post('/complaint/new', probabilityController.create)
router.get('/complaint/getall', probabilityController.getAll)

router.get('/complaint/sendnotification', probabilityController.sendNotification)

module.exports = router
