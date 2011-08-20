import QtQuick 1.0
import "TavliGame.js" as Script

Image {
    property int spike: 0
    property int num: 0 // Position on the spike
    property int position: 0 // 0 up, 1 down
    property int player
    property alias enableDrag: pouliMouseArea.enabled

    x: Math.floor(spike/6)%2 == 0 ? (background.width - background.paintedWidth)/2 + helper.borderX*helper.ratio + (spike%12)*helper.spikeWidth*helper.ratio : (background.width - background.paintedWidth)/2 + helper.borderX*helper.ratio + (spike%12)*helper.spikeWidth*helper.ratio + helper.middleSpace*helper.ratio
    y: position == 0 ? (background.height-background.paintedHeight)/2 + helper.borderY*helper.ratio + num*helper.spikeWidth*helper.ratio : (background.height-background.paintedHeight)/2 + (helper.boardHeight-helper.borderY-helper.spikeWidth)*helper.ratio - num*helper.spikeWidth*helper.ratio
    height: helper.spikeWidth*helper.ratio
    width: helper.spikeWidth*helper.ratio
    source: "images/pouli4.svg"
    smooth: true

    MouseArea {
        id: pouliMouseArea
        anchors.fill: parent
        drag.target: parent
        drag.axis: Drag.XandYAxis
        drag.minimumX: 0
        drag.maximumX: mainRect.width - parent.width
        drag.minimumY: 0
        drag.maximumY: mainRect.height - parent.height
        onPressed: { Script.showAvailableMoves(spike, player) }
        onReleased: { Script.hideAvailableMoves(spike, player); Script.checkMove(spike, parent.x, parent.y) }
    }
}
