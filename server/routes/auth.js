const express = require("express");

const authRouter = express.Router();

authRouter.get('/user', (req, res) => {
	req.json({mes: "Success"});
});

// https://www.youtube.com/watch?v=O3nmP-lZAdg&list=PLlzmAWV2yTgCjoZNF3hLX3puYJir9vSQO