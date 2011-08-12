import QtQuick 1.0

Rectangle {
    width: 100
    height: 100
    radius: 10
    gradient: Gradient {
        GradientStop {
            position: 0
            color: "#398dec"
        }

        GradientStop {
            position: 0
            color: "#e0e0e0"
        }

        GradientStop {
            position: 0.48
            color: "#888787"
        }

        GradientStop {
            position: 0.55
            color: "#bbbbbb"
        }

        GradientStop {
            position: 1
            color: "#c6c6c6"
        }
    }
    border.width: 2
    border.color: "#000000"
    property string icon: ""
    property string label: ""
    property color labelColor
    property int fontSize: 12
    property int buttonBorder: 10
    property alias labelwidth: buttonText.paintedWidth
    property alias labelheight: buttonText.paintedHeight

    Column {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        Image {
            id: buttonImage
            width: parent.parent.width - buttonBorder
            height: parent.parent.height - buttonBorder - buttonText.paintedHeight
            smooth: true
            source: icon
        }

        Text {
            id: buttonText
            text: label
            color: labelColor
            font.pixelSize: fontSize
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
}
