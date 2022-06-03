'use strict'

const Controller = require('./controller')
const appointmentModel = require('../models/appointment_model')

const appointmentsController = new Controller(appointmentModel)
module.exports = appointmentsController.router