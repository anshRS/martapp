import express from "express";
import { signup, signin } from '../controllers/auth.js'

const router = express.Router();

router.post("/api/signup", signup);
router.post("/api/signin", signin);

export default router;