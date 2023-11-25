import QtQuick
import QtQuick.Controls

Rectangle {
    color: "white"

    property int currentPageNumber;
    property int numberOfPages;
    property real zoomLevel;
    property string language;

    property int pageWidth;
    property int pageHeight;

    TopSeperator {strokeColor: "#A0A0A0"}

    Rectangle {
        id:currentPageLabel
        anchors.top : parent.top
        anchors.bottom: parent.bottom
        anchors.left:  parent.left
        width: 130
        color: "transparent"

        Label {
            anchors.fill: parent
            verticalAlignment: Qt.AlignVCenter
            horizontalAlignment: Qt.AlignLeft
            padding: 10
            text: "Page : " + currentPageNumber + " / " + numberOfPages
            color: "black"
            font.pixelSize: 12
        }
    }

    Rectangle {
        id: zoomLabel
        anchors.top : parent.top
        anchors.bottom: parent.bottom
        anchors.right:  parent.right
        width: 100
        color: "transparent"

        Label {
            anchors.fill: parent
            verticalAlignment: Qt.AlignVCenter
            horizontalAlignment: Qt.AlignLeft
            padding: 10
            text: "Zoom : " + zoomLevel + " %"
            color: "black"
            font.pixelSize: 12
        }
    }

    Rectangle {
        id: languageLabel
        anchors.top : parent.top
        anchors.bottom: parent.bottom
        anchors.right:  zoomLabel.left
        width: 100
        color: "transparent"
        clip: true

        Label {
            anchors.fill: parent
            verticalAlignment: Qt.AlignVCenter
            horizontalAlignment: Qt.AlignRight
            padding: 10
            text: "Language : " + language
            color: "black"
            font.pixelSize: 12
        }
    }


    Rectangle {
        id: infoLabel
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.left: pageDimensionLabel.right
        anchors.right : languageLabel.left
        color: "transparent"
        clip: true


        Label {
            anchors.fill: parent
            verticalAlignment: Qt.AlignVCenter
            horizontalAlignment: Qt.AlignHCenter
            padding: 10
            text: "info : Hover over application elements to get a breif description of it. "
            color: "black"
            font.pixelSize: 12
        }


    }



    Rectangle {
        id: pageDimensionLabel
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.left : currentPageLabel.right
        width: 180
        color: "transparent"
        clip: true


        Label {
            anchors.fill: parent
            verticalAlignment: Qt.AlignVCenter
            horizontalAlignment: Qt.AlignLeft
            padding: 10
            text: "Dimension : " + pageWidth + " x " + pageHeight + " px"
            color: "black"
            font.pixelSize: 12
        }
    }
}
