import QtQuick
import QtQuick.Controls


Rectangle {
    anchors.fill: parent
    color: "transparent"

    Rectangle {
        width: 25
        height : 25
        color: "#efefef"
    }

    PaddedRectangle {
        id:topRuler
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.left: parent.left
        height : 25
        leftPadding: 25
        clip: true

        color: "#efefef"

        Rectangle {
            id: topRulerPointer
            color : "transparent"
            height: parent.height
            width: parent.height
            x: Math.max(topRuler.leftPadding / 2, Math.min(pageViewMouseArea.mouseX - (width / 2), topRuler.width - width - topRuler.leftPadding))

            Image {
                id: cursorXTracker
                source: "Assets/PageView/cursorXTracker.png"
                anchors.fill: parent
                fillMode: Qt.KeepAspectRatio

            }
        }
    }


    PaddedRectangle {
        id:leftRuler
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        width : 25
        topPadding: 25

        color: "#efefef"

        Rectangle {
            id: leftRulerPointer
            color : "transparent"
            height: parent.width
            width: parent.width
            y: Math.max(leftRuler.topPadding / 2, Math.min(pageViewMouseArea.mouseY - (height / 2), leftRuler.height - height - leftRuler.topPadding))

            Image {
                id: cursorYTracker
                source: "Assets/PageView/cursorYTracker.png"
                anchors.fill: parent
                fillMode: Qt.KeepAspectRatio

            }
        }
    }




}


