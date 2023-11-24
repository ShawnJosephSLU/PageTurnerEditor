//LeftToolbar.qml

import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Rectangle {
    id: leftToolbar
    color:leftToolbarColor()
    clip: false

    property var activeButton: null

    property var toolbarBtnList: []
    property var canvasBtnList: []


    // -------------------------------------------------------------Button Click Properties

    readonly property bool selectAndDragToolClicked: selectAndDragTool.btnActive
    readonly property bool boxSelectToolClicked: boxSelectTool.btnActive
    readonly property bool drawRectToolClicked: drawRectTool.btnActive
    readonly property bool drawElipseToolClicked: drawElipseTool.btnActive
    readonly property bool drawLineToolClicked: drawLineTool.btnActive
    readonly property bool drawPolygonClicked: drawPolygonTool.btnActive
    readonly property bool drawTextClicked: drawTextTool.btnActive
    readonly property bool addImageToolClicked: addImageTool.btnActive
    readonly property bool addVideoToolClicked: addVideoTool.btnActive
    readonly property bool addAudioToolClicked: addAudioTool.btnActive
    readonly property bool addGifToolClicked: addGifTool.btnActive
    readonly property bool addQAToolClicked: addQATool.btnActive

    readonly property bool previewBtnClicked: previewProjectBtn.btnActive
    readonly property bool showRulerBtnClicked: showRulerBtn.btnActive
    readonly property bool showGridBtnClicked: showGridBtn.btnActive



    //-------------------------------------------------------------- Toolbar Buttons
    ToolbarBtn {
        id: selectAndDragTool
        btnImage: "Assets/LeftToolbar/icons/selectBtnIcon.png"
        btnActive :toggleButton(selectAndDragTool)
        btnName: "Select and Drag Tool"
        btnDescription: "Effortlessly interact with page items. Click to adjust properties and smoothly manipulate position, transformation, and rotation."

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true

            onEntered: {
                cursorShape = Qt.PointingHandCursor
                parent.color = "#EFEFFF"
                //console.info(btnName +" entered")
            }

            onExited: {
                cursorShape = Qt.ArrowCursor
                parent.color = "transparent"
                //console.info(btnName +" exited")

            }

            onClicked: {
                if(!selectAndDragTool.btnActive){
                    leftToolbar.toggleButton(parent)
                }

            }

            onPressAndHold:  {
                btnPressAndHold = true
                if(btnPressAndHold) {
                    console.info(parent.btnName +" pressed and hold")
                }
            }
        }
    }

    ToolbarBtn {
        id: boxSelectTool
        btnImage: "Assets/LeftToolbar/icons/boxSelectBtnIcon.png"
        btnName: "Box Select Tool"
        btnDescription: "Select and modify multiple items simultaneously using the box-select tool, simplifying your workflow for efficient arrangement and adjustments."

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true

            onEntered: {
                cursorShape = Qt.PointingHandCursor
                parent.color = "#EFEFFF"
                //console.info(btnName +" entered")
            }

            onExited: {
                cursorShape = Qt.ArrowCursor
                parent.color = "transparent"
                //console.info(btnName +" exited")

            }

            onClicked: {
                if(!boxSelectTool.btnActive) {
                    leftToolbar.toggleButton(parent)

                }

            }

            onPressAndHold:  {
                btnPressAndHold = true
                if(btnPressAndHold) {
                    console.info(parent.btnName +" pressed and hold")
                }


            }
        }
    }

    ToolbarBtn {
        id: drawRectTool
        btnImage: "Assets/LeftToolbar/icons/drawRectBtnIcon.png"
        btnName: "Draw Rectangle Tool"


        MouseArea {
            anchors.fill: parent
            hoverEnabled: true

            onEntered: {
                cursorShape = Qt.PointingHandCursor
                parent.color = "#EFEFFF"
                //console.info(btnName +" entered")
            }

            onExited: {
                cursorShape = Qt.ArrowCursor
                parent.color = "transparent"
                //console.info(btnName +" exited")

            }

            onClicked: {
                if(!parent.btnActive){
                    leftToolbar.toggleButton(parent)
                }

            }

            onPressAndHold:  {
                btnPressAndHold = true
                if(btnPressAndHold) {
                    console.info(parent.btnName +" pressed and hold")
                }


            }
        }
    }

    ToolbarBtn {
        id: drawElipseTool
        btnImage: "Assets/LeftToolbar/icons/drawElipseBtnIcon.png"

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true

            onEntered: {
                cursorShape = Qt.PointingHandCursor
                parent.color = "#EFEFFF"
                //console.info(btnName +" entered")
            }

            onExited: {
                cursorShape = Qt.ArrowCursor
                parent.color = "transparent"
                //console.info(btnName +" exited")

            }

            onClicked: {
                if(!parent.btnActive){
                    leftToolbar.toggleButton(parent)
                }
            }

            onPressAndHold:  {
                btnPressAndHold = true
                if(btnPressAndHold) {
                    console.info(parent.btnName +" pressed and hold")
                }


            }
        }
    }

    ToolbarBtn {
        id: drawLineTool
        btnImage: "Assets/LeftToolbar/icons/drawLineBtnIcon.png"

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true

            onEntered: {
                cursorShape = Qt.PointingHandCursor
                parent.color = "#EFEFFF"
                //console.info(btnName +" entered")
            }

            onExited: {
                cursorShape = Qt.ArrowCursor
                parent.color = "transparent"
                //console.info(btnName +" exited")

            }

            onClicked: {
                if(!parent.btnActive){
                    leftToolbar.toggleButton(parent)
                }
            }

            onPressAndHold:  {
                btnPressAndHold = true
                if(btnPressAndHold) {
                    console.info(parent.btnName +" pressed and hold")
                }


            }
        }
    }

    ToolbarBtn {
        id: drawPolygonTool
        btnImage: "Assets/LeftToolbar/icons/drawPoygonBtnIcon.png"

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true

            onEntered: {
                cursorShape = Qt.PointingHandCursor
                parent.color = "#EFEFFF"
                //console.info(btnName +" entered")
            }

            onExited: {
                cursorShape = Qt.ArrowCursor
                parent.color = "transparent"
                //console.info(btnName +" exited")

            }

            onClicked: {
                if(!parent.btnActive){
                    leftToolbar.toggleButton(parent)
                }
            }

            onPressAndHold:  {
                btnPressAndHold = true
                if(btnPressAndHold) {
                    console.info(parent.btnName +" pressed and hold")
                }


            }
        }
    }

    ToolbarBtn {
        id: drawTextTool
        btnImage: "Assets/LeftToolbar/icons/drawTextBtnIcon.png"

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true

            onEntered: {
                cursorShape = Qt.PointingHandCursor
                parent.color = "#EFEFFF"
                //console.info(btnName +" entered")
            }

            onExited: {
                cursorShape = Qt.ArrowCursor
                parent.color = "transparent"
                //console.info(btnName +" exited")

            }

            onClicked: {
                if(!parent.btnActive){
                    leftToolbar.toggleButton(parent)
                }
            }

            onPressAndHold:  {
                btnPressAndHold = true
                if(btnPressAndHold) {
                    console.info(parent.btnName +" pressed and hold")
                }


            }
        }
    }

    ToolbarBtn {
        id: addImageTool
        btnImage: "Assets/LeftToolbar/icons/addImageBtnIcon.png"

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true

            onEntered: {
                cursorShape = Qt.PointingHandCursor
                parent.color = "#EFEFFF"
                //console.info(btnName +" entered")
            }

            onExited: {
                cursorShape = Qt.ArrowCursor
                parent.color = "transparent"
                //console.info(btnName +" exited")

            }

            onClicked: {
                if(!parent.btnActive){
                    leftToolbar.toggleButton(parent)
                }
            }

            onPressAndHold:  {
                btnPressAndHold = true
                if(btnPressAndHold) {
                    console.info(parent.btnName +" pressed and hold")
                }


            }
        }
    }

    ToolbarBtn {
        id: addAudioTool
        btnImage: "Assets/LeftToolbar/icons/addAudioBtnIcon.png"

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true

            onEntered: {
                cursorShape = Qt.PointingHandCursor
                parent.color = "#EFEFFF"
                //console.info(btnName +" entered")
            }

            onExited: {
                cursorShape = Qt.ArrowCursor
                parent.color = "transparent"
                //console.info(btnName +" exited")

            }

            onClicked: {
                if(!parent.btnActive){
                    leftToolbar.toggleButton(parent)
                }
            }

            onPressAndHold:  {
                btnPressAndHold = true
                if(btnPressAndHold) {
                    console.info(parent.btnName +" pressed and hold")
                }


            }
        }
    }

    ToolbarBtn {
        id: addVideoTool
        btnImage: "Assets/LeftToolbar/icons/addVideoBtnIcon.png"

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true

            onEntered: {
                cursorShape = Qt.PointingHandCursor
                parent.color = "#EFEFFF"
                //console.info(btnName +" entered")
            }

            onExited: {
                cursorShape = Qt.ArrowCursor
                parent.color = "transparent"
                //console.info(btnName +" exited")

            }

            onClicked: {
                if(!parent.btnActive){
                    leftToolbar.toggleButton(parent)
                }
            }

            onPressAndHold:  {
                btnPressAndHold = true
                if(btnPressAndHold) {
                    console.info(parent.btnName +" pressed and hold")
                }


            }
        }
    }

    ToolbarBtn {
        id: addGifTool
        btnImage: "Assets/LeftToolbar/icons/addGifBtnIcon.png"

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true

            onEntered: {
                cursorShape = Qt.PointingHandCursor
                parent.color = "#EFEFFF"
                //console.info(btnName +" entered")
            }

            onExited: {
                cursorShape = Qt.ArrowCursor
                parent.color = "transparent"
                //console.info(btnName +" exited")

            }

            onClicked: {
                if(!parent.btnActive){
                    leftToolbar.toggleButton(parent)
                }
            }

            onPressAndHold:  {
                btnPressAndHold = true
                if(btnPressAndHold) {
                    console.info(parent.btnName +" pressed and hold")
                }


            }
        }
    }

    ToolbarBtn {
        id: addQATool
        btnImage: "Assets/LeftToolbar/icons/addQABtnIcon.png"

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true

            onEntered: {
                cursorShape = Qt.PointingHandCursor
                parent.color = "#EFEFFF"
                //console.info(btnName +" entered")
            }

            onExited: {
                cursorShape = Qt.ArrowCursor
                parent.color = "transparent"
                //console.info(btnName +" exited")

            }

            onClicked: {
                if(!parent.btnActive){
                    leftToolbar.toggleButton(parent)
                }
            }

            onPressAndHold:  {
                btnPressAndHold = true
                if(btnPressAndHold) {
                    console.info(parent.btnName +" pressed and hold")
                }


            }
        }
    }

