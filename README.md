EXAMPLE
=================

Global Dev Requirements
-------------
  * npm (http://nodejs.org/)
  * gulp
  * styledown
  * uglifyjs
  * stylint
  * nodemon

Install
-------------
First install all global requirements if not already on system

```
npm install -g gulp styledown uglifyjs stylint
cd $new-project-name
npm install
npm install nodemon@1.3.7
npm install gulp-webserver
```

Run
-------------

```
cd $new-project-name

open gulpfile.js file
change you IP address and port
  eg.
    gulp.task('webserver', function(){
     gulp.src('./')
     .pipe(webserver({
       port: 80,// port
       host: '192.168.1.25',// IP
       liveload: true,
       directoryListing: {
         path: './',
         enable: true
       }
     }))
    });
    
gulp webserver
```

Styleguide
-------------
Stylus files need to be documented so that the style guide can be automatically generated. We use a very simple generator which does all the heavy lifting called [Styledown](https://github.com/styledown/styledown). 
```
npm run style # generates updated style guide
```

Git Standards
--------------
- Please use proper commit message being consistent with either the present or past tense. You may use the continuous tense in cases where you are committing to an unfinished feature.  
- A proper commit message must have a noun and a verb. A commit like "update" is not good. Instead "Update _carousel.styl header"  
- Fixed issues should have issue # in commit message  
- Do NOT merge anything to `master`  
  

