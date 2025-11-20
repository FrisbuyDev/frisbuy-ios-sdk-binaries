
#!/bin/sh

# -------------- config --------------

# Uncomment for debugging
set -x

# Set bash script to exit immediately if any commands fail
set -e

moduleName="FrisbuyStoriesSDK"

iphoneosArchiveDirectoryPath="/$moduleName-iphoneos.xcarchive"
iphoneosArchiveDirectory="$( pwd; )$iphoneosArchiveDirectoryPath"

iphoneosArchiveDirectoryPath="/$moduleName-iphonesimulator.xcarchive"
iphoneosSimulatorDirectory="$( pwd; )$iphoneosArchiveDirectoryPath"

outputDirectory="$( pwd; )/$moduleName.xcframework"

## Cleanup
rm -rf $iphoneosArchiveDirectory
rm -rf $iphoneosSimulatorDirectory
rm -rf outputDirectory

# Archive
xcodebuild archive -scheme $moduleName \
     -archivePath $iphoneosArchiveDirectory \
     -sdk iphoneos \
     IPHONEOS_DEPLOYMENT_TARGET=14.0 \
     SKIP_INSTALL=NO BUILD_LIBRARIES_FOR_DISTRIBUTION=YES
     OTHER_SWIFT_FLAGS="-swift-version 5"
xcodebuild archive -scheme $moduleName \
     -archivePath $iphoneosSimulatorDirectory \
     -sdk iphonesimulator \
     IPHONEOS_DEPLOYMENT_TARGET=14.0 \
     SKIP_INSTALL=NO BUILD_LIBRARIES_FOR_DISTRIBUTION=YES
     OTHER_SWIFT_FLAGS="-swift-version 5"
## XCFramework
xcodebuild -create-xcframework \
    -framework "$iphoneosArchiveDirectory/Products/Library/Frameworks/$moduleName.framework" \
    -framework "$iphoneosSimulatorDirectory/Products/Library/Frameworks/$moduleName.framework" \
    -output $outputDirectory

## Cleanup
rm -rf $iphoneosArchiveDirectory
rm -rf $iphoneosSimulatorDirectory
