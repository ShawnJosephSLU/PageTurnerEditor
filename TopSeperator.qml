import QtQuick

Rectangle {
    property int thickness : 1
    property color strokeColor : "#b0b0b0"

    color: strokeColor
    height: thickness

    anchors.top: parent.top
    anchors.left: parent.left
    anchors.right : parent.right


}
