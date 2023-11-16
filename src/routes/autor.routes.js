import { Router } from 'express';
import {
    getAutor,
    getAutores,
    deleteAutor,
    createAutor,
    updateAutor,
} from '../controllers/autor.controller.js';

const router = Router();

router.get("/autores", getAutores);
router.get("/autor/:id", getAutor);
router.post("/autor", createAutor);
router.put("/autor/:id", updateAutor);
router.delete("/autor/:id", deleteAutor);

export default router;