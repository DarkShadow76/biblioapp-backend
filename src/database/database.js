import Sequelize from 'sequelize';

import * as dotenv from 'dotenv';
dotenv.config();

const RUTA = /*process.env.DATABASE_URL ||*/
  "postgres://postgres:postgres@localhost:5432/postgres"

export const sequelize = new Sequelize(RUTA);