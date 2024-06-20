import QtQuick
import Felgo 4.0

EntityBase {

    entityId: "role"
    entityType: "player1"

    MultiResolutionImage{
        id:_player
        source: Qt.resolvedUrl("../../assets/img/0.png")
    }


    BoxCollider{
        id:collider
        width: _player.width
        height: _player.height
        collisionTestingOnlyMode : true
        bullet: false
        bodyType: Body.Dynamic
        anchors.fill:_player
    }

}
