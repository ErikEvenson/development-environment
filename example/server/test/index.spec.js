'use strict';

var
  currentSystem,
  express = require('express'),
  newRouteFor = require('../index'),
  server,
  sinon = require('sinon');

var
  app = express(),
  port = process.env.PORT || 3000;

before(function(cb) {
  this.organizationsBaseUri = '/organizations';
  app
    .use(this.organizationsBaseUri, newRouteFor.organizations({
      display: function() {
        return currentSystem.display.apply(currentSystem, arguments);
      }
    }))
    .listen(port, function() {
      server = this;
      // Note: arguments contains the arguments passed to this function, in this 
      // case a potential error produced by app.listen()
      cb.apply(this, arguments);
    });
});

beforeEach(function() {
  currentSystem = {
    display: sinon.stub()
  };
  this.system = currentSystem;
});

after(function(cb) {
  if (!server)
    return setImmediate(cb);
  server.close(cb);
});
