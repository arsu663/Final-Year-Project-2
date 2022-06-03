'use strict'

const Controller = require('./controller')
const doctorModel = require('../models/doctor_model')

const doctorsController = new Controller(doctorModel)
module.exports = doctorsController.router