//-------------------------------------------------------------- canvas buttons
    ToolbarBtn {
        id: showGridBtn
        btnImage: "Assets/LeftToolbar/icons/showRulerBtnIcon.png"
        btnActive: true
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: previewProjectBtn.top

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true

            onEntered: {
                cursorShape = Qt.PointingHandCursor
                parent.color = "#EFEFFF"
                //console.info(btnName +" entered")
            }

            onExited: {
                cursorShape = Qt.ArrowCursor
                parent.color = "transparent"
                //console.info(btnName +" exited")

            }

            onClicked: {
                if(!parent.btnActive){
                    parent.btnActive = true
                } else {
                    parent.btnActive = false
                }
            }

            onPressAndHold:  {
                btnPressAndHold = true
                if(btnPressAndHold) {
                    console.info(parent.btnName +" pressed and hold")
                }


            }
        }
    }

    ToolbarBtn {
        id: showRulerBtn
        btnImage: "Assets/LeftToolbar/icons/showGridBtnIcon.png"
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: showGridBtn.top
        btnActive: true


        MouseArea {
            anchors.fill: parent
            hoverEnabled: true

            onEntered: {
                cursorShape = Qt.PointingHandCursor
                parent.color = "#EFEFFF"
                //console.info(btnName +" entered")
            }

            onExited: {
                cursorShape = Qt.ArrowCursor
                parent.color = "transparent"
                //console.info(btnName +" exited")

            }

            onClicked: {
                if(!parent.btnActive){
                    parent.btnActive = true
                } else {
                    parent.btnActive = false
                }
            }

            onPressAndHold:  {
                btnPressAndHold = true
                if(btnPressAndHold) {
                    console.info(parent.btnName +" pressed and hold")
                }


            }
        }
    }


    ToolbarBtn {
        id: previewProjectBtn
        btnImage: "Assets/LeftToolbar/icons/previewBtnIcon.png"
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        btnActive: true


        MouseArea {
            anchors.fill: parent
            hoverEnabled: true

            onEntered: {
                cursorShape = Qt.PointingHandCursor
                parent.color = "#EFEFFF"
                //console.info(btnName +" entered")
            }

            onExited: {
                cursorShape = Qt.ArrowCursor
                parent.color = "transparent"
                //console.info(btnName +" exited")

            }

            onClicked: {
                if(!parent.btnActive){
                    parent.btnActive = true
                } else {
                    parent.btnActive = false
                }

            }

            onPressAndHold:  {
                btnPressAndHold = true
                if(btnPressAndHold) {
                    console.info(parent.btnName +" pressed and hold")
                }


            }
        }
    }


