import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
Rectangle {

    TopSeperator {}

    Flickable {
        anchors.fill: parent
        clip: true
        contentWidth : numberOfPages * (120 + 10)
        contentHeight: parent.height

        Row{
            anchors.fill: parent
            spacing: 5
            Repeater {
                model: numberOfPages
                PaddedRectangle {
                    border.color: "#cfcfcf"
                    padding: 5
                    width : 120
                    height: parent.height
                    radius: 5
                }
            }
        }
    }
}
