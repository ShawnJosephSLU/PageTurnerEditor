import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Rectangle {
    id: pageView
    property int pageWidth
    property int pageHeight
    color: "lightgrey"
    clip: true

    property var allPages: []
    property real scaleFactor: 1.0
    property real initialScaleFactor: 1.0

    property bool rightClicked : false
    property bool leftClicked : false

    property int mousePOSX ;
    property int mousePOSY;




    ProjectPage {

        id: frontCoverPage
        pageID: "Front Page"
        width: pageWidth * scaleFactor
        height: pageHeight * scaleFactor
        anchors.centerIn: parent
    }






    MouseArea {
        anchors.fill: parent

        acceptedButtons: Qt.LeftButton | Qt.RightButton


        onClicked: (mouse) => {
            if(mouse.button === Qt.RightButton){
               mousePOSX = mouse.x


               mousePOSY = mouse.y

               rightClicked = true
               leftClicked = false

            }
            else if(mouse.button === Qt.LeftButton) {
                rightClicked = false
                leftClicked = true

                console.log("left-clicked")
            }
        }



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

        // Calculate the aspect ratio of the page
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

    function zoomIn() {
        const scaleFactorIncrement = 0.1;
        const maxScaleFactor = 3.0;

        // Increment the scale factor
        pageView.scaleFactor += scaleFactorIncrement;

        // Limit the scale factor to the maximum value
        if (pageView.scaleFactor > maxScaleFactor) {
            pageView.scaleFactor = maxScaleFactor;
        }
    }

}
