import QtQuick
import Felgo
import "../Controller.js" as Ctrler
Enemy{
    entityType: "zombie"

    id:_zombie
    property alias mirrorX: squaby.mirrorX
    property bool bossCreateZombie: false
    //source:Qt.resolvedUrl("../../assets/img/enemyWalk.png")
    attackPower: 50


    TwoAxisController{
        id:controller
    }

    boxCollider.fixture.onBeginContact: (other, contactNormal)=>{   //子弹发生碰撞后触发的效果
                                            Ctrler.entityBeginCrash(other,contactNormal)
                                         }

    GameSpriteSequence{
        id:squaby
        defaultSource: Qt.resolvedUrl("../../assets/img/zombie.png")
        running: true
        GameSprite{
            name:"climb"
            frameWidth: 63
            frameHeight: 54
            frameCount: 10
            startFrameColumn: 11
            frameRate: 10
        }
        GameSprite{
            name:"walk"
            frameWidth: 63
            frameHeight: 54
            frameCount: 10
            startFrameColumn: 1
            frameRate: 10
        }
    }

    Timer{
        id:zombieMove
        interval: 200
        running: true
        repeat: true
        onTriggered: {
            if(bossCreateZombie){
                var dx = player.x-_zombie.x
                var dy = player.y-_zombie.y
                var distance = Math.sqrt(dx*dx+dy*dy)
                if(dx>0){
                    squaby.mirrorX = true
                }
                if(dx<0){
                    squaby.mirrorX = false
                }
                if(distance>1){
                    var angle = Math.atan2(dy,dx)
                    var speed = 4
                    _zombie.x += Math.cos(angle) * speed
                }
            }
          }
    }
}

