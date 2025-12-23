# Gitignore Templates

Here are the standard `.gitignore` templates for Flutter and Vue projects.

## Java
```gitignore
target/

### IntelliJ IDEA ###
.idea/*
**/.idea/*
.idea/modules.xml
.idea/jarRepositories.xml
.idea/compiler.xml
.idea/libraries/
*.iws
*.iml
*.ipr

### Eclipse ###
.apt_generated
.classpath
.factorypath
.project
.settings
.springBeans
.sts4-cache

### VS Code ###
.vscode/

### Mac OS ###
.DS_Store

### .env files contain local environment variables ###
.env

# Maven ignore
.flattened-pom.xml

# node_modules
**/node_modules

# Generated Files
spring-ai-alibaba-examples/playground-flight-booking/frontend/generated/
spring-ai-alibaba-examples/playground-flight-booking/src/main/bundles/
/spring-ai-alibaba-examples/playground-flight-booking-example/
**/spring-ai-alibaba-jmanus/extensions/*
**/venv/*
**/spring-ai-alibaba-jmanus/h2-data/*
**/playwright/*
spring-ai-alibaba-jmanus/ui-vue3/pnpm-lock.yaml


# windows os
/extensions/
/h2-data/

# checkstyle report files
**/checkstyle-report.xml
**/logs/*

# SpecStory files - ignore entire .specstory directory
.specstory/
.specstory/.what-is-this.md
.specstory/history/*

# MCP configuration files
modified_mcp_config.json
.cursorindexingignore

# ignore code copilot local index
.idea/LocalCodeIndex/

**/spans.json

.checkstyle

```

## Python
```gitignore
.vs/
.claude/
.idea/
#Emacs backup
*~
# Byte-compiled / optimized / DLL files
__pycache__/
*.py[cod]
*$py.class

# C extensions
*.so

# Distribution / packaging
.Python
build/
develop-eggs/
dist/
downloads/
eggs/
.eggs/
lib/
lib64/
parts/
sdist/
var/
wheels/
pip-wheel-metadata/
share/python-wheels/
*.egg-info/
.installed.cfg
*.egg
MANIFEST

# Google GitHub Actions credentials files created by:
# https://github.com/google-github-actions/auth
#
# That action recommends adding this gitignore to prevent accidentally committing keys.
gha-creds-*.json

# PyInstaller
#  Usually these files are written by a python script from a template
#  before PyInstaller builds the exe, so as to inject date/other infos into it.
*.manifest
*.spec

# Installer logs
pip-log.txt
pip-delete-this-directory.txt

# Unit test / coverage reports
htmlcov/
.tox/
.nox/
.coverage
.coverage.*
.cache
nosetests.xml
coverage.xml
*.cover
*.py,cover
.hypothesis/
.pytest_cache/
.codspeed/

# Translations
*.mo
*.pot

# Django stuff:
*.log
local_settings.py
db.sqlite3
db.sqlite3-journal

# Flask stuff:
instance/
.webassets-cache

# Scrapy stuff:
.scrapy

# PyBuilder
target/

# Jupyter Notebook
.ipynb_checkpoints
notebooks/

# IPython
profile_default/
ipython_config.py

# pyenv
.python-version

# pipenv
#   According to pypa/pipenv#598, it is recommended to include Pipfile.lock in version control.
#   However, in case of collaboration, if having platform-specific dependencies or dependencies
#   having no cross-platform support, pipenv may install dependencies that don't work, or not
#   install all needed dependencies.
#Pipfile.lock

# PEP 582; used by e.g. github.com/David-OConnor/pyflow
__pypackages__/

# Celery stuff
celerybeat-schedule
celerybeat.pid

# SageMath parsed files
*.sage.py

# Environments
.env
.envrc
.venv*
venv*
env/
ENV/
env.bak/

# Spyder project settings
.spyderproject
.spyproject

# Rope project settings
.ropeproject

# mkdocs documentation
/site

# mypy
.mypy_cache/
.mypy_cache_test/
.dmypy.json
dmypy.json

# Pyre type checker
.pyre/

# macOS display setting files
.DS_Store

# Wandb directory
wandb/

# asdf tool versions
.tool-versions
/.ruff_cache/

*.pkl
*.bin

# integration test artifacts
data_map*
\[('_type', 'fake'), ('stop', None)]

# Replit files
*replit*

node_modules

prof
virtualenv/
scratch/

.langgraph_api/


```

## Go
```gitignore
# Binaries for programs and plugins
*.exe
*.exe~
*.dll
*.so
*.dylib

# Test binary, built with `go test -c`
*.test

# Output of the go coverage tool, specifically when used with LiteIDE
*.out

# Dependency directories (remove the comment below to include it)
# vendor/

# Go workspace file
go.work

# IDEs
.idea/
.vscode/
*.swp
*.swo

# OS
.DS_Store
Thumbs.db

```

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
