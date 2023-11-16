const { CopiasLibros } = require('../models/copiaslibros.models.js');

import AbstractRepository from './AbstractRepository';

class CopiasLibrosRepository extends AbstractRepository {
  constructor() {
    super(CopiasLibros);
  }
}

export default new CopiasLibrosRepository();
