'use strict';

const Model = require('./model');

// Here, we are implementing the class with Singleton design pattern

class AdminModel extends Model {
  constructor() {
    super('admins');
    if (this.instance) return this.instance;
    AdminModel.instance = this;
  }
}

module.exports = new AdminModel();
