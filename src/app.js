import express from 'express';
import usuarioRoutes from './routes/usuario.routes.js';
import autorRoutes from './routes/autor.routes.js';
import defaultRoutes from './routes/default.routes.js';
const app = express();

// Middlewares
app.use(express.json());
app.use(usuarioRoutes);
app.use(autorRoutes);
app.use(defaultRoutes)
//app.use(reservaRoutes);

export default app;