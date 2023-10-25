import { where } from "sequelize";
import { invUser } from "../util.js";
import { usuario } from "../models/usuario.models.js";

export const getUsuario = async (req, res) => {
  try {
    const { id } = req.params
    const Usuario = await usuario.findOne({
      where: {
        usuario_id,
      }
    })

    if (!Usuario) return res.status(404).json({ message: 'Usuario no existe' })
    res.json(Usuario)

  } catch (error) {
    return res.status(500).json({ message: error.message })
  }
};

export const getUsuarios = async (req, res) => {
  try {
    const listaUsuarios = await usuario.findAll();
    res.json(listaUsuarios);

  } catch (error) {
    return res.status(500).json({ message: error.message })
  }
};

export const getUsuariosByType = async (req, resp) => {
  const correo = req.query.correo
  const contrasenia = req.query.contrasenia

  getUser(correo, contrasenia, resp);
};

export const createUsuario = async (req, res) => {
  const { nombre, apellido, dni, correo, contrasenia, telefono, tipo } = req.body

  try {
    const newUsuario = await usuario.create({
      nombre,
      apellido,
      email,
      contrasena,
      telefono,
      direccion,
      rol_usuario,
    })

    res.json(newUsuario)

  } catch (error) {
    return res.status(500).json({ message: error.message })
  }
};

export const updateUsuario = async (req, res) => {
  try {
    const { id } = req.params;
    const {
      nombre,
      apellido,
      email,
      contrasena,
      telefono,
      direccion,
    } = req.body

    const Usuario = await usuario.findByPk(id)
    Usuario.nombre = nombre
    Usuario.apellido = apellido
    Usuario.email = email
    Usuario.contrasena = contrasena
    Usuario.telefono = telefono
    Usuario.direccion = direccion

    await Usuario.save()

    res.json(Usuario)

  } catch (error) {
    return res.status(500).json({ message: error.message })
  }
};

export const deleteUsuario = async (req, res) => {
  try {
    const { id } = req.params;
    await usuario.destroy({
      where: {
        usuario_id :id,
      }
    });

    res.sendStatus(204)

  } catch (error) {
    return res.status(500).json({ message: error.message })
  }
};

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
}