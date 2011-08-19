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

    Dice {
        id: dice
        seed: 100
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
                icon: "images/earth.svg"
            }

            MouseArea {
                id: netButtonArea
                anchors.fill: netButton
                hoverEnabled: true
                onEntered: netButton.border.color = "gold"
                onExited: netButton.border.color = "black"
                //onClicked: { tint.visible = true; netFlipable.visible = true }
                onClicked: { tint.state = "visible"; netFlipable.visible = true }
            }
        }
    }

    Rectangle {
        id: tint
        color: "#222222"
        opacity: 0.8
        width: 0
        height: 0
        z: 1
        visible: true

        MouseArea {
            // We use this empty MouseArea to trap mouse clicks from going to the background
            anchors.fill: parent
        }

        Behavior on width { SmoothedAnimation { velocity: 1000 } }
        Behavior on height { SmoothedAnimation { velocity: 1000 } }

        states: [ State {
            name: "visible"
            PropertyChanges {
                target: tint
                width: tint.parent.width
                height: tint.parent.height
            }
        },
            State {
            name: "invisible"
            PropertyChanges {
                target: tint
                width: 0
                height: 0
            }
        }
        ]

        //NumberAnimation { properties: "width,height"; from: 0; easing.type: Easing.InOutQuad; duration: 2000 }
    }

    NetDialog {
        id: netFlipable
        ratio: background.paintedWidth/background.sourceSize.width
        address: dirNet.address
        port: dirNet.port
    }
}
