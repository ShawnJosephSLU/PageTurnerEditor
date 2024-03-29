import QtQuick

Rectangle {

    property bool isOpened;

    LeftSeperator { }
    color: "#f5f5f5"

    width: isOpened ? 300 : 0

    Behavior on width {

        NumberAnimation {

            duration: 200
            easing.type: Easing.InOutQuad
        }

    }

}
