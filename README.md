# reactnativeprojectios


Its running project.


If you're facing issues with fishhook.h and RCTValueAnimatedNode.h, you might want to try put the following snippet inside a shell script and running it from your project's root directory. Add it to package.json's postinstall hook to make it run on every yarn install


#!/bin/bash

sed -i '' 's#<fishhook/fishhook.h>#\"fishhook.h\"#g' ./node_modules/react- native/Libraries/WebSocket/RCTReconnectingWebSocket.m sed -i '' 's/#import <RCTAnimation\/RCTValueAnimatedNode.h>/#import \"RCTValueAnimatedNode.h\"/' ./node_modules/react- native/Libraries/NativeAnimation/RCTNativeAnimatedNod esManager.h

# Reference: https://github.com/facebook/react-native/issues/13198#issuecomment-328758950



Dev.xcconfig

include pod path to load all pod file.
