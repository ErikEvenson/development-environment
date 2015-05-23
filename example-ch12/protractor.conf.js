exports.config = {
  capabilities: {
  browserName: 'phantomjs',
    'phantom.binary.path': '/usr/local/node/node-default/bin/phantomjs'
  },
  framework: 'mocha',
  specs: [
    'test/e2e/**/*.spec.js'
  ],
  mochaOpts: {
    enableTimeouts: false
  },
  onPrepare: function () {
    process.env.PORT = 3001
    require('./server')
  }
}
