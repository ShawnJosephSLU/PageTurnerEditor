// ToolbarBtn.qml

import QtQuick
import QtQuick.Controls


Rectangle {

    width: parent.width
    height: parent.width

    property string btnImage
    property string btnName: "unnamed button"
    property string btnDescription: "No Description set for [" + btnName + "]"
    property bool btnActive: false
    property bool btnPressAndHold: false


    Rectangle {
        anchors.fill: parent
        color : btnActive ? "#DEDEFF" : "transparent" ;
    }

    Image {
        source: btnImage
        anchors.fill: parent
        fillMode: Image.PreserveAspectFit
    }


}
