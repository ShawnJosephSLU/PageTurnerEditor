import QtQuick

Rectangle {

    color: "#f5f5f5"
    property bool isOpened;

    RightSeperator {}

    width: isOpened ? 300 : 0

    Behavior on width {

        NumberAnimation {

            duration: 200
            easing.type: Easing.InOutQuad
        }

    }

}