// ---------------------------------------------------------------- Initialization
    function toggleButton(clickedButton) {
       if (activeButton !== null && activeButton !== clickedButton) {
           activeButton.btnActive = false;
       }

       clickedButton.btnActive = !clickedButton.btnActive;
       activeButton = clickedButton.btnActive ? clickedButton : null;
    }

    Component.onCompleted: {
        toolbarBtnList.push(selectAndDragTool)
        toolbarBtnList.push(boxSelectTool)
        toolbarBtnList.push(drawRectTool)
        toolbarBtnList.push(drawElipseTool)
        toolbarBtnList.push(drawLineTool)
        toolbarBtnList.push(drawPolygonTool)
        toolbarBtnList.push(drawTextTool)
        toolbarBtnList.push(addImageTool)
        toolbarBtnList.push(addAudioTool)
        toolbarBtnList.push(addVideoTool)
        toolbarBtnList.push(addGifTool)
        toolbarBtnList.push(addQATool)


        toolbarBtnList.forEach(function(item, index) { // set the y position of the buttons
            item.y = (40 * index)
        })


        canvasBtnList.push(showGridBtn)
        canvasBtnList.push(showRulerBtn)
        canvasBtnList.push(previewProjectBtn)






    }
//---------------------------------------------------------------  Colour
    RightSeperator{
        strokeColor: "#A0A0A0"
    }

    function leftToolbarColor () {
        return "white"
    }
}
