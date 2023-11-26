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


   MainMenubar {


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



