#!/bin/bash

# Fail on any error.
set -e

# Display commands being run.
# WARNING: please only enable 'set -x' if necessary for debugging, and be very
#  careful if you handle credentials (e.g. from Keystore) with 'set -x':
#  statements like "export VAR=$(cat /tmp/keystore/credentials)" will result in
#  the credentials being printed in build logs.
#  Additionally, recursive invocation with credentials as command-line
#  parameters, will print the full command, with credentials, in the build logs.
# set -x
if ! command which flutter &> /dev/null
then
  echo "Before git clone"
   git clone https://github.com/flutter/flutter.git -b stable
    echo "Before export path"
   export PATH="$PATH:./flutter/bin"
    echo "After export path"
fi

#flutter precache
#flutter doctor
 echo "Before flutter create"
flutter create .
if [ "$1" == "release" ]; then
  flutter analyze
else
    flutter analyze
fi
echo "Before flutter test"
flutter test
result=$?
if $result != 0; then
  echo "Failed some test cases"
  exit 1
fi
 exit 0