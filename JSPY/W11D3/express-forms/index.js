const express = require('express');

const app = express();

app.set('view engine', 'pug');

const guests = [];

app.get('/', (req, res) => {
  res.render('index', { title: "Guest List", guests});
});

app.get('/guest', (req, res) => {
  res.render('guest-form', { title: "Guest Form" });
});

const port = 8081;

app.listen(port, () => console.log(`App is listening on port ${port}...`));