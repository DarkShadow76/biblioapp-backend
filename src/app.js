import express from 'express';
import usuarioRoutes from './routes/usuario.routes.js';
import libroRoutes from './routes/libro.routes.js';
import reservaRoutes from './routes/reserva.routes.js';

const app = express();

// Middlewares
app.use(express.json());
app.use(usuarioRoutes);
app.use(libroRoutes);
app.use(reservaRoutes);

export default app;