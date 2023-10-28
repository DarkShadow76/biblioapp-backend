//import { invUser } from "../util.js";
import { autor } from "../models/autor.models.js";

export const getAutor = async (req, res) => {
  try {
    const { id } = req.params
    const Autor = await autor.findOne({
      where: {
        autor_id: id,
      }
    })

    if (!Autor) return res.status(404).json({ message: 'Autor no existe' })
    res.json(Autor)

  } catch (error) {
    return res.status(500).json({ message: error.message })
  }
};

export const getAutores = async (req, res) => {
  try {
    const listaAutores = await autor.findAll();
    res.json(listaAutores);

  } catch (error) {
    return res.status(500).json({ message: error.message })
  }
};

/*
export const getUsuariosByType = async (req, resp) => {
  const correo = req.query.correo
  const contrasenia = req.query.contrasenia

  getUser(correo, contrasenia, resp);
};
*/

export const createAutor = async (req, res) => {
  const { nombre_autor, nacionalidad, informacion_biografica } = req.body

  try {
    const newAutor = await autor.create({
      nombre_autor,
      nacionalidad,
      informacion_biografica,
    })

    res.json(newAutor)

  } catch (error) {
    return res.status(500).json({ message: error.message })
  }
};

export const updateAutor = async (req, res) => {
  try {
    const { id } = req.params;
    const {
      nombre_autor,
      nacionalidad,
      informacion_biografica,
    } = req.body

    const Autor = await autor.findByPk(id)
    Autor.nombre_autor = nombre_autor
    Autor.nacionalidad = nacionalidad
    Autor.informacion_biografica = informacion_biografica

    await Autor.save()

    res.json(Autor)

  } catch (error) {
    return res.status(500).json({ message: error.message })
  }
};

export const deleteAutor = async (req, res) => {
  try {
    const { id } = req.params;
    await autor.destroy({
      where: {
        autor_id :id,
      }
    });

    res.sendStatus(204)

  } catch (error) {
    return res.status(500).json({ message: error.message })
  }
};

/*
async function getUser(email, contrasena, resp) {
  const number = await usuario.count({
    where: {
      email,
      contrasena,
    }
  })
  if (number = 0) {
    //var prob = JSON.parse("-1")
    console.log("No existe tal usuario el tabla")
    resp.send(invUser)
  } else {
    const Usuario = await usuario.findAll({
      where: {
        email,
        contrasena,
      }
    })
  }
  //console.log("Usuario " + number)
  resp.send(Usuario)
  //resp.status(404).json({ message: 'Usuario no existe' })
  //resp.send(invUser)
}*/