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
        .pipe(uglify({ outSourceMap: true }))
        .pipe(rename((path) ->

            if (path.extname != '.js') 
                return path;
                
            path.basename += ".min";

            return path
        ))
        .pipe(gulp.dest("dist"))
    

gulp.task 'default', ->
    runSequence(
        ['clean', 'compress']
    )

