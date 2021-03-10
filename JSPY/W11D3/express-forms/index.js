const express = require('express');

const app = express();

app.set('view engine', 'pug');

const guests = [];

app.get('/', (req, res) => {
  res.render('index', { title: "Guest List", guests});
});

const port = 8081;

app.listen(port, () => console.log(`App is listening on port ${port}...`));