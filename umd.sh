#!/bin/bash

npm install
bower install
orig=`pwd`
cd bower_components/scribe-plugin-sanitizer
npm install
cd $orig

# PREPARES SCRIBE + SELECTED SUBSET OF PLUGINS FOR UMD

echo "" > build.js

browserify --global-transform deamdify --standalone Scribe . >> build.js
browserify --global-transform deamdify --standalone scribePluginBlockquoteCommand "bower_components/scribe-plugin-blockquote-command" >> build.js
browserify --global-transform deamdify --standalone scribePluginUnlink "bower_components/scribe-plugin-intelligent-unlink-command" >> build.js
browserify --global-transform deamdify --standalone scribePluginUnlink "bower_components/scribe-plugin-intelligent-unlink-command" >> build.js
browserify --global-transform deamdify --standalone scribePluginFormatterPlainTextConvertNewLinesToHtml "bower_components/scribe-plugin-formatter-plain-text-convert-new-lines-to-html" >> build.js
browserify --global-transform deamdify --standalone scribePluginSanitizer "bower_components/scribe-plugin-sanitizer" >> build.js
browserify --global-transform deamdify --standalone scribePluginHeadingCommand "bower_components/scribe-plugin-heading-command" >> build.js