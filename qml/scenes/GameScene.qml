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

    property int offsetBeforeScrollingStarts: 240

    EntityManager {
      id: entityManager
      entityContainer: container
    }

    PhysicsWorld {
        id: physicsWorld
        debugDrawVisible: false    // enable this for physics debugging
        gravity.y:98.1
    }

    ParallaxScrollingBackground {
        sourceImage: Qt.resolvedUrl( "../../assets/img/bg3.png")
        anchors.bottom: gameScene.gameWindowAnchorItem.bottom
        // player.x 大于 offsetBeforeScrollingStarts（滚动开始的阈值），ParallaxScrollingBackground将
        // 以 -player.horizontalVelocity（与player水平速度相反的速度）移动，且垂直速度为 0。否则，ParallaxScrollingBackground 将保持静止（速度为 0,0）
        movementVelocity: player.x > offsetBeforeScrollingStarts ? Qt.point(-player.horizontalVelocity,0) : Qt.point(0,0)
        // 视差滚动的效果比率,水平方向的比率是 0.3 ParallaxScrollingBackground将在水平方向上以player速度的 30% 滚动。垂直方向的比率为 0，垂直方向上没有视差效果
        ratio: Qt.point(0.3,0)
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
        x: 100; y: 255
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
      limitRight: 1700
      limitTop: 0
      limitBottom: 400
    }




}
