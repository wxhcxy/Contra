import Felgo
import QtQuick
import"entities"
import "scenes"

GameWindow {

  activeScene: gameScene

  EntityManager {
    id: entityManager
    entityContainer: gameScene
  }

GameScene {
    id: gameScene

    // set scene alignment
    sceneAlignmentX: "left"
    sceneAlignmentY: "top"
  }
}
