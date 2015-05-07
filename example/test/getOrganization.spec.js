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
});
