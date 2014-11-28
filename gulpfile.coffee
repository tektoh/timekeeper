gulp       = require 'gulp'
coffee     = require 'gulp-coffee'
uglify     = require 'gulp-uglify'
stylus     = require 'gulp-stylus'
jade       = require 'gulp-jade'
sourcemaps = require 'gulp-sourcemaps'
connect    = require 'gulp-connect'

gulp.task 'coffee', ->
  gulp.src './coffee/**/*.coffee'
    .pipe sourcemaps.init()
    .pipe coffee()
    .pipe uglify()
    .pipe sourcemaps.write('../maps')
    .pipe gulp.dest('./js')

gulp.task 'stylus', ->
  return gulp.src('./stylus/**/*.styl')
    .pipe sourcemaps.init()
    .pipe stylus({compress:yes})
    .pipe sourcemaps.write('../maps')
    .pipe gulp.dest('./css')

gulp.task 'jade', ->
  gulp.src './jade/**/*.jade'
    .pipe jade()
    .pipe gulp.dest('./html')

gulp.task 'connect', ->
  connect.server
    fallback: './html/index.html'

gulp.task 'watch', ->
  gulp.watch './coffee/**/*.coffee', (e) -> gulp.run('coffee')
  gulp.watch './stylus/**/*.styl', (e) -> gulp.run('stylus')
  gulp.watch './jade/**/*.jade', (e) -> gulp.run('jade')

gulp.task 'default', ['coffee','stylus', 'jade', 'connect', 'watch']