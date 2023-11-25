import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15

Rectangle {
    id: pageView
    property int pageWidth
    property int pageHeight
    color: "lightgrey"
    clip: true

    property var allPages: []
    property real scaleFactor: 1.0
    property real initialScaleFactor: 1.0

    Label {
        text : "Page ID : "+ frontCoverPage.pageID
        width: 300
        height: 50
        color: "black"
        padding: 20
        z: 2

    }

    ProjectPage {

        id: frontCoverPage
        pageID: "Front Page"
        width: pageWidth * scaleFactor
        height: pageHeight * scaleFactor
        anchors.centerIn: parent
    }

    PinchArea {
        anchors.fill: parent
        onPinchStarted: {
            // Store the initial scale factor
            initialScaleFactor = scaleFactor

        }

        onPinchUpdated: (pinch) => {
            // Calculate the new scale factor
            scaleFactor = initialScaleFactor * pinch.scale

            // Adjust scale by 0.001 for zoom in and zoom out
            if (pinch.scale > 1.0) {
                scaleFactor += 0.001
            } else {
                scaleFactor -= 0.001
            }

            // Limit the scale factor to avoid too small or too large values
            scaleFactor = Math.max(0.1, Math.min(3.0, scaleFactor))
        }
    }
}
