#!/bin/bash

export PATH="$PATH:$HOME/development/flutter/bin"
export PATH="$PATH:$HOME/development/bundletool"

# BUNDLE_TOOL
function gen:apks() {
    java -jar ~/development/bundletool-all-0.13.3.jar build-apks --bundle="~/bargetir/mobile_app/build/app/outputs/bundle/release/app-release.aab" --output="~/bargetir/mobile_app/build/app/outputs/bundle/release/app-release.apks" --ks="~/development/release.keystore" --ks-key-alias=com.flirtwish
}
