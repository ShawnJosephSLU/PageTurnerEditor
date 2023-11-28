import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Flickable {
    id: pageView
    property int pageWidth
    property int pageHeight
   // color: "lightgrey"
    clip: true

    contentWidth: pageView.width
    contentHeight: pageView.height

    property var allPages: []
    property real scaleFactor: 1.0
    property real initialScaleFactor: 1.0

    property bool rightClicked : false
    property bool leftClicked : false

    property int mousePOSX ;
    property int mousePOSY;
    property bool isRulerVisible;
    property bool isGridVisible;
    property bool isSelectAndDragActivated;
    property bool isBoxSelectActivated;




    Rectangle {
        id: background
        color: "#e1e1e1"
        anchors.fill: parent
    }


    PageViewGrid{
        visible: isGridVisible
    }

    ProjectPage {
        id: frontCoverPage
        pageID: "Front Page"
        width: pageWidth * scaleFactor
        height: pageHeight * scaleFactor
        anchors.centerIn: parent
    }

    PageViewRuler {
        visible: isRulerVisible
    }


    SelectionBox {
        id: selectionBox
        x: Math.min(startX, pageViewMouseArea.mouseX)
        y: Math.min(startY, pageViewMouseArea.mouseY)
        width: Math.abs(pageViewMouseArea.mouseX - startX)
        height: Math.abs(pageViewMouseArea.mouseY - startY)
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



    MouseArea {
        id: pageViewMouseArea
        anchors.fill: parent
        hoverEnabled: true


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


        onPressed: {

            if(isBoxSelectActivated || isSelectAndDragActivated){
               selectionBox.startX = mouseX
               selectionBox.startY = mouseY
               console.log("start : (", selectionBox.startX, "," , selectionBox.startY, ")")
               selectionBox.visible = true
            }
       }

       onPositionChanged: {
           if(isBoxSelectActivated || isSelectAndDragActivated  ){

               if(pageViewMouseArea.drag.active) {
                   // continuously update the selectionBox size
                   selectionBox.x = Math.min(selectionBox.startX, pageViewMouseArea.mouseX)
                   selectionBox.y = Math.min(selectionBox.startY, pageViewMouseArea.mouseY)
                   selectionBox.width = Math.abs(pageViewMouseArea.mouseX - selectionBox.startX)
                   selectionBox.height = Math.abs(pageViewMouseArea.mouseY - selectionBox.startY)
               }
           }
       }

       onReleased: {
           if(isBoxSelectActivated || isSelectAndDragActivated){
               selectionBox.endX = mouseX
               selectionBox.endY = mouseY
               console.log("end : (", selectionBox.endX, "," , selectionBox.endY, ")")
               selectionBox.visible = false
           }
       }

       onEntered: {
           if(isSelectAndDragActivated){
               cursorShape = Qt.ArrowCursor
           }

           else if(isBoxSelectActivated){
               cursorShape = Qt.CrossCursor
           }
           else {
               cursorShape = Qt.ArrowCursor
           }

       }

       onExited: {
           cursorShape = Qt.ArrowCursor
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

    function zoomOut() {
        const scaleFactorIncrement = 0.1;
        const minScaleFactor = 0.1;

        // Increment the scale factor
        pageView.scaleFactor -= scaleFactorIncrement;

        // Limit the scale factor to the maximum value
        if (pageView.scaleFactor < minScaleFactor) {
            pageView.scaleFactor = minScaleFactor;
        }
    }

}
