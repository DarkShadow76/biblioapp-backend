import { Sequelize, DataTypes } from "sequelize";
import { sequelize } from "../database/database.js";

export const autor = sequelize.define('autores', {
  autor_id: {
    primaryKey: true,
    type: DataTypes.UUID,
    allowNull: false,
    defaultValue: Sequelize.UUIDV4
  },
  nombre_autor: {
    type: DataTypes.TEXT,
    allowNull: false,
  },
  nacionalidad: {
    type: DataTypes.TEXT,
    allowNull: false,
  },
  informacion_biografica: {
    type: DataTypes.TEXT,
    allowNull: true,
  }
}, {
  tableName: 'autores',
  timestamps: false,
  freezeTableName: true
})