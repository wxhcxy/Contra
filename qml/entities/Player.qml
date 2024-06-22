import QtQuick
import Felgo 4.0
import "../Controller.js" as Ctrler
EntityBase {
    id:player
    entityId: "player"
    entityType: "player1"
    property alias controller: _controller
    property alias img : _player
    property alias collider : _collider
    property var direction: Qt.point(1, -1) // 初始面向方向为向右,向上

    AnimatedSprite {
        id:_player

        frameWidth: 47
        frameHeight: 62
        frameCount: 9
        frameRate: 5
        source: "../../assets/img/Player/Idle.png"
        interpolate: true

    }


    BoxCollider{
        id:_collider
        anchors.fill: parent
        force: Qt.point(player.controller.xAxis * 2000, -player.controller.yAxis * 2000)
        linearDamping: 15   //调节这个值，可以改变人物移动的速度，值越小，移动速度越快
        fixture.onBeginContact:(other,contactNormal)=>{
                        Ctrler.entityBeginCrash(other,contactNormal)

                }

    }

    // this controller helps to move the player
    TwoAxisController {
      id: _controller
      inputActionsToKeyCode: {
          "up":Qt.Key_W,
          "down":Qt.Key_S,
          "left":Qt.Key_A,
          "right":Qt.Key_D,
          "fire":Qt.Key_J,
          "jump":Qt.Key_K
      }

      // this controller helps to move the player
      onInputActionPressed: (input)=>{
                                Ctrler.playerInputPressed(input)
                            }
      onInputActionReleased: (input)=>{
                                Ctrler.playerInputReleased(input)
                             }
    }

    //玩家的所有状态
     states: [
         State {
             name: "Fire"
             PropertyChanges {
                 target: _player
                 source : "../../assets/img/Player/Shot.png"
                 frameWidth : 63
                 frameHeight : 61
                 frameCount : 1
                 frameRate :10

             }
         },
             State {
                 name: "Idle"
                 PropertyChanges {
                     target: _player
                     source:"../../assets/img/Player/Idle.png"
                     frameWidth : 47
                     frameHeight : 62
                     frameCount :9
                     frameRate: 5
                 }
             },
             State {
                 name: "Left"
                 PropertyChanges {
                     target: _player
                     source:"../../assets/img/Player/LeftWalk.png"
                     frameWidth : 33
                     frameHeight : 65
                     frameCount :7
                     frameRate: 5
                 }
             },
             State {
                 name: "Right"
                 PropertyChanges {
                     target: _player
                     source:"../../assets/img/Player/RightWalk.png"
                     frameWidth : 33
                     frameHeight : 65
                     frameCount :7
                     frameRate: 5
                 }
             },
             State {
                 name: "Up"
                 PropertyChanges {
                     target: _player

                 }
             },
             State {
                 name: "Down"
                 PropertyChanges {
                     target: _player

                 }
             },
             State{
                 name:"Jump"
                 PropertyChanges {
                     target: _player

                 }
             },
             State{
                 name:"Dodge"
                 PropertyChanges {
                     target: _player

                 }
             }

         ]


    }


