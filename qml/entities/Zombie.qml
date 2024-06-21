import QtQuick
import Felgo

Enemy{
    entityType: "zombie"
    id:_zombie

        source:Qt.resolvedUrl("../../assets/img/enemyWalk.png")


    TwoAxisController{
        id:controller
    }

    BoxCollider{
        id:collider
        bodyType: Body.Static
        implicitHeight: parent.width
        implicitWidth: parent.height




}
}
