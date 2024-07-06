import QtQuick
import Felgo 4.0
import "../Controller.js" as Ctrler
EntityBase {
    id:player
    entityId: "player"
    entityType: "player1"
    width: 36
    implicitHeight: _player.height
    property alias controller: _controller
    property alias img : _player
    property alias collider : _collider
    property var direction: Qt.point(1, -1) // 初始面向方向为向右,向上
    property int blood: 3000
    property int attackMode: 0 //玩家武器攻击模式，如发射多颗子弹
    property int money : 700
    signal bloodChange(int blood)

    //玩家子弹射击方向判断
    property bool shootUp: false
    property bool shootDown: false
    property bool shootLeft: false
    property bool shootRight: true
    property bool continuousShoot: false
    //判断玩家当前方向
    property bool faceRight:false
    property bool faceLeft: false
    property bool faceDown:false
    property bool squat: false
    property bool fire: false
    property bool jump: false

    GameSpriteSequence {
        id:_player
        anchors.centerIn: parent
        defaultSource: Qt.resolvedUrl("../../assets/img/Player/player1.png")
        GameSprite{
            name:"Idle"
            frameWidth: 47
            frameHeight: 65
            frameCount: 9
            frameY: 122
            frameDuration: 200
        }
        GameSprite{
            name:"Attack"
            frameWidth: 64
            frameHeight: 62
            frameCount: 4
            frameDuration: 125
        }
        GameSprite{
            name:"Squat"   //不知道为什么要高点
            frameWidth: 52
            frameHeight: 50
            frameCount: 2
            frameY: 62
            frameDuration: 200
        }
        GameSprite{
            name:"SquatAndFire"
            frameWidth: 52
            frameHeight: 49
            frameCount: 2
            frameX: 104
            frameY: 62
            frameDuration: 25
        }
        GameSprite{
            name:"Run"
            frameWidth: 42
            frameHeight: 62
            frameCount: 8
            frameY: 186
            frameDuration: 200
        }
        GameSprite{
            name:"Fire"
            frameWidth: 63
            frameHeight: 61
            frameCount: 4
            frameY: 248
            frameDuration: 25
        }


    }


    BoxCollider{
        id:_collider
        anchors.fill: parent
        force: Qt.point(player.controller.xAxis * 2000, -player.controller.yAxis * 2000)
        linearDamping: 10   //调节这个值，可以改变人物移动的速度，值越小，移动速度越快
        fixture.onBeginContact:(other,contactNormal)=>{
                        Ctrler.entityBeginCrash(other,contactNormal)
                        bloodChange(blood)
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
          "jump":Qt.Key_K,
          "squat":Qt.Key_Shift
      }

      // this controller helps to move the player
      onInputActionPressed: (input)=>{
                                Ctrler.playerInputPressed(input)
                                if(!player.faceLeft&&!player.faceRight&&!player.fire&&!player.squat){img.jumpTo("Idle")}
                            }
      onInputActionReleased: (input)=>{
                                Ctrler.playerInputReleased(input)
                                 if(!player.faceLeft&&!player.faceRight&&!player.fire&&!player.squat){img.jumpTo("Idle")}
                             }
    }

    Timer{
        id: continuousShootTimer
        running: false
        repeat: true
        interval: 200
        onTriggered: {
            if(continuousShoot){
                Ctrler.playerActions()
            }
        }

    }

}


