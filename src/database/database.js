import Sequelize from 'sequelize';

import * as dotenv from 'dotenv';
dotenv.config();

const RUTA = /*process.env.DATABASE_URL ||*/
// postgres://<USUARIO>:<PASSWORD>@<URL_HOST_BD>:<PUERTO_BD>/<NOMBRE_BD>
  "postgres://postgres:postgres@localhost:5432/libraryapp"

export const sequelize = new Sequelize(RUTA);