var spike = Array(24)
var dices = Array(2)
var numPoulia = 15

function initialize() {
    var i

    for (i=0;i<24;i++) {
        delete spike[i]
        spike[i] = new Array()
    }
}

function initPortes() {
    var i

    for (i=0;i<5;i++) {
        spike[5].push(1)
        spike[11].push(2)
        spike[12].push(1)
        spike[18].push(2)
    }

    for (i=0;i<2;i++) {
        spike[0].push(2)
        spike[23].push(1)
    }

    for (i=0;i<2;i++) {
        spike[7].push(1)
        spike[16].push(2)
    }
}
