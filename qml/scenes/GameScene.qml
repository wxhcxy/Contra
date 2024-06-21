import Felgo 4.0
import QtQuick 2.0
import "../game"
import "../common"
import "../entities"

Scene {
    id: gameScene
    // the "logical size" - the scene content is auto-scaled to match the GameWindow size
    width: 480
    height: 320
    gridSize: 32

    EntityManager {
      id: entityManager
      entityContainer: container
    }

    PhysicsWorld {
        id: physicsWorld
        debugDrawVisible: false    // enable this for physics debugging
    }

    Image {
        anchors.fill: gameScene.gameWindowAnchorItem
        source: "../../assets/img/background.png"
    }


    Keys.forwardTo: player.controller

    Item {
      id: container

      Level {
          id: level
      }

      // the player entity
      Player {
        id: player
        x: 100; y: 100
        width: 32
        height: 63
      }

    }


    Camera {
      id: camera

      // set the gameWindowSize and entityContainer required for the camera
      gameWindowSize: Qt.point(gameScene.gameWindowAnchorItem.width, gameScene.gameWindowAnchorItem.height)
      entityContainer: container

      // the camera follows the player
      focusedObject: player

      // set the camera's limits
      limitLeft: 0
      limitRight: 700
      limitTop: 0
      limitBottom: 400
    }




}
