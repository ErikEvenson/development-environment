/**
 * Provides gulp default tasks.
 *
 * @param {object} gulp - The gulp object.
 * @param {object} config - The configuration object.
*/
module.exports = function(gulp, config) {
  gulp.task('default',
    function() {
      console.log("DEFAULT");
    }
  );
};
