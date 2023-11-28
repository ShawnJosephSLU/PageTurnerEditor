import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    width: parent.width
    height: parent.height

    property int lineThickness: 1 // Default thickness

    Repeater {
        model: Math.max(1, Math.ceil(parent.width / (10 + 1))) // Adjust for spacing and thickness

        Rectangle {
            width: lineThickness
            height: parent.height
            color: gridColour1()
            x: index * (10 + 1) // Adjust for spacing
        }
    }

    Repeater {
        model: Math.max(1, Math.ceil(parent.height / (10 + 1))) // Adjust for spacing and thickness

        Rectangle {
            width: parent.width
            height: lineThickness
            color: gridColour1()
            y: index * (10 + 1) // Adjust for spacing
        }
    }

    function gridColour1() {
        return "#d0d0d0"
    }
}
