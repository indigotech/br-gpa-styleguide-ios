#!/bin/sh
set -e


if [ "$BUILD_ENVIRONMENT" != "$BUILD_ENVIRONMENT_STAGING" ]; then
  exit 0
fi

echo "Building staging version, appending build id to app version number..."

BUILD_PLIST_NUMBER=$(/usr/libexec/PlistBuddy -c "Print :CFBundleVersion" "$APP_PLIST_PATH")
BUILD_NUMBER="$BUILD_PLIST_NUMBER.$TRAVIS_BUILD_NUMBER"

echo "Build version is '$BUILD_PLIST_NUMBER' and will be changed to '$BUILD_NUMBER'"

/usr/libexec/PlistBuddy -c "Set :CFBundleVersion $BUILD_NUMBER" "$APP_PLIST_PATH"
/usr/libexec/PlistBuddy -c "Set :CFBundleShortVersionString $BUILD_NUMBER" "$APP_PLIST_PATH"
