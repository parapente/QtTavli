import QtQuick 1.0

Image {
    property int spike: 0
    property int num: 0
    property int position: 0 // 0 up, 1 down
    property real aspect: background.paintedHeight/background.sourceSize.height

    x: Math.floor(spike/6)%2 == 0 ? (background.width - background.paintedWidth)/2 + 60*aspect + (spike%12)*74*aspect : (background.width - background.paintedWidth)/2 + 60*aspect + (spike%12)*74*aspect + 90*aspect
    y: position == 0 ? (background.height-background.paintedHeight)/2 + 50*aspect + num*74*aspect : (background.height-background.paintedHeight)/2 + (50+900-74)*aspect - num*74*aspect
    height: 74*aspect
    width: 74*aspect
    source: "images/pouli4.svg"
    smooth: true
}
