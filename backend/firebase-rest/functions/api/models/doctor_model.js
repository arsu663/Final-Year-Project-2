'use strict'

const Model = require('./model')

// Here, we are implementing the class with Singleton design pattern

class DoctorModel extends Model {
    constructor() {
        super('doctors')
        if (this.instance) return this.instance
        DoctorModel.instance = this
    }
}

module.exports = new DoctorModel()