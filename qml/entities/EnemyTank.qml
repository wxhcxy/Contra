import QtQuick 2.0
import Felgo 4.0


Enemy{
    id:_tankEntityBase

    entityType: "enemyTank"
    width: 30
    height: 30
    source: Qt.resolvedUrl("../../assets/img/enemyWalk.png")

    rotation: 0
}
