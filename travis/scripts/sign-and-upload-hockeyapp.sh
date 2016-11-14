#!/bin/sh
set -e

# travis still does not exposes commit messages...
# https://github.com/travis-ci/travis-build/pull/189
# https://github.com/travis-ci/docs-travis-ci-com/pull/5

# Advanced Bash-Scripting Guide: 7.3. Other Comparison Operators
# http://www.tldp.org/LDP/abs/html/comparison-ops.html

# COMMIT_RELEASE_MESSAGE="[ci release]"
# COMMIT_RELEASE_FORCE=0
# if [ "${TRAVIS_COMMIT_MESSAGE/$COMMIT_RELEASE_MESSAGE}" = ${TRAVIS_COMMIT_MESSAGE} ]; then
#   COMMIT_RELEASE_FORCE=0
# else
#   echo "Forcing HockeyApp deployment due to '$COMMIT_RELEASE_MESSAGE' present in commit message."
#   COMMIT_RELEASE_FORCE=1
# fi

if [ "$TRAVIS_PULL_REQUEST" != "false" ]; then
  echo "This is a pull request. No HockeyApp deployment will be done."
  exit 0
fi
if [ -z "$TRAVIS_TAG" ]; then
  echo "This is not a tag. No HockeyApp deployment will be done."
  exit 0
fi
if [ "$BUILD_ENVIRONMENT" != "$HOCKEYAPP_BUILD_ENVIRONMENT" ]; then
  echo "Not building $HOCKEYAPP_BUILD_ENVIRONMENT environment. Not HockeyApp deployment will be done."
  exit 0
fi


# HockeyApp upload

HOCKEYAPP_RELEASE_DATE=`date '+%Y-%m-%d %H:%M:%S'`
HOCKEYAPP_RELEASE_NOTES="Build: $TRAVIS_BUILD_NUMBER - Uploaded: $HOCKEYAPP_RELEASE_DATE"

HOCKEYAPP_IPA_PATH="$BUILD_ASSETS_PATH/build.ipa"
HOCKEYAPP_DSYM_PATH="$BUILD_PATH/archive.xcarchive/dSYMs/$APP_PRODUCT_NAME.app.dSYM"
HOCKEYAPP_DSYM_ZIP_PATH="$BUILD_PATH/$APP_PRODUCT_NAME.app.dSYM.zip"

zip -r -9 "$HOCKEYAPP_DSYM_ZIP_PATH" "$HOCKEYAPP_DSYM_PATH"

curl https://rink.hockeyapp.net/api/2/apps/upload \
  -F status="2" \
  -F notify="2" \
  -F notes="$HOCKEYAPP_RELEASE_NOTES" \
  -F notes_type="0" \
  -F ipa="@$HOCKEYAPP_IPA_PATH" \
  -F dsym="@$HOCKEYAPP_DSYM_ZIP_PATH" \
  -F tags="$HOCKEYAPP_DISTRIBUTION_TAGS" \
  -H "X-HockeyAppToken: $HOCKEYAPP_API_TOKEN"


# Options used for API:
# from http://support.hockeyapp.net/kb/api/api-apps

# status - optional, download status (can only be set with full-access tokens):
# 1 to not allow users to download the version
# 2 to make the version available for download

# notify - optional, notify testers (can only be set with full-access tokens):
# 0 to not notify testers
# 1 to notify all testers that can install this app
# 2 - Notify all testers

# notes_type - optional, type of release notes:
# 0 for Textile
# 1 for Markdown
