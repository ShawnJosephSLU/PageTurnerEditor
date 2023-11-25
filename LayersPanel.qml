import QtQuick

Rectangle {

    property bool isOpened;

    RightSeperator {
        strokeColor: "#A0A0A0"
    }

    width: isOpened ? 300 : 0

    Behavior on width {

        NumberAnimation {

            duration: 200
            easing.type: Easing.InOutQuad
        }

    }

}
