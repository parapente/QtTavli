var spike = Array(24);
var dices = Array(2);
var numPoulia = 15;
var pouliComponent;
var playersTurn = Math.random();

function initialize() {
    var i,j;

    for (i=0;i<24;i++) {
        if (spike[i] != null) {
            for (j=0;j<spike[i].length;j++)
                spike[i][j].destroy()
            delete spike[i];
        }
        spike[i] = new Array();
    }
    pouliComponent = Qt.createComponent("Pouli.qml");
}

function initPortes() {
    var i;

    for (i=0;i<5;i++) {
        if (i==4) {
            put(6, 1, true);
            put(0, 2, true);
            put(12, 1, true);
            put(18, 2, true);
        }
        else {
            put(6, 1, false);
            put(0, 2, false);
            put(12, 1, false);
            put(18, 2, false);
        }
    }

    for (i=0;i<2;i++) {
        if (i==1) {
            put(11, 2, true);
            put(23, 1, true);
        }
        else {
            put(11, 2, false);
            put(23, 1, false);
        }
    }

    for (i=0;i<3;i++) {
        if (i==2) {
            put(4, 1, true);
            put(16, 2, true);
        }
        else {
            put(4, 1, false);
            put(16, 2, false);
        }
    }
}

function put(spikenum, player, dragEnabled) {
    var sprite = pouliComponent.createObject(background);
    if (sprite == null) {
        console.log("Error loading component Pouli.qml");
        console.log(pouliComponent.errorString());
    }
    else {
        sprite.spike = spikenum
        sprite.num = spike[spikenum].length
        sprite.position = Math.floor(spikenum/12)
        sprite.player = player
        sprite.enableDrag = dragEnabled
        if (player == 1)
            sprite.source = "images/pouli4.svg";
        else
            sprite.source = "images/pouli3.svg";
        spike[spikenum].push(sprite);
    }
}

function showAvailableMoves(spike) {
    // TODO: Implement
}

function hideAvailableMoves(spike) {
    // TODO: Implement
}

function checkMove(spike, x, y) {
    console.log(spike, x, y)
}
