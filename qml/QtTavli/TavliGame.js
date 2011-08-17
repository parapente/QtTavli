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
        put(6,1);
        put(0,2);
        put(12,1);
        put(18,2);
    }

    for (i=0;i<2;i++) {
        put(11,2);
        put(23,1);
    }

    for (i=0;i<3;i++) {
        put(4,1);
        put(16,2);
    }
}

function put(spikenum, player) {
    var sprite = pouliComponent.createObject(background);
    if (sprite == null)
        console.log("Error loading component Pouli.qml");
    else {
        sprite.spike = spikenum
        sprite.num = spike[spikenum].length
        sprite.position = Math.floor(spikenum/12)
        console.debug(sprite.spike+","+sprite.num+","+sprite.position+","+sprite.x+","+sprite.y)
        if (player == 1)
            sprite.source = "images/pouli4.svg";
        else
            sprite.source = "images/pouli3.svg";
        spike[spikenum].push(sprite);
        console.debug(diceRoll())
    }
}

function diceRoll() {
    return Math.ceil(Math.random()*6);
}
