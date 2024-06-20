import Felgo
import QtQuick
import"entities"
import "scenes"

GameWindow {

  activeScene: gameScene

  EntityManager {
    id: entityManager

    entityContainer: gameScene.container
  }

  GameScene {
    id: gameScene

    // set scene alignment
    sceneAlignmentX: "left"
    sceneAlignmentY: "top"

    // forward the keyboard input to the TwoAxisController
    Keys.forwardTo: controller

    Item {
      id: container

      PhysicsWorld {
        debugDrawVisible: false
      }

      // the controllable entity
      Player {
        id: player
        x: 100; y: 100
        width: 32
        height: 63
        // this controller helps to move the player
        TwoAxisController {
          id: controller
        }
        BoxCollider{
            anchors.fill: parent
            force: Qt.point(controller.xAxis * 2000, -controller.yAxis * 2000)
            linearDamping: 15
        }
      }

      // 5 green rectangles to make the player's movement visible
            Barrier {
              x: 0; y: 368
              width: 32
              height: 32
              color: "green"
            }
            Barrier {
              x: 32; y: 368
              width: 32
              height: 32
              color: "green"
            }
            Barrier {
              x: 64; y: 368
              width: 32
              height: 32
              color: "green"
            }
            Barrier {
              x: 96; y: 368
              width: 32
              height: 32
              color: "green"
            }
            Barrier {
              x: 64; y: 336
              width: 32
              height: 32
              color: "pink"
            }
            Barrier {
              x: 96; y: 304
              width: 32
              height: 32
              color: "blue"
            }
            Barrier {
              x: 128; y: 272
              width: 32
              height: 32
              color: "red"
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
}
