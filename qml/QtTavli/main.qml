import QtQuick 1.0
import "TavliGame.js" as Script

Rectangle {
    id: mainRect
    width: 360
    height: 360
    color: "Black"

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

                Rectangle {
                    id: rectSpike22
                    x: (background.width - background.paintedWidth)/2 + 60*(background.paintedWidth/background.sourceSize.width) + width
                    y: (background.height - background.paintedHeight)/2 + 50*(background.paintedHeight/background.sourceSize.height)
                    width: 74*(background.paintedWidth/background.sourceSize.width)
                    height: 74*5*(background.paintedHeight/background.sourceSize.height)
                    color: "#00000000"
                }

                Rectangle {
                    id: rectSpike21
                    x: (background.width - background.paintedWidth)/2 + 60*(background.paintedWidth/background.sourceSize.width) + 2*width
                    y: (background.height - background.paintedHeight)/2 + 50*(background.paintedHeight/background.sourceSize.height)
                    width: 74*(background.paintedWidth/background.sourceSize.width)
                    height: 74*5*(background.paintedHeight/background.sourceSize.height)
                    color: "#00000000"
                }

                Rectangle {
                    id: rectSpike20
                    x: (background.width - background.paintedWidth)/2 + 60*(background.paintedWidth/background.sourceSize.width) + 3*width
                    y: (background.height - background.paintedHeight)/2 + 50*(background.paintedHeight/background.sourceSize.height)
                    width: 74*(background.paintedWidth/background.sourceSize.width)
                    height: 74*5*(background.paintedHeight/background.sourceSize.height)
                    color: "#00000000"
                }

                Rectangle {
                    id: rectSpike19
                    x: (background.width - background.paintedWidth)/2 + 60*(background.paintedWidth/background.sourceSize.width) + 4*width
                    y: (background.height - background.paintedHeight)/2 + 50*(background.paintedHeight/background.sourceSize.height)
                    width: 74*(background.paintedWidth/background.sourceSize.width)
                    height: 74*5*(background.paintedHeight/background.sourceSize.height)
                    color: "#00000000"
                }

                Rectangle {
                    id: rectSpike18
                    x: (background.width - background.paintedWidth)/2 + 60*(background.paintedWidth/background.sourceSize.width) + 5*width
                    y: (background.height - background.paintedHeight)/2 + 50*(background.paintedHeight/background.sourceSize.height)
                    width: 74*(background.paintedWidth/background.sourceSize.width)
                    height: 74*5*(background.paintedHeight/background.sourceSize.height)
                    color: "#00000000"
                }

                Rectangle {
                    id: rectSpike17
                    x: (background.width - background.paintedWidth)/2 + 60*(background.paintedWidth/background.sourceSize.width) + 6*width + 90*(background.paintedWidth/background.sourceSize.width)
                    y: (background.height - background.paintedHeight)/2 + 50*(background.paintedHeight/background.sourceSize.height)
                    width: 74*(background.paintedWidth/background.sourceSize.width)
                    height: 74*5*(background.paintedHeight/background.sourceSize.height)
                    color: "#00000000"
                }

                Rectangle {
                    id: rectSpike16
                    x: (background.width - background.paintedWidth)/2 + 60*(background.paintedWidth/background.sourceSize.width) + 7*width + 90*(background.paintedWidth/background.sourceSize.width)
                    y: (background.height - background.paintedHeight)/2 + 50*(background.paintedHeight/background.sourceSize.height)
                    width: 74*(background.paintedWidth/background.sourceSize.width)
                    height: 74*5*(background.paintedHeight/background.sourceSize.height)
                    color: "#00000000"
                }

                Rectangle {
                    id: rectSpike15
                    x: (background.width - background.paintedWidth)/2 + 60*(background.paintedWidth/background.sourceSize.width) + 8*width + 90*(background.paintedWidth/background.sourceSize.width)
                    y: (background.height - background.paintedHeight)/2 + 50*(background.paintedHeight/background.sourceSize.height)
                    width: 74*(background.paintedWidth/background.sourceSize.width)
                    height: 74*5*(background.paintedHeight/background.sourceSize.height)
                    color: "#00000000"
                }

                Rectangle {
                    id: rectSpike14
                    x: (background.width - background.paintedWidth)/2 + 60*(background.paintedWidth/background.sourceSize.width) + 9*width + 90*(background.paintedWidth/background.sourceSize.width)
                    y: (background.height - background.paintedHeight)/2 + 50*(background.paintedHeight/background.sourceSize.height)
                    width: 74*(background.paintedWidth/background.sourceSize.width)
                    height: 74*5*(background.paintedHeight/background.sourceSize.height)
                    color: "#00000000"
                }

                Rectangle {
                    id: rectSpike13
                    x: (background.width - background.paintedWidth)/2 + 60*(background.paintedWidth/background.sourceSize.width) + 10*width + 90*(background.paintedWidth/background.sourceSize.width)
                    y: (background.height - background.paintedHeight)/2 + 50*(background.paintedHeight/background.sourceSize.height)
                    width: 74*(background.paintedWidth/background.sourceSize.width)
                    height: 74*5*(background.paintedHeight/background.sourceSize.height)
                    color: "#00000000"
                }

                Rectangle {
                    id: rectSpike12
                    x: (background.width - background.paintedWidth)/2 + 60*(background.paintedWidth/background.sourceSize.width) + 11*width + 90*(background.paintedWidth/background.sourceSize.width)
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
            axis.y: 1;
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
                y: 130
                width: 100
                height: 100
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

        }
    }
}
