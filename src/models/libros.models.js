import { Sequelize, DataTypes } from "sequelize";
import { sequelize } from "../database/database";

export const libros = sequelize.define('libros', {
  libro_id: {
    primaryKey: true,
    type: DataTypes.UUID,
    allowNull: false,
    defaultValue: Sequelize.UUIDV4
  },
  titulo: {
    type: DataTypes.TEXT,
    allowNull: false
  },
  autor: {
    type: DataTypes.TEXT,
    allowNull: false
  },
  isbn: {
    type: DataTypes.TEXT,
    allowNull: false
  },
  genero: {
    type: DataTypes.TEXT,
    allowNull: false
  },
  anio_publicacion: {
    type: DataTypes.INTEGER,
    allowNull: false
  },
  editor: {
    type: DataTypes.TEXT,
    allowNull: false
  },
  resumen: {
    type: DataTypes.TEXT,
    allowNull: false
  },
  portada: {
    type: DataTypes.TEXT,
    allowNull: false
  },
},
  {
    tableName: 'libros',
    timestamps: true,
    freezeTableName: true
  }
);