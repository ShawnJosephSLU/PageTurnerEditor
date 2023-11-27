import QtQuick
import QtQuick.Controls
import QtQuick.Window 2.12



ApplicationWindow {
    id: root
    property string projectName: "Untitled Project"
    readonly property string windowTitleText : "Page Turner Editor"

    //---------------------------------------------------------------------------  Application Tool Modes
    readonly property bool isInSelectAndDragMode: leftToolbar.selectAndDragToolClicked
    readonly property bool isInBoxSelectMode: leftToolbar.boxSelectToolClicked
    readonly property bool isInDrawRectMode: leftToolbar.drawRectToolClicked
    readonly property bool isInDrawElipseMode: leftToolbar.drawElipseToolClicked
    readonly property bool isInDrawLineMode: leftToolbar.drawLineToolClicked
    readonly property bool isInDrawPolygonMode: leftToolbar.drawPolygonClicked
    readonly property bool isInDrawTextMode: leftToolbar.drawTextClicked
    readonly property bool isInAddImageMode: leftToolbar.addImageToolClicked
    readonly property bool isInAddAudioMode: leftToolbar.addVideoToolClicked
    readonly property bool isInAddVideoMode: leftToolbar.addAudioToolClicked
    readonly property bool isInAddGifMode: leftToolbar.addGifToolClicked
    readonly property bool isInAddQAMode: leftToolbar.addQAToolClicked

    readonly property bool isShowingGrid: leftToolbar.showGridBtnClicked
    readonly property bool isShowingRuler: leftToolbar.showRulerBtnClicked
    readonly property bool isPreviewingProject: leftToolbar.previewBtnClicked


   readonly property bool isLayersPanelOpened: leftToolbar.showLayersBtnClicked
   readonly property bool isPropertiesPanelOpened: leftToolbar.showPropertiesBtnClicked

   readonly property bool isPageViewLeftClicked : pageView.leftClicked
   readonly property bool isPageViewRightClicked: pageView.rightClicked

    property int mousePOSX : pageView.mousePOSX + (leftToolbar.width + layersPanel.width)
    property int mousePOSY : pageView.mousePOSY


   // TODO: add fit to screen button that calls the pageView.fitToScreen




    property int zoomLevel : pageView.scaleFactor * 100
    property string language : "EN"

    readonly property int pageWidth: 1275
    readonly property int pageHeight: 1650

    property ProjectPage allPages: pageView.allPages
    property int currentPageNumber : 1
    property int numberOfPages : 1
    property string currentPageId : "Front Cover"






    // ---------------------------------------------------------------------------------------
    width: 1366
    height: 857
    visible: true
    title: qsTr(windowTitleText + " : " + projectName)


    PageViewRightButtonMenu {
        visible: isPageViewRightClicked ? true : false
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

                    pageView.rightClicked = false
                    pageView.leftClicked = false
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

                    pageView.rightClicked = false
                    pageView.leftClicked = false
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

                    pageView.rightClicked = false
                    pageView.leftClicked = false
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

                    pageView.rightClicked = false
                    pageView.leftClicked = false
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

                    pageView.zoomIn()
                    pageView.rightClicked = false
                    pageView.leftClicked = false
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

                    pageView.rightClicked = false
                    pageView.leftClicked = false
                }
            }
        }

        //----------------------------------------------------------------------
        PaddedRectangle {
            id: fitToScreenOption
            height: 25
            anchors.top: zoomOutOption.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            padding: 1

            color : "transparent"

            Label {
                id: fitToScreenBtnText
                text: "Fit To Screen"
                color: "#ebebeb"
                x: 12
                y: 6
            }


            Label {
                id: fitToScreenShortcut
                text: "⇧ 0"
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
                    fitToScreenBtnText.color = "black"
                    fitToScreenShortcut.color = "black"

                }
                onExited: {
                    parent.color = "transparent"
                    fitToScreenBtnText.color = "#ebebeb"
                    fitToScreenShortcut.color = "#7b7b7b"

                }

                onClicked: {
                    pageView.fitToScreen()
                    // make invisible
                    pageView.rightClicked = false
                    pageView.leftClicked = false

                }
            }
        }


    //----------------------------------------------------------
        PaddedRectangle {
            id: pageSettingsOption
            height: 25
            anchors.top: fitToScreenOption.bottom
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

                    pageView.rightClicked = false
                    pageView.leftClicked = false
                }
            }
        }
    }



   MainMenubar {

        id: mainMenubar
   }


    LeftToolbar {
        id:leftToolbar
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: statusbar.top
        width: 40

    }

    Statusbar {
        id:statusbar
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        height: 40
        currentPageNumber: root.currentPageNumber
        numberOfPages: root.numberOfPages
        zoomLevel: root.zoomLevel
        language: root.language
        pageWidth: root.pageWidth
        pageHeight: root.pageHeight


    }

    PageView {
        id:pageView
        anchors.left: layersPanel.right
        anchors.top: parent.top
        anchors.bottom: statusbar.top
        anchors.right: propertiesPanel.left

        pageWidth: root.pageWidth
        pageHeight: root.pageHeight

    }

    LayersPanel {
        id:layersPanel
        anchors.left: leftToolbar.right
        anchors.top: parent.top
        anchors.bottom: statusbar.top

        isOpened: isLayersPanelOpened


    }

    PropertiesPanel {
        id: propertiesPanel
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: statusbar.top

        isOpened: isPropertiesPanelOpened
    }


    CurrentPageLabel {
        currentPageId: root.currentPageId
    }
   

}



