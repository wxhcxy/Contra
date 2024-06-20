import QtQuick 2.0
import Felgo 4.0
import QtQuick.Layouts

TiledEntityBase {
  id: ground
  entityType: "ground"

  size: 2

  Row {
    id: tileRow

    Tile {
      pos: "left"
      //image: Qt.resolvedUrl("../../assets/img/layer1.png")
      image: Qt.resolvedUrl("../../assets/img/ground.png")
    }
    Repeater {
      model: size-2
      Tile {
        pos: "mid"
        image: Qt.resolvedUrl("../../assets/img/ground.png")
      }
    }
    Tile {
      pos: "right"
      image: Qt.resolvedUrl("../../assets/img/ground.png")
    }
  }

}
