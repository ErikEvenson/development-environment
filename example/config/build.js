/**
 * Provides build parameters.
*/
var
  buildConfig = {};
  path = require('path');

buildConfig = {
  // basepath is the path to the root directory of the project.
  basepath: path.join(__dirname, '..'),

  // testFiles is an array of sources for test files.
  testFiles: {
    build: [],
    client: [],
    server: ['./server/**/*.spec.js']
  }
};

/** @param {Object} module.exports - Export build configuration. */
module.exports = buildConfig;
