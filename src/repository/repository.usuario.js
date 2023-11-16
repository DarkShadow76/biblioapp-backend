const { usuario } = require('../models/usuario.models.js')

import AbstractRepository from './abstract.repository.js'

export default new class UsuarioRepository extends AbstractRepository {
  constructor() {
    super(usuario)
  }
}