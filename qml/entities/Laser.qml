import QtQuick 2.0
import Felgo 4.0

EntityBase {
    id:_laserEntityBase

    property int attackPower: 10
    property int elongateHeight: 200
    z:3

    entityId: "laser"
    entityType: "laser"
    implicitWidth:_laser.width
    implicitHeight:_laser.height

    MultiResolutionImage{
        id:_laser
        width: 16
        height: 10
        source: Qt.resolvedUrl("../../assets/img/laser/laser1.png")
        visible: true
        SequentialAnimation {
            loops: Animation.Infinite
            running: true
            PauseAnimation { duration: 1200 } // 每隔两秒中止
            NumberAnimation { target: _laser; property: "height"; to: elongateHeight; duration: 300} // 拉长动画
            PauseAnimation { duration: 1000 } // 保持变长状态的时间
            NumberAnimation { target: _laser; property: "height"; to: 10; duration: 300 } // 缩短动画
        }

    }


    BoxCollider{
        id:_boxCollider
        implicitWidth: _laserEntityBase.width
        implicitHeight:_laserEntityBase.height
        anchors.fill:parent
        bodyType: Body.Static
        sensor: true
    }


}
