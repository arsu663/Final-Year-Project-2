'use strict'

const Controller = require('./controller')
const hospitalModel = require('../models/hospital_model')

const hospitalsController = new Controller(hospitalModel)
module.exports = hospitalsController.router