import express from "express";
import dotenv from "dotenv";
import mongoose from "mongoose";
import authRoutes from './routes/auth.js'

// Configurations
dotenv.config();
const app = express();

// Load Routes
app.use(express.json());
app.use('/auth', authRoutes);

// Database Setup
const PORT = process.env.PORT || '8000'
mongoose.connect(process.env.MONGO_URL).then(() => {
    app.listen(PORT, "0.0.0.0", () => {
        console.log(`Server listening at ${PORT}`)
    })
}).catch((err) => {
    console.log(err);
})