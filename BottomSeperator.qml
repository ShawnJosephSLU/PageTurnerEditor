import QtQuick


Rectangle {
    property int thickness : 1
    property color strokeColor : "black"

    color: strokeColor
    height: thickness

    anchors.bottom: parent.bottom
    anchors.left: parent.left
    anchors.right : parent.right


}
