#!/bin/bash

ADB_PATH="/usr/local/share/android-sdk/platform-tools/adb"
DEVICE_ORDER=1

randy() {
    case "$1" in
        menu) menu ;;
        reload) reload ;;
        ss) take_screenshot ;;
    esac
}

menu() {
    # adb -s $(adb devices -l | awk 'FNR == 2 {print $1}') shell input keyevent KEYCODE_MENU
    DEVICE_INDEX=$DEVICE_ORDER+1
    DEVICE_ID="${ADB_PATH} devices -l | awk 'FNR == ${DEVICE_INDEX} {print \$1}'"
    CMD="${ADB_PATH} -s $(eval $DEVICE_ID) shell input keyevent KEYCODE_MENU";
    eval $CMD;
}

reload() {
    DEVICE_INDEX=$DEVICE_ORDER+1
    DEVICE_ID="${ADB_PATH} devices -l | awk 'FNR == ${DEVICE_INDEX} {print \$1}'"
    CMD="${ADB_PATH} -s $(eval $DEVICE_ID) shell input text \"RR\"";
    eval $CMD;
}

take_screenshot() {
    DEVICE_INDEX=$DEVICE_ORDER+1
    DEVICE_ID="${ADB_PATH} devices -l | awk 'FNR == ${DEVICE_INDEX} {print \$1}'"
    TIMESTAMP=$(date +%s) 
    CMD="${ADB_PATH} -s $(eval $DEVICE_ID) exec-out screencap -p > ${HOME}/Desktop/SS_${TIMESTAMP}.png";
    eval $CMD;
}
