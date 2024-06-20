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
    gridSize: 48

    PhysicsWorld {
        id: physicsWorld
        debugDrawVisible: false    // enable this for physics debugging
    }

    EntityManager {
        id: entityManager
    }

    Rectangle {
        anchors.fill: gameScene.gameWindowAnchorItem
        color: "#000000"
    }

    Keys.forwardTo: controller

    Item {
      id: container

      // 5 green rectangles to make the player's movement visible
            Ground {
              x: 0; y: 368
              width: 32
              height: 32
              color: "green"
            }
            Ground {
              x: 32; y: 368
              width: 32
              height: 32
              color: "green"
            }
            Ground {
              x: 64; y: 368
              width: 32
              height: 32
              color: "green"
            }
            Ground {
              x: 96; y: 368
              width: 32
              height: 32
              color: "green"
            }
            Ground {
              x: 64; y: 336
              width: 32
              height: 32
              color: "pink"
            }
            Ground {
              x: 96; y: 304
              width: 32
              height: 32
              color: "blue"
            }
            Ground {
              x: 128; y: 272
              width: 32
              height: 32
              color: "red"
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
