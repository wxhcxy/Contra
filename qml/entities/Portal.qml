import QtQuick
import Felgo

EntityBase {

    entityId: "door"
    entityType: "portal"
    property int portX
    property int portY
    Rectangle {
        id: rect
        width: 50
        height: 50
        color: "red"
        Text {
            anchors.centerIn: parent
            text: qsTr("PorTal")
        }
    }

    BoxCollider {
        anchors.fill: rect
        body.bodyType:Body.Static
    }

}
