'use strict';

const Model = require('./model');

// Here, we are implementing the class with Singleton design pattern

class AppointmentModel extends Model {
  constructor() {
    super('Appointments');
    if (this.instance) return this.instance;
    AppointmentModel.instance = this;
  }
}

module.exports = new AppointmentModel();
