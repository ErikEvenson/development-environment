'use strict';

var 
  chai = require('chai');

var
  expect = chai.expect;

chai.use(require('sinon-chai'));
chai.use(require('chai-as-promised'));

describe('GET /organizations/:organizationId', function() {
  context('The organization exists', function() {
    it('will respond with a 200 code');
    describe('will respond with a HAL document for the organization', function() {
      // TBD
    });
  });

  context('The organization does not exists', function () {
    it('will respond with a 404 code');
  });

  context('The organization subsystem is down', function () {
    it('will respond with a 500 code');
  });
});
