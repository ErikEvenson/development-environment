/**
 * Provides gulp test tasks.
 *
 * @param {object} gulp - The gulp object.
 * @param {object} config - The configuration object.
*/
module.exports = function(gulp, config) {
  var 
    karma = require('karma').server,
    mocha = require('gulp-mocha'),
    path = require('path');

  gulp.task('test', function (done) {
    // karma.start({
    //   configFile: path.join(__dirname, '../karma.conf.js'),
    //   singleRun: true
    // }, done);

    return gulp.src(config.build.testFiles, {read: false})
      .pipe(mocha());

  });
};
