#!/bin/sh
set -e

echo "Using 'xcodebuild' instead of 'xctool' beacuse of https://github.com/facebook/xctool/issues/242"

echo "Archiving $BUILD_ENVIRONMENT, this might take a while..."

# Xcodebuild is too verbose (even without the -verbose flag) and exceeds travis log limit size of 4.5MB, so we add it to an file and check if the command was successful, then if some error happened we can show the log filtered by the error flag...
xcodebuild -verbose -workspace $APP_WORKSPACE_FILE_NAME.xcworkspace -scheme "$APP_SCHEMA_BASE_NAME-$BUILD_ENVIRONMENT" -sdk iphoneos -configuration "Release-$BUILD_ENVIRONMENT" -archivePath $BUILD_PATH/archive.xcarchive archive > ./archive_log.txt

# Check if the last command (xcodebuild archive) ended successfully
BUILD_ERROR=`echo $?`
if [ $BUILD_ERROR -eq 0 ]
then
    echo "Archive OK."
else
    echo "Archive Error:"
    cat ./archive_log.txt | egrep -A 15 "(error|warning):"
    exit $BUILD_ERROR
fi

echo "Generating $BUILD_ENVIRONMENT IPA file, this might take a while..."

mkdir "$BUILD_ASSETS_PATH"

xcodebuild -verbose -exportArchive -exportFormat ipa -archivePath $BUILD_PATH/archive.xcarchive -exportPath $BUILD_ASSETS_PATH/build.ipa -exportProvisioningProfile "$PROFILE_NAME" > ./archive_log.txt

# Check if the last command (xcodebuild export) ended successfully
BUILD_ERROR=`echo $?`
if [ $BUILD_ERROR -eq 0 ]
then
    echo "$BUILD_ENVIRONMENT IPA generation OK."
else
    echo "$BUILD_ENVIRONMENT IPA generation Error:"
    cat ./archive_log.txt | egrep -A 15 "(error|warning):"
    exit $BUILD_ERROR
fi

zip -r -9 "$BUILD_ASSETS_PATH/archive.zip" "$BUILD_PATH/archive.xcarchive"
