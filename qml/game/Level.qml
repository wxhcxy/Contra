import Felgo 4.0
import QtQuick 2.0
import "../entities"
import "../common"
import "." as Levels

Item {
    id: level
    // we need to specify the width to get correct debug draw for our physics
    // the PhysicsWorld component fills it's parent by default, which is the viewPort Item of the gameScene and this item uses the size of the level
    // NOTE: thy physics will also work without defining the width here, so no worries, you can ignore it untill you want to do some physics debugging
    width: 45 * gameScene.gridSize // 42 because our last tile is a size 30 Ground at row 12

    // you could draw your level on a graph paper and then add the tiles here only by their row, column and size
    Layer {
      row: 0
      column: 2
      size: 8
    }

    Platform {
      row: 3
      column: 0
      size: 3
    }
    Platform {
      row: 9
      column: 2
      size: 2
    }
    Platform {
      row: 11
      column: 2
      size: 2
    }
    Layer {
      row: 12
      column: 2
      size: 18
    }
    Platform {
      row: 17
      column: 3
      size: 7
    }

}
