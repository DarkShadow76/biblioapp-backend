import { Router } from 'express';
import {
    getLibro,
    getLibros,
    deleteLibro,
    createLibro,
    updateLibro,
} from '../controllers/libro.controller.js';

const router = Router();

router.get("/libros", getLibros);
router.get("/libro/:id", getLibro);
router.post("/libro", createLibro);
router.put("/libro/:id", updateLibro);
router.delete("/libro/:id", deleteLibro);

export default router;
