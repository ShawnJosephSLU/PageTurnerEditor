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


    Component.onCompleted:  {
        allPages.push[frontCoverPage]
        fitToScreen()
    }


    function fitToScreen() {
        // Calculate the available space in the viewport
        const viewportWidth = pageView.width;
        const viewportHeight = pageView.height;

        const pageAspectRatio = pageWidth / pageHeight;

        // Determine the new scale factor based on the available space and aspect ratio
        let newScaleFactor = 1.0;
        if (pageAspectRatio > viewportWidth / viewportHeight) {
            newScaleFactor = viewportWidth / (pageWidth * pageAspectRatio) - 0.1;
        } else {
            newScaleFactor = (viewportHeight / pageHeight) - 0.1;
        }

        // Set the new scale factor
        pageView.scaleFactor = newScaleFactor;
    }
}
