import QtQuick 2.0
import Felgo 4.0

EntityBase {
    id:_enemyEntityBase
    property alias source: _enemy.source
    property alias boxCollider: _boxCollider
    property int blood: 100 //敌人血量
    property int attackPower: 30
    entityId: "enemy"

    poolingEnabled: true


    MultiResolutionImage{
        id:_enemy
        width: parent.width
        height: parent.height
        source: Qt.resolvedUrl("")
    }

    BoxCollider{
        id:_boxCollider
        implicitWidth: _enemyEntityBase.width
        implicitHeight:_enemyEntityBase.height
        anchors.fill:parent
        bodyType: Body.Static
    }

    Connections{
        target: gameScene
        function onGameOver(){
            _enemyEntityBase.destroy()
        }
    }

}
