import UserModel from "../models/User.js";
import bcryptjs from 'bcryptjs';
import jwt from "jsonwebtoken";

// Register
const signup = async (req, res) => {
    try {
        const { name, email, password } = req.body;

        const existingUser = await UserModel.findOne({ email });
        if (existingUser) {
            return res
                .status(400)
                .json({ msg: "User with same email already exists!" });
        }

        const salt = await bcryptjs.genSalt();
        const hashedPassword = await bcryptjs.hash(password, salt);

        let newUser = new UserModel({
            email,
            password: hashedPassword,
            name,
        })

        const savedUser = await newUser.save()
        res.status(200).json(savedUser)
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
}

// Signin 
const signin = async (req, res) => {
    try {
        const { email, password } = req.body;        

        const user = await UserModel.findOne({ email });
        
        if (!user) {
            return res
                .status(400)
                .json({ msg: "User with this email does not exist!" });
        }

        const isMatch = await bcryptjs.compare(password, user.password);
        if (!isMatch) {
            return res.status(400).json({ msg: "Incorrect password." });
        }

        const token = jwt.sign({ id: user._id }, process.env.JWT_SECRET);
        res.json({ token, ...user._doc });
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
}


export { signup, signin }