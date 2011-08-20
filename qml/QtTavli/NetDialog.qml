import QtQuick 1.0

Flipable {
    id: netFlipable
    x: (parent.width-width)/2
    y: parent.height/2-height/2
    width: parent.width-parent.width/6
    height: parent.height/4
    visible: false
    opacity: 0.8
    z: 2
    property real ratio
    property string address
    property int port
    front: Rectangle {
        id: netDialogMain
        width: parent.width
        height: parent.height
        color: "#ffffff"

        Button {
            id: hostButton
            anchors.top: parent.top
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: 5
            width: labelwidth + buttonBorder
            height: labelheight + buttonBorder
            label: "Host Game"
            fontSize: 50*ratio
        }

        MouseArea {
            id: hostButtonArea
            anchors.fill: hostButton
            hoverEnabled: true
            onEntered: hostButton.border.color = "gold"
            onExited: hostButton.border.color = "black"
            onClicked: { hostWaitRect.visible = true; connectRect.visible = false; netFlipable.flipped = !netFlipable.flipped; dirNet.host() }
        }

        Button {
            id: connectToButton
            anchors.top: parent.top
            anchors.topMargin: 5
            anchors.right: parent.right
            anchors.rightMargin: 5
            width: labelwidth + buttonBorder
            height: labelheight + buttonBorder
            label: "Connect to..."
            fontSize: 50*ratio
        }

        MouseArea {
            id: connectToButtonArea
            anchors.fill: connectToButton
            hoverEnabled: true
            onEntered: connectToButton.border.color = "gold"
            onExited: connectToButton.border.color = "black"
            onClicked: { hostWaitRect.visible = false; connectRect.visible = true; netFlipable.flipped = !netFlipable.flipped }
        }

        Button {
            id: cancelButton2
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 5
            anchors.horizontalCenter: parent.horizontalCenter
            width: labelwidth + buttonBorder
            height: labelheight + buttonBorder
            label: "Cancel"
            fontSize: 50*ratio
        }

        MouseArea {
            id: cancelButton2Area
            anchors.fill: cancelButton2
            hoverEnabled: true
            onEntered: cancelButton2.border.color = "red"
            onExited: cancelButton2.border.color = "black"
            onClicked: { netFlipable.visible = false; tint.state = "invisible" }
        }
    }

    property bool flipped: false

    states: State {
        name: "back"
        PropertyChanges {
            target: netFlipRotation
            angle: 180
        }
        when: netFlipable.flipped
    }

    transform: Rotation {
        id: netFlipRotation
        origin.x: netFlipable.width/2
        origin.y: netFlipable.height/2
        axis.x: 1
        axis.y: 0
        axis.z: 0
        angle: 0
    }

    transitions: Transition {
        NumberAnimation { target: netFlipRotation; property: "angle"; easing.amplitude: 1; easing.period: 0.7; easing.type: Easing.OutBounce; duration: 1500 }
    }


    back: Rectangle {
        width: parent.width
        height: parent.height
        color: "#ffffff"

        Rectangle {
            id: hostWaitRect
            width: parent.width
            height: parent.height
            color: "transparent"
            visible: false

            Text {
                color: "black"
                text: "Waiting for connection..."
                font.pixelSize: 50*ratio
            }

            Button {
                id: abortButton
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 5
                anchors.horizontalCenter: parent.horizontalCenter
                width: labelwidth + buttonBorder
                height: labelheight + buttonBorder
                label: "Abort"
                fontSize: 50*ratio
            }

            MouseArea {
                id: abortButtonArea
                anchors.fill: abortButton
                hoverEnabled: true
                onEntered: abortButton.border.color = "red"
                onExited: abortButton.border.color = "black"
                onClicked: { netFlipable.flipped = !netFlipable.flipped; dirNet.closeHost() }
            }
        }

        Rectangle {
            id: connectRect
            width: parent.width
            height: parent.height
            color: "transparent"
            visible: false

            Column {
                width: parent.width
                anchors.top: parent.top
                anchors.topMargin: 5
                spacing: 5

                Row {
                    width: parent.width-10
                    anchors.horizontalCenter: parent.horizontalCenter
                    spacing: 5

                    Text {
                        id: addressLabel
                        text: "Address:"
                        font.pixelSize: 50*ratio
                        smooth: true
                    }

                    Rectangle {
                        width: parent.width - addressLabel.width - 5
                        height: parent.height
                        color: "white"
                        opacity: 0.8

                        TextInput {
                            id: addressInput
                            anchors.fill: parent
                            focus: true
                            font.pixelSize: 50*ratio
                            selectByMouse: true
                            smooth: true
                            text: netFlipable.address
                        }
                    }
                }
                Row {
                    width: parent.width-10
                    anchors.horizontalCenter: parent.horizontalCenter
                    spacing: 5

                    Text {
                        id: portLabel
                        text: "Port:"
                        font.pixelSize: 50*ratio
                        smooth: true
                    }

                    Rectangle {
                        width: parent.width - portLabel.width - 5
                        height: parent.height
                        color: "white"
                        opacity: 0.8

                        TextInput {
                            id: portInput
                            anchors.fill: parent
                            text: netFlipable.port
                            inputMask: "00000;_"
                            font.pixelSize: 50*ratio
                            selectByMouse: true
                            smooth: true
                        }
                    }
                }
            }

            Button {
                id: connectButton
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 5
                anchors.left: parent.left
                anchors.leftMargin: 5
                height: labelheight + buttonBorder
                width: parent.width/2-10
                label: "Connect"
                fontSize: 50*ratio
            }

            MouseArea {
                id: connectButtonArea
                anchors.fill: connectButton
                hoverEnabled: true
                onEntered: connectButton.border.color = "lime"
                onExited: connectButton.border.color = "black"
                //onClicked: netFlipable.flipped = !netFlipable.flipped
            }

            Button {
                id: cancelButton
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 5
                anchors.right: parent.right
                anchors.rightMargin: 5
                //width: labelwidth + buttonBorder
                height: labelheight + buttonBorder
                width: parent.width/2-10
                label: "Cancel"
                fontSize: 50*ratio
            }

            MouseArea {
                id: cancelButtonArea
                anchors.fill: cancelButton
                hoverEnabled: true
                onEntered: cancelButton.border.color = "red"
                onExited: cancelButton.border.color = "black"
                onClicked: netFlipable.flipped = !netFlipable.flipped
            }
        }
    }
}
