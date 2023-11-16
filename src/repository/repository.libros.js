const { libros } = require('../models/libros.models.js')

import AbstractRepository from './AbstractRepository';

class LibrosRepository extends AbstractRepository {
  constructor() {
    super(libros);
  }
}

export default new LibrosRepository();