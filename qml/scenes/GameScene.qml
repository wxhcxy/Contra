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

    EntityManager {
      id: entityManager
      entityContainer: container
    }

    PhysicsWorld {
        id: physicsWorld
        debugDrawVisible: false    // enable this for physics debugging
    }


    Keys.forwardTo: controller

    Item {
      id: container

      // 5 green rectangles to make the player's movement visible
      Ground {
        x: 0; y: 0
        width: 2
        height: 700
        color: "green"
      }
            Ground {
              x: 0; y: 268
              width: 200
              height: 32
              color: "green"
            }
            Ground {
              x: 230; y: 170
              width: 100
              height: 32
              color: "pink"
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
          inputActionsToKeyCode: {
              "up":Qt.Key_Up,
              "down":Qt.Key_Down,
              "left":Qt.Key_Left,
              "right":Qt.Key_Right,
              "fire":Qt.Key_D
          }
          // this controller helps to move the player
          onInputActionPressed: (input)=>{
                                    if(input==="fire")
                                    {
                                        //player.states
                                        entityManager.createEntityFromUrlWithProperties(Qt.resolvedUrl("../entities/Bullet.qml"), {
                                             //动态创建一个新的子弹实体，并为其设置初始属性
                                             "shootPosition" : Qt.point(player.x + player.width , player.y + player.height / 2 -10),
                                             "velocity" : Qt.point(300, 0)
                                             //子弹的速度方向是用这个坐标计算的,
                                             //如（30,0）x方向为30,y方向为0,那么子弹就向x方向运动，
                                             //如果（30,30），那么子弹就向右下角运动，矢量和
                                         });
                                        entityManager.createEntityFromUrlWithProperties(Qt.resolvedUrl("../entities/Bullet.qml"), {
                                             "shootPosition" : Qt.point(player.x + player.width, player.y + player.height / 2 -10),
                                             "velocity" : Qt.point(300, 50)
                                         });
                                        entityManager.createEntityFromUrlWithProperties(Qt.resolvedUrl("../entities/Bullet.qml"), {
                                             "shootPosition" : Qt.point(player.x + player.width, player.y + player.height / 2 -10),
                                             "velocity" : Qt.point(300, -50)
                                         });
                                    }
                                }
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
