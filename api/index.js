import express from "express";
import morgan from "morgan";
import cors from "cors";
import cookieParser from "cookie-parser";

const app = express();

//adding middlewares that is exrpess.json
app.use(express.json());

//importing routers
import userRoutes from "./routes/users.js";
import postRoutes from "./routes/posts.js";
import likeRoutes from "./routes/likes.js";
import authRoutes from "./routes/auth.js";
import commentRoutes from "./routes/users.js";

//to console the request
app.use(morgan("tiny"));
app.use(
  cors({
    origin: "http://localhost:3000", // Allow requests from this origin
    credentials: true, // Allow credentials (cookies, HTTP authentication) to be included in requests
  })
);
app.use(cookieParser());

//to use routers
app.use("/api/users", userRoutes);
app.use("/api/posts", postRoutes);
app.use("/api/likes", likeRoutes);
app.use("/api/auth", authRoutes);
app.use("/api/comment", commentRoutes);

app.listen(8800, () => {
  console.log("API is working");
});
