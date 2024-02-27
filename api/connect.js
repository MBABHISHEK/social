import mysql from "mysql";

export const db = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "abhishek@2003@sql",
  database: "social",
});
db.connect((err) => {
  if (err) {
    console.error("Error connecting to database:", err);
    return;
  }
  console.log("Connected to database successfully");
});

// Handle errors during the connection
db.on("error", (err) => {
  console.error("Database connection error:", err);
});
