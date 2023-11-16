import { CopiasLibros } from "../models/copiaslibros.models.js";

export const getCopiaLibro = async (req, res) => {
  try {
    const { id } = req.params;
    const CopiaLibro = await CopiasLibros.findOne({
      where: {
        copia_id: id,
      }
    });

    if (!CopiaLibro) return res.status(404).json({ message: 'Copia de libro no existe' });
    res.json(CopiaLibro);

  } catch (error) {
    return res.status(500).json({ message: error.message });
  }
};

export const getCopiasLibros = async (req, res) => {
  try {
    const listaCopiasLibros = await CopiasLibros.findAll();
    res.json(listaCopiasLibros);

  } catch (error) {
    return res.status(500).json({ message: error.message });
  }
};

export const createCopiaLibro = async (req, res) => {
  const { libro_id, estado_copia, ubicacion } = req.body;

  try {
    const newCopiaLibro = await CopiasLibros.create({
      libro_id,
      estado_copia,
      ubicacion
    });

    res.json(newCopiaLibro);

  } catch (error) {
    return res.status(500).json({ message: error.message });
  }
};

export const updateCopiaLibro = async (req, res) => {
  try {
    const { id } = req.params;
    const { libro_id, estado_copia, ubicacion } = req.body;

    const CopiaLibro = await CopiasLibros.findByPk(id);
    CopiaLibro.libro_id = libro_id;
    CopiaLibro.estado_copia = estado_copia;
    CopiaLibro.ubicacion = ubicacion;

    await CopiaLibro.save();

    res.json(CopiaLibro);

  } catch (error) {
    return res.status(500).json({ message: error.message });
  }
};

export const deleteCopiaLibro = async (req, res) => {
  try {
    const { id } = req.params;
    await CopiasLibros.destroy({
      where: {
        copia_id: id,
      }
    });

    res.sendStatus(204);

  } catch (error) {
    return res.status(500).json({ message: error.message });
  }
};
