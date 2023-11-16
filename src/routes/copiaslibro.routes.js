import { Router } from 'express';
import {
    getCopiaLibro,
    getCopiasLibros,
    deleteCopiaLibro,
    createCopiaLibro,
    updateCopiaLibro,
} from '../controllers/copiaslibros.controller.js';

const router = Router();

router.get("/copiaslibros", getCopiasLibros);
router.get("/copiaLibro/:id", getCopiaLibro);
router.post("/copiaLibro", createCopiaLibro);
router.put("/copiaLibro/:id", updateCopiaLibro);
router.delete("/copiaLibro/:id", deleteCopiaLibro);

export default router;
