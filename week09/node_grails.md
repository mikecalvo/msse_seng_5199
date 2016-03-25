footer: © Citronella Software Ltd 2016
slidenumbers: true

# Bower and Angular in Grails

## Marc Kapke

### kapkema@gmail.com

---

# Gradle Bower Plugin
- Gradle manages Groovy library dependencies for Grails Projects
- The Gradle Bower Plugin integrates Gradle with Bower to provide web (JS and CSS) dependency management
- [https://github.com/craigburke/bower-installer-gradle](https://github.com/craigburke/bower-installer-gradle)

---

#Add plugins to build.gradle
```gradle
plugins {
  id "io.spring.dependency-management" version "0.5.4.RELEASE"
  id 'com.craigburke.bower-installer' version '2.5.1'
}
```
- run `./gradlew idea` to refresh dependencies

---
# Bower dependencies
- Use of bower to manage Javascript packages
- Use gradle to manage bower packages like Java (i.e maven)
- Angular and Bootstrap are a good start

---

#Add Angular and Bootstrap
- In build.gradle add bower block

```gradle
bower {

    'bootstrap'('3.3.x') {
        source 'dist/css/bootstrap.css' >> 'css/'
        source 'dist/css/bootstrap-theme.css' >> 'css/'
        source 'dist/fonts/**' >> 'fonts/'
        source 'dist/js/bootstrap.js'
        excludes 'jquery'
    }

    'angular'('1.3.x') {
        source 'angular.js'
        source 'angular-csp.css'
    }

}
```

---
# Build and 'install'
- `.gradlew bowerInstall` will add the mapped source files
- You should see files in the grails-app/assets/bower folder within the angular and bootstrap folders.

---
# Make it automatic
- Update your build.gradle to make `bowerInstall` and `bowerClean` a part of every build and clean
- Add the following right after your bower block

```gradle
compileJava.dependsOn bowerInstall
clean.dependsOn bowerClean
```
