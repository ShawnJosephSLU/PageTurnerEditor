import QtQuick
import QtQuick.Controls

Rectangle {

    property string currentPageId;

    id: currentPageIDPanel
    anchors.left: layersPanel.right
    anchors.right: propertiesPanel.left
    anchors.top: parent.top
    height: 40

    Label {
        text : "Page ID : " + currentPageId
        anchors.centerIn: parent
        color: "black"
        horizontalAlignment: Qt.AlignHCenter
        verticalAlignment: Qt.AlignVCenter


    }

    BottomSeperator{ strokeColor: "#A0A0A0"}


}
