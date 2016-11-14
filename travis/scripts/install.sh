#!/bin/sh
set -e

gem install cocoapods -v 0.35.0
pod --version
pod install
