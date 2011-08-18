import TavliLib 1.0
import QtQuick 1.0
import "TavliGame.js" as Script

Rectangle {
    id: mainRect
    width: 360
    height: 360
    color: "Black"

    DirectNetConnection {
        id: dirNet
        address: "localhost"
        port: 1000
    }

    SystemPalette { id: activePalette }

    Flipable {
        id: mainAreaFlipable
        width: parent.width
        height: parent.height

        front: Rectangle {
            id: rectangle3
            width: parent.width
            height: parent.height
            gradient: Gradient {
                GradientStop {
                    position: 0
                    color: "#c9d5e2"
                }

                GradientStop {
                    position: 1
                    color: "#0e78ad"
                }
            }

            Image {
                id: background
                x: 0
                y: 0
                width: parent.width
                height: parent.height
                fillMode: Image.PreserveAspectFit
                source: "images/board.svg"
                smooth: true

                Rectangle {
                    id: rectSpike23
                    x: (background.width - background.paintedWidth)/2 + 60*(background.paintedWidth/background.sourceSize.width)
                    y: (background.height - background.paintedHeight)/2 + 50*(background.paintedHeight/background.sourceSize.height)
                    width: 74*(background.paintedWidth/background.sourceSize.width)
                    height: 74*5*(background.paintedHeight/background.sourceSize.height)
                    color: "#00000000"
                }

                Button {
                    id: menuButton
                    width: labelwidth + buttonBorder
                    height: labelheight + buttonBorder
                    radius: 1
                    border.width: 1
                    label: "Menu"
                    fontSize: 24*(background.paintedWidth/background.sourceSize.width)

                    MouseArea {
                        anchors.fill: parent
                        hoverEnabled: true
                        onEntered: { parent.border.color = "gold" }
                        onExited: { parent.border.color = "black" }
                        onClicked: {
                            mainAreaFlipable.flipped = !mainAreaFlipable.flipped
                        }
                    }
                }
            }
        }
        property bool flipped: false

        states: State {
            name: "back"
            PropertyChanges {
                target: rotation
                angle: 180
            }
            when: mainAreaFlipable.flipped
        }

        transform: Rotation {
            id: rotation
            origin.x: mainAreaFlipable.width/2
            origin.y: mainAreaFlipable.height/2
            axis.x: 0
            axis.y: 1
            axis.z: 0
            angle: 0
        }

        transitions: Transition {
            NumberAnimation { target: rotation; property: "angle"; easing.amplitude: 1; easing.period: 0.7; easing.type: Easing.OutElastic; duration: 1500 }
        }

        back: Rectangle {
            id: backSide
            width: parent.width
            height: parent.height
            gradient: Gradient {
                GradientStop {
                    position: 0
                    color: "#3974f3"
                }

                GradientStop {
                    position: 0.52
                    color: "#bbdbe0"
                }

                GradientStop {
                    position: 0.29
                    color: "#3b5180"
                }

                GradientStop {
                    position: 1
                    color: "#acb5cc"
                }
            }

            Button {
                id: startButton
                anchors.right: parent.right
                anchors.rightMargin: 5
                anchors.verticalCenter: parent.verticalCenter
                icon: "images/start.svg"
            }

            MouseArea {
                id: startButtonArea
                anchors.fill: startButton
                hoverEnabled: true
                onEntered: startButton.border.color = "gold"
                onExited: startButton.border.color = "black"
                onClicked: { Script.initialize(); Script.initPortes() }
            }

            Button {
                id: backButton
                anchors.leftMargin: 5
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                icon: "images/back.svg"
            }

            MouseArea {
                id: backButtonArea
                anchors.fill: backButton
                hoverEnabled: true
                onEntered: backButton.border.color = "gold"
                onExited: backButton.border.color = "black"
                onClicked: mainAreaFlipable.flipped = !mainAreaFlipable.flipped
            }

            Button {
                id: netButton
                anchors.bottomMargin: 5
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
                icon: "images/back.svg"
            }

            MouseArea {
                id: netButtonArea
                anchors.fill: netButton
                hoverEnabled: true
                onEntered: netButton.border.color = "gold"
                onExited: netButton.border.color = "black"
                onClicked: { tint.visible = true; netFlipable.visible = true }
            }
        }
    }

    Rectangle {
        id: tint
        color: "#222222"
        opacity: 0.8
        width: parent.width
        height: parent.height
        z: 1
        visible: false

        MouseArea {
            // We use this empty MouseArea to trap mouse clicks from going to the background
            anchors.fill: parent
        }
    }

    Flipable {
        id: netFlipable
        x: (parent.width-width)/2
        y: parent.height/2-height/2
        width: parent.width-parent.width/6
        height: parent.height/4
        visible: false
        opacity: 0.8
        z: 2

        front: Rectangle {
            id: netDialogMain
            width: parent.width
            height: parent.height
            color: "#ffffff"

            Button {
                id: hostButton
                x: parent.width/10
                y: parent.height/2-height/2
                width: labelwidth + buttonBorder
                height: labelheight + buttonBorder
                label: "Host Game"
                fontSize: 50*(background.paintedWidth/background.sourceSize.width)
            }

            MouseArea {
                id: hostButtonArea
                anchors.fill: hostButton
                hoverEnabled: true
                onEntered: hostButton.border.color = "gold"
                onExited: hostButton.border.color = "black"
                onClicked: netFlipable.flipped = !netFlipable.flipped
            }

            Button {
                id: connectButton
                x: parent.width-width-parent.width/10
                y: parent.height/2-height/2
                width: labelwidth + buttonBorder
                height: labelheight + buttonBorder
                label: "Connect to..."
                fontSize: 50*(background.paintedWidth/background.sourceSize.width)
            }

            MouseArea {
                id: connectButtonArea
                anchors.fill: connectButton
                hoverEnabled: true
                onEntered: connectButton.border.color = "gold"
                onExited: connectButton.border.color = "black"
                onClicked: netFlipable.flipped = !netFlipable.flipped
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
                    font.pixelSize: 50*(background.paintedWidth/background.sourceSize.width)
                }

                Button {
                    id: abortButton
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 5
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: labelwidth + buttonBorder
                    height: labelheight + buttonBorder
                    label: "Abort"
                    fontSize: 50*(background.paintedWidth/background.sourceSize.width)
                }

                MouseArea {
                    id: abortButtonArea
                    anchors.fill: abortButton
                    hoverEnabled: true
                    onEntered: abortButton.border.color = "gold"
                    onExited: abortButton.border.color = "black"
                    onClicked: netFlipable.flipped = !netFlipable.flipped
                }
            }

            Rectangle {
                id: connectRect
                width: parent.width
                height: parent.height
                color: "transparent"

                TextInput {
                    id: addressInput
                    y: parent.height/2 - height/2
                    width: parent.width*2/3
                }

                TextInput {
                    id: portInput
                    x: addressInput.width
                    y: parent.height/2 - height/2
                    width: parent.width/3
                    text: dirNet.port
                    inputMask: "ddddd"
                }
            }
        }
    }
}
