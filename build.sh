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
echo "Build start"
#if ! command which flutter &> /dev/null
#then
  echo "Before git clone"
   git clone https://github.com/flutter/flutter.git -b stable
    echo "Before export path"
   export PATH="$PATH:./flutter/bin"
    echo "After export path"
#fi
if [ "$1" == "release" ]; then
  echo "Build if"
else
  echo "Build else"
fi
pwd
flutter create .
#flutter analyze
flutter test
#flutter test
echo "Build end"