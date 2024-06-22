import QtQuick
import Felgo 4.0
import "../Controller.js" as Ctrler
EntityBase {
    id:player
    entityId: "player"
    entityType: "player1"
    property alias controller: controller
    property var direction: Qt.point(1, -1) // 初始面向方向为向右,向上

    MultiResolutionImage{
        id:_player
        source: Qt.resolvedUrl("../../assets/img/0.png")
    }

    states: [
            State {
                name: "Walk"
                PropertyChanges {
                    target: collider

                }
            },
            State {
                name: "Fire"
                PropertyChanges {
                    target: collider

                }
            }

        ]

    BoxCollider{
        id:collider
        anchors.fill: parent
        force: Qt.point(player.controller.xAxis * 2000, -player.controller.yAxis * 2000)
        linearDamping: 15   //调节这个值，可以改变人物移动的速度，值越小，移动速度越快
        fixture.onBeginContact:(other,contactNormal)=>{
                        Ctrler.entityBeginCrash(other,contactNormal)

                }
    }

    // this controller helps to move the player
    TwoAxisController {
      id: controller
      inputActionsToKeyCode: {
          "up":Qt.Key_W,
          "down":Qt.Key_S,
          "left":Qt.Key_A,
          "right":Qt.Key_D,
          "fire":Qt.Key_J
      }

      // this controller helps to move the player
      onInputActionPressed: (input)=>{
                                Ctrler.playerInputPressed(input)
                            }
      onInputActionReleased: (input)=>{

                             }
    }
    }


