#!/usr/bin/node
/* config server */

/* import express */
const express = require('express');
const { urlencoded } = require('express');
/* import cors */
var cors = require('cors');
/* import morgan */
const morgan =  require("morgan");
/* import path */
const path = require('path');
/* import http-errors */
var createError = require('http-errors');
/* favicon */
var favicon = require('serve-favicon')
/* port assignment */
const port = 9000 || process.env.PORT;

const routesProject = require('./routes/index');
/* eject express */
const app = express();

/* serttings */
app.set('views', path.join(__dirname, 'views'))
/*configured to write html tag, to be rendered with ejs*/
app.engine('html', require('ejs').renderFile);
app.set('view engine', 'ejs');
/*Response Dev Status*/
app.use(morgan('dev'));

/* middlewares */
app.use(cors());
app.use(express.json());
/* receive information from the form */
app.use(express.urlencoded({ extended: false }))
app.use(favicon(path.join(__dirname, 'public/images', 'favicon.ico')))
/* routes */
//app.use(require('./routes/index'))
app.use('/', routesProject);

/* static files */
app.use(express.static(path.join(__dirname, 'public')));

// catch 404 and forward to error handler
app.use(function(req, res, next) {
    next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
    // set locals, only providing error in development
    res.locals.message = err.message;
    res.locals.error = req.app.get('env') === 'development' ? err : {};

    // render the error page
    res.status(err.status || 500);
    res.render('error.html', { title: '@Ricardo1470' });
});

/* listen server on port */
app.listen(port, function () {
    console.log(`CORS-enabled, web server listening on port: ${port}`)
});
