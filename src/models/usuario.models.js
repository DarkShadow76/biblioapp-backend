import { Sequelize, DataTypes } from "sequelize";
import { sequelize } from "../database/database.js";

export const usuario = sequelize.define('usuario', {
  usuario_id: {
    primaryKey: true,
    type: DataTypes.UUID,
    allowNull: false,
    defaultValue: Sequelize.UUIDV4
  },
  nombre: {
    type: DataTypes.TEXT,
    allowNull: false
  },
  apellido: {
    type: DataTypes.TEXT,
    allowNull: false
  },
  dni: {
    type: DataTypes.TEXT,
    allowNull: false,
    defaultValue: "7777777"
  },
  email: {
    type: DataTypes.TEXT,
    allowNull: false
  },
  contrasena: {
    type: DataTypes.TEXT,
    allowNull: false
  },
  telefono: {
    type: DataTypes.STRING(20),
    allowNull: false
  },
  direccion: {
    type: DataTypes.TEXT,
    allowNull: true
  },
  rol_usuario: {
    type: DataTypes.ENUM('root', 'manager', 'cliente'),
    allowNull: false,
  }
},
  {
    timestamps: false,
    freezeTableName: true
  }
);