# Gitignore Templates

Here are the standard `.gitignore` templates for Flutter and Vue projects.

## Flutter

```gitignore
# Miscellaneous
*.class
*.log
*.pyc
*.swp
.DS_Store
.atom/
.buildlog/
.history
.svn/

# IntelliJ
*.iml
*.ipr
*.iws
.idea/

# The .vscode folder contains launch configuration and tasks you configure in
# VS Code which you may wish to be included in version control, so this line
# is commented out by default.
#.vscode/

# Flutter/Dart/Pub
.dart_tool/
.flutter-plugins
.flutter-plugins-dependencies
.packages
.pub-cache/
.pub/
/build/

# Android Studio
.gradle
.navigation/
captures/
externalNativeBuild/

# Android
android/app/libs/
android/app/src/main/assets/
android/app/src/main/jniLibs/
android/app/src/main/obj/
android/code_cache/
android/gen/
android/local.properties
android/out/
android/project.properties

# iOS
ios/Flutter/App.framework
ios/Flutter/Flutter.framework
ios/Flutter/Generated.xcconfig
ios/Flutter/app.flx
ios/Flutter/app.zip
ios/Flutter/flutter_assets/
ios/Podfile.lock
ios/Pods/
ios/Runner/GeneratedPluginRegistrant.h
ios/Runner/GeneratedPluginRegistrant.m
ios/dSYM/

# Linux
linux/flutter/ephemeral/

# MacOS
macos/Flutter/ephemeral/
macos/Pods/
macos/Podfile.lock

# Web
web/icons/Icon-192.png
web/icons/Icon-512.png
web/favicon.png

# Windows
windows/flutter/ephemeral/
```

## Vue (Node/Frontend)

```gitignore
.DS_Store
node_modules/
/dist/

# local env files
.env.local
.env.*.local

# Log files
npm-debug.log*
yarn-debug.log*
yarn-error.log*
pnpm-debug.log*

# Editor directories and files
.idea
.vscode
*.suo
*.ntvs*
*.njsproj
*.sln
*.sw?

# Testing
/coverage/
.nyc_output/
```
