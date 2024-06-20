import QtQuick 2.0
import Felgo 4.0
import QtQuick.Layouts

TiledEntityBase {
    id: layer
    entityType: "layer"

    size: 2

    ColumnLayout{
        Row {
            id:rowItem
            Tile {
              pos: "left"
              image: Qt.resolvedUrl("../../assets/img/layer1.png")
            }
            Repeater {
              model: size-2
              Tile {
                pos: "mid"
                image: Qt.resolvedUrl("../../assets/img/layer1.png")
              }
            }
            Tile {
              pos: "right"
              image: Qt.resolvedUrl("../../assets/img/layer1.png")
            }
        }

        Ground {
            id: greenGround
            anchors.top: rowItem.bottom
            anchors.topMargin: -2
            size: layer.size
        }
    }

}
