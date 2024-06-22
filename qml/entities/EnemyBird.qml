import QtQuick
import Felgo
import "../Controller.js" as Ctrler

Enemy {
    id: birdEnemy
    entityType: "bird"
    property double originX: x
    property double originY: y
    width: 30
    height: 20

Item {
    id:_birdItem
    width: bird.width ; height: bird.width
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.verticalCenter: parent.verticalCenter

    /*TapHandler {
        onTapped: {
         birdEnemy.destroy()
        }
    }*/
        SequentialAnimation {
            id: _birdBegin
            ScriptAction { script: bird.goalSprite = "6"; }
            loops: Animation.Infinite    // 设置动画为无限循环
        }

        SpriteSequence {
            id: bird; width: 96; height: 96; goalSprite: ""
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            Sprite{
                name: "1"; source: "../../assets/img/Bird/00.png"
                frameDuration: 200
                to: {"2":1}
            }

            Sprite{
                name: "2"; source: "../../assets/img/Bird/01.png"
                frameDuration: 200
                to: {"3":1}
            }
            Sprite{
                name: "3"; source: "../../assets/img/Bird/02.png"
                frameDuration: 200
                to: {"4":1}
            }
            Sprite{
                name: "4"; source: "../../assets/img/Bird/03.png"
                frameDuration: 200
                to: {"5":1}
            }
            Sprite{
                name: "5"; source: "../../assets/img/Bird/04.png"
                frameDuration: 200
                to: {"6":1}
            }

            Sprite{
                name: "6"; source: "../../assets/img/Bird/05.png"
                frameDuration: 200
                to: {"1":1}
            }
        }

        // 添加gif图片发现有背景图
        /* AnimatedImage {
            width: 32
            height: 32
            id:_birdEnemy
            source: Qt.resolvedUrl("../../assets/img/bird_die.gif")
            paused: false
        } */

        Timer {
             id: trackTimer
             interval: 200
             repeat: true
             onTriggered: {
                 // 计算玩家与鸟之间的距离
                 var dx1 = Math.abs(birdEnemy.x - player.x )
                 var dy1 = Math.abs(birdEnemy.y - player.y )
                 var d1 = Math.sqrt(dx1*dx1 + dy1*dy1)
                 //console.log(d)
                 if(d1 < 180){
                     // the size of player is 63*61
                     if(player.x < 0){ player.x = 0; trackTimer.stop(); waitTimer.start()}
                     if((player.y + 63) > 370){ player.y = 307; trackTimer.stop(); waitTimer.start()}

                     // player在鸟的左上角
                     if(birdEnemy.x > player.x && birdEnemy.y > player.y)
                     { birdEnemy.x -= 5; birdEnemy.y -= 5 }

                     // player在鸟的左下角
                     if(birdEnemy.x > player.x && birdEnemy.y < player.y)
                     { birdEnemy.x -= 5; birdEnemy.y += 5 }

                     // player在鸟的右上角
                     if(birdEnemy.x < player.x && birdEnemy.y > player.y)
                     { birdEnemy.x += 5; birdEnemy.y -= 5 }

                     // player在鸟的右下角
                     if(birdEnemy.x < player.x && birdEnemy.y < player.y)
                     { birdEnemy.x += 5; birdEnemy.y += 5 }

                     // 计算玩家与鸟之间的距离
                     var dx2 = Math.abs(birdEnemy.x - player.x )
                     var dy2 = Math.abs(birdEnemy.y - player.y)
                     var d2 = Math.sqrt(dx2*dx2 + dy2*dy2)
                     if(d2 < 30){
                         Ctrler.playerBeginCrash(player, birdEnemy)
                     }
                     // 如果到达目标位置，停止定时器
                     //if (Math.abs(birdEnemy.x - player.x) < 50 && Math.abs(birdEnemy.y - player.y) < 50)
                     //{ trackTimer.stop(); waitTimer.start() }
             }
         }

     }

        Timer {
            id: waitTimer
            interval: 3000
            repeat: true
            onTriggered: trackTimer.restart()
        }

    Component.onCompleted:{ trackTimer.start() }

    }


    boxCollider.fixture.onBeginContact: (other, contactNormal)=>{ Ctrler.entityBeginCrash(other, contactNormal) }
}

