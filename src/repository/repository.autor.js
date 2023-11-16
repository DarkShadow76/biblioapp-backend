const { autor } = require('../models/autor.models.js')

import AbstractRepository from './abstract.repository.js'

export default new class AutorRepository extends AbstractRepository {
  constructor() {
    super(autor)
  }
}