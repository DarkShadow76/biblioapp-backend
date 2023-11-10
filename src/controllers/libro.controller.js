import { libros } from "../models/libros.models";

export const getLibro = async (req, res) => {
  try {
    const { id } = req.params
    const Libro = await libros.findOne({
      where: {
        libro_id: id,
      }
    })

    if (!Libro) return res.status(404).json({ message: 'Libro no existe' })
    res.json(Libro)

  } catch (error) {
    return res.status(500).json({ message: error.message })
  }
};

export const getLibros = async (req, res) => {
  try {
    const listaLibros = await libros.findAll();
    res.json(listaLibros);

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

export const createLibro = async (req, res) => {
  const { titulo, autor, isbn, genero, anio_publicacion, editor, resumen, portada } = req.body

  try {
    const newLibro = await libros.create({
      titulo,
      autor,
      isbn,
      genero,
      anio_publicacion,
      editor,
      resumen,
      portada
    })

    res.json(newLibro)

  } catch (error) {
    return res.status(500).json({ message: error.message })
  }
};

export const updateLibro = async (req, res) => {
  try {
    const { id } = req.params;
    const {
      titulo,
      autor,
      isbn,
      genero,
      anio_publicacion,
      editor,
      resumen,
      portada
    } = req.body

    const Libro = await libros.findByPk(id)
    Libro.titulo = titulo
    Libro.autor = autor
    Libro.isbn = isbn
    Libro.genero = genero
    Libro.anio_publicacion = anio_publicacion
    Libro.editor = editor
    Libro.resumen = resumen
    Libro.portada = portada

    await Libro.save()

    res.json(Libro)

  } catch (error) {
    return res.status(500).json({ message: error.message })
  }
};

export const deleteLibro = async (req, res) => {
  try {
    const { id } = req.params;
    await libros.destroy({
      where: {
        libro_id: id,
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