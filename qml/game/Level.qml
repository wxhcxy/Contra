import Felgo 4.0
import QtQuick 2.0
import "../entities"
import "../common"

Item {
    id: level

    width: 10 * gameScene.gridSize

    Ground {
      row: 0
      column: -6
      size: 5
    }

   Ground {
      row: 7
      column: -6
      size: 3
    }

    Ground {
      row: 10
      column: -4
      size: 2
    }

}
