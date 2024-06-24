import Felgo 4.0
import QtQuick 2.0
import "../game"
import "../common"
import "../entities"

SceneBase {
    id: gameScene
    // the "logical size" - the scene content is auto-scaled to match the GameWindow size
    width: 480
    height: 320
    gridSize: 32

    signal gameOver()
    property int background: 0
    property string activeLevelFileName

    function setLevel(fileName) {
        activeLevelFileName = fileName
    }

    EntityManager {
      id: entityManager
      entityContainer: container
    }

    PhysicsWorld {
        id: physicsWorld
        debugDrawVisible: false    // enable this for physics debugging
        gravity.y:98.1
    } 

    // 运行时加载关卡的背景图片
    Loader{
        source: background ? "Background.qml" : ""
    }

    Keys.forwardTo: player.controller

    Item {
      id: container

      // 运行时加载关卡
      Loader {
          id: loader
          source: activeLevelFileName ? "../game/" + activeLevelFileName : ""
          onLoaded: {
              if(activeLevelFileName==="Level1.qml"){
                  camera.limitRight = 2200
                  camera.limitBottom = 400
                  player.x = 100
                  player.y = 240
              }
              //console.log(bg.sourceImage)
          }
      }

      // the player entity
      Player {
        id: player
        x: 100; y:255
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

      limitTop: 0
      limitBottom: 1024
    }

}
