'use strict';

const Controller = require('./controller');
const adminModel = require('../models/admin_model');

const adminsController = new Controller(adminModel);
module.exports = adminsController.router;