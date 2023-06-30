import express from "express";
import { signup, signin, tokenIsValid, getUserData } from '../controllers/auth.js'
import { verifyauth } from "../middlewares/auth.js";

const router = express.Router();

router.post("/api/signup", signup);
router.post("/api/signin", signin);
router.get("/", verifyauth ,getUserData);
router.post("/tokenIsValid", tokenIsValid);

export default router;