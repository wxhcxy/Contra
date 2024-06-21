import QtQuick 2.0
import Felgo 4.0

EntityBase {
    id:_enemyEntityBase
    property alias source: _enemy.source

    MultiResolutionImage{
        id:_enemy
        source: Qt.resolvedUrl("")
    }

    BoxCollider{
        id:collider
        implicitWidth: _enemyEntityBase.width
        implicitHeight:_enemyEntityBase.height
        anchors.fill:parent
        bodyType: Body.Static
    }
}
