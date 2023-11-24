import QtQuick
import QtQuick.Controls


Window {
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



    // ---------------------------------------------------------------------------------------
    width: 1366
    height: 857
    visible: true
    title: qsTr(windowTitleText + " : " + projectName)

    LeftToolbar {
        id:leftToolbar
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        width: 40

    }

    Rectangle {
        width: 100
        height: 100
        anchors.centerIn: parent
        color: isShowingGrid ? "red": isShowingRuler ? "green" : isPreviewingProject ? "blue" : "black"
    }

}



