import app from "./app.js";
import { sequelize } from "./database/database.js";

const PUERTO = 4447

async function main() {
  try {
    await sequelize.sync()
    app.listen(PUERTO, () => {
      console.log(`Servidor web iniciado en puerto ${PUERTO}`)
    });
  } catch (error) {
    console.error('Unable to connect to the database:', error);
  }
}

main();