var gulp    = require('gulp'),
    sass    = require('gulp-sass'),
    minify  = require('gulp-minify-css'),
    uglify  = require('gulp-uglify'),
    rename  = require('gulp-rename');

// on definit les chemins de l'application dans un json

var path={
    'resources': {
        'sass': './resources/assets/sass/'
    },
    'public': {
        'css': './public/assets/css' // chemin a créer sois-même
    },
    'sass': './resources/assets/sass/**/*.scss',// tous les fichiers et sous dossiers d'extension .scss
};

gulp.task('task_app_sass', function()
{
    return gulp.src(path.resources.sass+'/app.scss')
        .pipe(sass({onError: console.error.bind(console,'SASS ERROR')}))
        .pipe(minify())
        .pipe(rename({suffix: '.min'}))
        .pipe(gulp.dest(path.public.css))

});

gulp.task('task_knacss_sass', function()
{
    return gulp.src(path.resources.sass+'/knacss/sass/knacss.scss')
        .pipe(sass({onError: console.error.bind(console,'SASS ERROR')}))
        .pipe(minify())
        .pipe(rename({suffix: '.min'}))
        .pipe(gulp.dest(path.public.css));


});

gulp.task('watch', function(){
    gulp.watch(path.sass, ['task_app_sass', 'task_knacss_sass']);
    // gulp.watch(path.sass, ['js_task']); // on peut aussi lancer d'autres task
});

// gulp.task('default',['watch']); // on peut en lancer plusieurs par défaut ['watch', 'phpunit']