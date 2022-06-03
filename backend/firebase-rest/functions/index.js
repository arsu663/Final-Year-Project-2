'use strict'
const functions = require("firebase-functions")
const express = require("express")
const app = express();
const usersRouter = require('./api/controllers/users_controller')
const doctorsRouter = require('./api/controllers/doctor_controller')
const appointmentsRouter = require('./api/controllers/appointment_controller')
const hospitalsRouter = require('./api/controllers/hospital_controller')
    // const countersRouter = require('./api/controllers/counters_controller')

const { authsRouter } = require('./api/controllers/auths_controller')

app.use(express.json())
app.use('/auths', authsRouter)

app.use('/users', usersRouter)
app.use('/doctors', doctorsRouter)
app.use('/Appointments', appointmentsRouter)
app.use('/hospitals', hospitalsRouter)
    // app.use('/counters', verifyAccessToken, countersRouter)


// To handle "Function Timeout" exception
exports.functionsTimeOut = functions.runWith({
    timeoutSeconds: 300
})

exports.setupdb = functions.https.onRequest(require('./tools/setup_database'))
    // exports.setupauth = functions.https.onRequest(require('./tools/setup_authentications'))
exports.api = functions.https.onRequest(app)