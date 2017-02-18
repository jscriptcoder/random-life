require('./main.scss');

var Elm = require('../elm/Main');
var $main = document.getElementById('main');

$main.innerHTML = '';

Elm.Main.embed($main);
