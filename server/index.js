// import from packages
const express = require("express");
const mongoose = require("mongoose");
// import from other files
const authRouter = require("./routes/auth.js");
// init
const PORT = 3000;
const app = express();
const DB = "mongodb+srv://muhammadskcsese:qwerty12@cluster0.isdfm83.mongodb.net/?retryWrites=true&w=majority";
// middleware
app.use(authRouter);
// connections
mongoose.connect(DB).then(
	() => {
		console.log('Connection successful');
	}
).catch(
	(e) => {
		console.log('Connection failed');
	} 
); 

app.listen( PORT, "0.0.0.0", () => {
	console.log(`connected at port ${PORT}`);
});
