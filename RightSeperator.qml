import QtQuick

Rectangle {
    property int thickness : 1
    property color strokeColor : "black"

    color: strokeColor
    width: thickness

    anchors.top: parent.top
    anchors.bottom: parent.bottom
    anchors.right : parent.right


}
