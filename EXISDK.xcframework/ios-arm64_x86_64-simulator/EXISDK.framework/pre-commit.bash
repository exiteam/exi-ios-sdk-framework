#!/bin/bash
echo “Running pre-commit hook”
swiftlint --fix
xcodebuild \
  -workspace EXISDK.xcworkspace \
  -scheme EXISDK\ iOS \
  -derivedDataPath Build\
  -sdk iphonesimulator \
  -destination 'platform=iOS Simulator,name=iPhone 13' \
  -enableCodeCoverage YES clean test | xcpretty --test --color
if [ $? -ne 0 ]; then
 echo “Tests must pass before commit!”
 exit 1
fi
         
