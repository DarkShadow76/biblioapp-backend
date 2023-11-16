import { Router } from "express";
import { fileURLToPath } from 'url';
import express from "express";
import path from "path";

const router = Router()
const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

router.use(express.static(path.join(__dirname, '../static')));
router.use(express.json());

router.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, '../static/index.html'));
});

export default router