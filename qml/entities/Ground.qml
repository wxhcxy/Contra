import QtQuick
import Felgo

EntityBase {
    id:_ground
    property alias color: _ba.color
    entityId: "barrier"
    entityType: "barrier1"
    width: 32
    height: 32

    Rectangle {
        id:_ba
        width: _ground.width
        height: _ground.height
    }
    BoxCollider{
        id:collider
        width: _ba.width
        height: _ba.height
        anchors.fill:parent
        bodyType: Body.Static
    }
}
