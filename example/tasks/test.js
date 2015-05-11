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

  gulp.task('test', ['test:build', 'test:client', 'test:server'], function() {});
  gulp.task('test:build', function() {});
  gulp.task('test:client', function() {});

  gulp.task('test:server', function() {
    return gulp.src(config.build.testFiles.server, {read: false})
      .pipe(mocha({
        reporter: 'spec',
        timeout : 500,
        ui      : 'bdd'
      }));

  });
};
