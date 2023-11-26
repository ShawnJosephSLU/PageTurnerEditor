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

    PageViewRightButtonMenu {
        visible: rightClicked ? true : false
        color: "black"
        x: mousePOSX
        y: mousePOSY

        id: rightClickMenu

        PaddedRectangle {
            id: createPageOption
            height: 25
            width: parent.width
            color : "transparent"

            topLeftRadius: 4
            topRightRadius: 4
            padding: 1


            Label {
                id: createPageBtnText
                text: "Create New Page"
                color: "#ebebeb"
                x: 12
                y: 6
            }


            Label {
                id: createPageShortcut
                text: "⌘ N"
                color :"#7b7b7b"
                y: 6
                x: 210
            }

            Rectangle { // seperator
                color: "#2a2a2a"
                height: 1
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.bottom: parent.bottom

            }


            MouseArea {

                anchors.fill: parent
                hoverEnabled: true
                onEntered: {
                    parent.color = "#b5c5ff"
                    createPageBtnText.color = "black"
                    createPageShortcut.color = "black"
                }
                onExited: {
                    parent.color = "transparent"
                    createPageBtnText.color = "#ebebeb"
                    createPageShortcut.color = "#7b7b7b"


                }

                onClicked: {
                    // make invisible
                    rightClickMenu.visible = false


                }
            }
        }
    //--------------------------------------------------------------------------------

        PaddedRectangle {
            id: undoOption
            height: 25
            anchors.top: createPageOption.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            padding: 1

            color : "transparent"

            Label {
                id: undoBtnText
                text: "Undo"
                color: "#ebebeb"
                x: 12
                y: 6
            }

            Label {
                id: undoShortcut
                text: "⌘ Z"
                color :"#7b7b7b"
                y: 6
                x: 210
            }


            Rectangle { // seperator
                color: "#2a2a2a"
                height: 1
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.bottom: parent.bottom

            }


            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {
                    parent.color = "#b5c5ff"
                    undoBtnText.color = "black"
                    undoShortcut.color = "black"
                }
                onExited: {
                    parent.color = "transparent"
                    undoBtnText.color = "#ebebeb"
                    undoShortcut.color = "#7b7b7b"


                }

                onClicked: {
                    // Handle Undo scene then ...
                    // make invisible
                    rightClickMenu.visible = false
                }
            }
        }

        //------------------------------------------------------------------------

        PaddedRectangle {
            id: redoOption
            height: 25
            anchors.top: undoOption.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            padding: 1

            color : "transparent"

            Label {
                id: redoBtnText
                text: "Redo"
                color: "#ebebeb"
                x: 12
                y: 6
            }

            Label {
                id: redoShortcut
                text: "⇧ ⌘ Z"
                color :"#7b7b7b"
                y: 6
                x: 194
            }


            Rectangle { // seperator
                color: "#2a2a2a"
                height: 1
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.bottom: parent.bottom

            }


            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {
                    parent.color = "#b5c5ff"
                    redoBtnText.color = "black"
                    redoShortcut.color = "black"

                }
                onExited: {
                    parent.color = "transparent"
                    redoBtnText.color = "#ebebeb"
                    redoShortcut.color = "#7b7b7b"


                }

                onClicked: {
                    // Handle Redo scene then ...
                    // make invisible
                    rightClickMenu.visible = false
                }
            }
        }
    //-----------------------------------------------------------------------------

        PaddedRectangle {
            id: saveOption
            height: 25
            anchors.top: redoOption.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            padding: 1

            color : "transparent"

            Label {
                id: saveBtnText
                text: "Save "
                color: "#ebebeb"
                x: 12
                y: 6
            }

            Label {
                id: saveShortcut
                text: "⌘ S"
                color :"#7b7b7b"
                y: 6
                x: 210
            }

            Rectangle { // seperator
                color: "#2a2a2a"
                height: 1
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.bottom: parent.bottom

            }


            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {
                    parent.color = "#b5c5ff"
                    saveBtnText.color = "black"
                    saveShortcut.color = "black"

                }
                onExited: {
                    parent.color = "transparent"
                    saveBtnText.color = "#ebebeb"
                    saveShortcut.color = "#7b7b7b"


                }

                onClicked: {
                    // Handle Redo scene then ...
                    // make invisible
                    rightClickMenu.visible = false
                }
            }
        }
    //-----------------------------------------------------------------------------

        PaddedRectangle {
            id: zoomInOption
            height: 25
            anchors.top: saveOption.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            padding: 1

            color : "transparent"

            Label {
                id: zoomInBtnText
                text: "Zoom In"
                color: "#ebebeb"
                x: 12
                y: 6
            }

            Label {
                id: zoomInShortcut
                text: "+"
                color :"#7b7b7b"
                y: 6
                x: 220
            }

            Rectangle { // seperator
                color: "#2a2a2a"
                height: 1
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.bottom: parent.bottom

            }


            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {
                    parent.color = "#b5c5ff"
                    zoomInBtnText.color = "black"
                    zoomInShortcut.color = "black"


                }
                onExited: {
                    parent.color = "transparent"
                    zoomInBtnText.color = "#ebebeb"
                    zoomInShortcut.color = "#7b7b7b"


                }

                onClicked: {
                    // Handle Redo scene then ...
                    // make invisible
                    rightClickMenu.visible = false
                }
            }
        }

        //----------------------------------------------------------------------
        PaddedRectangle {
            id: zoomOutOption
            height: 25
            anchors.top: zoomInOption.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            padding: 1

            color : "transparent"

            Label {
                id: zoomOutBtnText
                text: "Zoom Out"
                color: "#ebebeb"
                x: 12
                y: 6
            }


            Label {
                id: zoomOutShortcut
                text: "-"
                color :"#7b7b7b"
                y: 6
                x: 220
            }


            Rectangle { // seperator
                color: "#2a2a2a"
                height: 1
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.bottom: parent.bottom

            }


            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {
                    parent.color = "#b5c5ff"
                    zoomOutBtnText.color = "black"
                    zoomOutShortcut.color = "black"

                }
                onExited: {
                    parent.color = "transparent"
                    zoomOutBtnText.color = "#ebebeb"
                    zoomOutShortcut.color = "#7b7b7b"

                }

                onClicked: {
                    // Handle Redo scene then ...
                    // make invisible
                    rightClickMenu.visible = false
                }
            }
        }

    //----------------------------------------------------------
        PaddedRectangle {
            id: pageSettingsOption
            height: 25
            anchors.top: zoomOutOption.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            padding: 1

            bottomLeftRadius: 4
            bottomRightRadius: 4

            color : "transparent"

            Label {
                id: pageSettingsBtnText
                text: "Page Settings..."
                color: "#ebebeb"
                x: 12
                y: 6
            }


            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {
                    parent.color = "#b5c5ff"
                    pageSettingsBtnText.color = "black"
                }
                onExited: {
                    parent.color = "transparent"
                    pageSettingsBtnText.color = "lightgrey"

                }

                onClicked: {
                    // Handle Redo scene then ...
                    // make invisible
                    rightClickMenu.visible = false
                }
            }
        }
    }





    MouseArea {
        anchors.fill: parent

        acceptedButtons: Qt.LeftButton | Qt.RightButton


        onClicked: (mouse) => {
            if(mouse.button === Qt.RightButton){
               rightClickMenu.visible = true
               mousePOSX = mouse.x
               console.log("Mouse X:", mousePOSX) // Update and display mouse X-coordinate
               mousePOSY = mouse.y
               console.log("Mouse Y:", mousePOSY) // Update and display mouse X-coordinate
               console.log("right-clicked")
            }
            else if(mouse.button === Qt.LeftButton) {
                rightClickMenu.visible = false

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
}
