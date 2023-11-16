import { Sequelize, DataTypes } from "sequelize";
import { sequelize } from "../database/database.js";

export const CopiasLibros = sequelize.define('copiaslibros', {
  copia_id: {
    primaryKey: true,
    type: DataTypes.UUID,
    allowNull: false,
    defaultValue: Sequelize.UUIDV4
  },
  libro_id: {
    type: DataTypes.UUID,
    allowNull: true,
  },
  estado_copia: {
    type: DataTypes.TEXT,
    allowNull: true,
  },
  ubicacion: {
    type: DataTypes.TEXT,
    allowNull: true,
  }
}, {
  tableName: 'copiaslibros',
  timestamps: false,
  freezeTableName: true
});
