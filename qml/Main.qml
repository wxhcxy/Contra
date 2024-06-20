import Felgo
import QtQuick
import"entities"
import "scenes"

GameWindow {

  activeScene: gameScene



GameScene {
    id: gameScene

    // set scene alignment
    sceneAlignmentX: "left"
    sceneAlignmentY: "top"
  }
}
