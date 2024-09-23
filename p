<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Neo Four Security</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <header>
        <h1>Welcome to Neo Four Security</h1>
        <img src="capibara-logo.png" alt="Capibara Logo" />
    </header>

    <nav>
        <ul>
            <li><a href="#home">Home</a></li>
            <li><a href="#register">Register</a></li>
            <li><a href="#about">About Us</a></li>
            <li><a href="#info">Cybersecurity Info</a></li>
            <li><a href="#neo-ai">Neo AI</a></li>
        </ul>
    </nav>

    <main id="content"></main>

    <script src="app.js"></script>
</body>
</html>
body {
    font-family: Arial, sans-serif;
    background-color: #f0f0f0;
    color: #333;
    text-align: center;
}

header img {
    width: 150px;
    margin-top: 20px;
}

nav ul {
    list-style-type: none;
    padding: 0;
    background-color: #333;
}

nav ul li {
    display: inline;
    padding: 15px;
}

nav ul li a {
    color: white;
    text-decoration: none;
    padding: 10px;
}

nav ul li a:hover {
    background-color: #555;
}
document.addEventListener("DOMContentLoaded", function() {
    const content = document.getElementById('content');

    function loadHome() {
        content.innerHTML = "<h2>Welcome to Neo Four Security!</h2><p>Learn all about cybersecurity with our AI, Neo, and keep your data safe.</p>";
    }

    function loadRegister() {
        content.innerHTML = `
            <h2>Register</h2>
            <form id="registerForm">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" required><br><br>
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required><br><br>
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required><br><br>
                <input type="submit" value="Register">
            </form>
        `;
    }

    function loadAbout() {
        content.innerHTML = "<h2>About Us</h2><p>We are committed to providing the best information on cybersecurity in a friendly, easy-to-understand format.</p>";
    }

    function loadInfo() {
        content.innerHTML = "<h2>Cybersecurity Information</h2><p>Here you will find tips and techniques on how to stay safe online.</p>";
    }

    function loadNeoAI() {
        content.innerHTML = "<h2>Meet Neo, our AI</h2><p>Neo is here to help you learn about cybersecurity. Ask Neo any questions!</p>";
    }

    // Event listeners for navigation
    document.querySelector('nav ul').addEventListener('click', function(event) {
        const target = event.target.textContent;
        if (target === 'Home') loadHome();
        else if (target === 'Register') loadRegister();
        else if (target === 'About Us') loadAbout();
        else if (target === 'Cybersecurity Info') loadInfo();
        else if (target === 'Neo AI') loadNeoAI();
    });

    // Load home by default
    loadHome();
});
const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');

const app = express();
app.use(bodyParser.json());
app.use(cors());

let users = [];

// Endpoint for registering users
app.post('/api/register', (req, res) => {
    const { name, email, password } = req.body;
    const user = { name, email, password };
    users.push(user);
    res.status(200).send({ message: 'User registered successfully!' });
});

// Endpoint for user login
app.post('/api/login', (req, res) => {
    const { email, password } = req.body;
    const user = users.find(u => u.email === email && u.password === password);
    if (user) {
        res.status(200).send({ message: 'Login successful!' });
    } else {
        res.status(400).send({ message: 'Invalid credentials' });
    }
});

app.listen(3000, () => {
    console.log('Server running on port 3000');
});
const { Configuration, OpenAIApi } = require("openai");

const configuration = new Configuration({
    apiKey: process.env.OPENAI_API_KEY,
});

const openai = new OpenAIApi(configuration);

app.post('/api/neo', async (req, res) => {
    const { question } = req.body;

    try {
        const response = await openai.createCompletion({
            model: "text-davinci-003",
            prompt: `Answer the following question about cybersecurity: ${question}`,
            max_tokens: 150,
        });

        res.status(200).send({ answer: response.data.choices[0].text });
    } catch (error) {
        res.status(500).send({ error: 'Failed to fetch response from AI' });
    }
});
const mongoose = require('mongoose');

mongoose.connect('mongodb://localhost:27017/neo-four-security', {
    useNewUrlParser: true,
    useUnifiedTopology: true,
});

const userSchema = new mongoose.Schema({
    name: String,
    email: String,
    password: String,
});

const User = mongoose.model('User', userSchema);

app.post('/api/register', async (req, res) => {
    const { name, email, password } = req.body;
    const user = new User({ name, email, password });
    await user.save();
    res.status(200).send({ message: 'User registered successfully!' });
});
git init
git add .
git commit -m "Initial commit for Neo Four Security"
git remote add origin https://github.com/tu-usuario/neo-four-security.git
git push -u origin master
