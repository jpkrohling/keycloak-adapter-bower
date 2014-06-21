gulp = require 'gulp'
uglify = require 'gulp-uglify'
clean = require 'gulp-clean'
rename = require 'gulp-rename'
runSequence = require 'run-sequence'

gulp.task 'clean', ->
    return gulp.src("dist", {read: false})
        .pipe(clean())

gulp.task "compress", ->
    return gulp.src("keycloak/integration/js/src/main/resources/keycloak.js")
        .pipe(gulp.dest("dist"))
        .pipe(rename((path) ->
            path.basename += ".min";
            return path
        ))
        .pipe(uglify({ outSourceMap: true }))
        .pipe(gulp.dest("dist"))
    

gulp.task 'default', ->
    runSequence(
        ['clean', 'compress']
    )

