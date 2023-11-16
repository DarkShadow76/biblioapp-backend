//import { autor } from '../models/autor.models.js'
const {autor} = require('../models/autor.models.js')

const create = async (autor) => {
  console.log("::: Create autor :::")
  try {
    console.log(autor)

    const { nombre_autor, nacionalidad, informacion_biografica } = autor;

    const newAutor = await autor.create(autor);

    return newAutor;
  } catch (error) {
    console.error(error)

    return null;
  }
}

const findAll = async () => {
  console.log("::: Get autores :::")
  try {
    return await autor.findAll();
  } catch (error) {
    console.error(error)
    
    return null;
  }
}

const findOne = async (id_autor) => {
  console.log("::: Get autor :::")
  try {
    return await autor.findOne({
      where: {
        autor_id: id_autor,
      }
    })
  } catch (error) {
    console.error(error)

    return null;
  }
}

const update = async (autor) => {
  console.log("::: Update autor :::")
  try {
    const foundAutor = await autor.findOne({
      where: {
        autor_id: autor.autor_id
      }
    })
    foundAutor.set(autor);
    await foundAutor.save();

    return foundAutor;
  } catch (error) {
    console.error(error)

    return null;
  }
}

const remove = async (id_autor) => {
  console.log("::: Delete autor :::")
  try {
    await autor.destroy({
      where: {
        autor_id: id_autor,
      }
    })

    return true;
  } catch (error) {
    console.error(error);

    return false;
  }
}

const repositoryAutor = { create, findAll, findOne, update, remove}

module.exports = repositoryAutor;