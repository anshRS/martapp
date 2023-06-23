import express from "express";
import dotenv from "dotenv";
import mongoose from "mongoose";

// Configurations
dotenv.config();
const app = express();

// Database Setup
const PORT = process.env.PORT || '8000'
mongoose.connect(process.env.MONGO_URL).then(() => {
    app.listen(PORT, () => {
        console.log(`Server listening at ${PORT}`)
    })
}).catch((err) => {
    console.log(err);
})