const express = require('express')
const router = express.Router();

router.post("/:endpoint", (req, res) => {
    const { endpoint } = req.params.endpoint;
    if (endpoint === process.env.WEBHOOK_ENDPOINT) {
        console.log(req.body);
        res.status(200).send();
    }
    else {
        res.status(404).send();
    }
});

module.exports = router;
