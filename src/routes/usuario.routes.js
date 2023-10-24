//const { Router} = require('express');
import { Router } from 'express';
import {
    getUsuario,
    getUsuarios,
    createUsuario,
    updateUsuario,
    deleteUsuario,
    getUsuariosByType
} from '../controllers/usuario.controller.js';

const router = Router();

router.get("/usuarios", getUsuarios);
router.get("/usuario/:id", getUsuario);
router.post("/usuario", createUsuario);
router.get("/usuarioOnTable", getUsuariosByType);
router.put("/usuario/:id", updateUsuario);
router.delete("/usuario/:id", deleteUsuario);

export default router;