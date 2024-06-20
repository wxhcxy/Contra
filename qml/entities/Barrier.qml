import QtQuick
import Felgo

EntityBase {
    property alias color: _ba.color
    entityId: "barrier"
    entityType: "barrier1"

    Rectangle {
        id:_ba
        width: 32
        height: 32

    }
    BoxCollider{
        id:collider
        width: _ba.width
        height: _ba.height
        anchors.fill:parent
        bodyType: Body.Static
    }
}
