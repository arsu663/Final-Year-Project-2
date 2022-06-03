'use strict'

const Model = require('./model')

// Here, we are implementing the class with Singleton design pattern

class HospitalModel extends Model {
    constructor() {
        super('hospitals')
        if (this.instance) return this.instance
        HospitalModel.instance = this
    }
}

module.exports = new HospitalModel()