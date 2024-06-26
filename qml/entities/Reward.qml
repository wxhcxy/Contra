//奖励，玩家捡到奖励后，加强攻击力，增加子弹数量等
import QtQuick 2.0
import Felgo 4.0
import "../Controller.js" as Ctrler

EntityBase {
    id:_rewardEntityBase
    property alias source: _reward.source
    property alias boxCollider: _boxCollider
    property int treasureMode: 0//宝物种类，作用
    entityId: "reward"
    entityType: "reward1"


    MultiResolutionImage{
        id:_reward
        width: parent.width
        height: parent.height
        source: Qt.resolvedUrl("../../assets/img/reward/strongbullet.png")
    }

    BoxCollider{
        id:_boxCollider
        implicitWidth: _rewardEntityBase.width
        implicitHeight:_rewardEntityBase.height
        anchors.fill:parent
        bodyType: Body.Static


    }
}
