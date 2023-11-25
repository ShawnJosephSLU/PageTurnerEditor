import QtQuick

Flickable {

    id:flickable

    property int pageWidth;
    property int pageHeight;

    // add page list here


    contentHeight: pageHeight + 100
    anchors.right: parent.right
    anchors.left: parent.left
    anchors.top: parent.top
    clip: true




    Rectangle {

        anchors.fill: parent
        color: "lightgrey"


        Rectangle {
            width: flickable.pageWidth
            height:flickable.pageHeight

            anchors.centerIn: parent
        }
    }

}
