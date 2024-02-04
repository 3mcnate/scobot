const app = require("express")();
const PORT = process.env.PORT || 8080;

app.get("/tshirt", (request, response) => {
    response.status(200).send({
        color: "blue",
        size: "L",
    });
});

app.post("/tshirt/:id");

app.listen(PORT, () => console.log(`Alive on http://localhost:${PORT}`));
