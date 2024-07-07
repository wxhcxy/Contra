import QtQuick 2.0
import Felgo 4.0
import "../Controller.js" as Ctrler

Enemy{
    id:_boss3

    entityType: "enemyBoss3"
    blood: 3000
    implicitWidth: 90
    implicitHeight: 80
    attackPower: 100
    property int attackMode: 0
    property double originalX
    property double originalY

    GameSpriteSequence{
        id:boss3
        width: 110
        height: 70
        defaultSource: Qt.resolvedUrl("../../assets/img/boss/boss3.png")
        running: true
        GameSprite{
            frameWidth: 220
            frameHeight: 140
            frameCount: 6
            frameDuration: 180
        }
    }

    boxCollider.fixture.onBeginContact: (other, contactNormal)=>{
                                            Ctrler.entityBeginCrash(other,contactNormal)
                                         }

    onEntityDestroyed: {
        gameOver()
    }

    Timer {
        id: moveTimer
        interval: 200
        running: true
        repeat: true
        onTriggered: {
            var dx = player.x-_boss3.x
            var dy = player.y-_boss3.y
            var distance = Math.sqrt(dx*dx+dy*dy)
            var dx2 = _boss3.x-originalX
            var dy2 = _boss3.y-originalY
            var distance2 = Math.sqrt(dx2*dx2+dy2*dy2)
            if(dx>0){
                boss3.mirrorX = true
            }
            if(dx<0){
                boss3.mirrorX = false
            }
            if(distance>1 && distance2 < 400){
                var angle = Math.atan2(dy,dx)
                var speed = 4
                _boss3.x += Math.cos(angle) * speed
            }
        }

    }

    Timer {
        id: attackTimer
        interval: 2500
        running: true
        repeat: true
        property double velocityX
        property double velocityY
        property url bulletUrl
        property var shootPosition
        onTriggered: {
            var directionX = player.x - _boss3.x
            var directionY = player.y - _boss3.y
            var distance = Math.sqrt(directionX * directionX + directionY * directionY)
            if(distance < 200){
            var speed = 300
            velocityX = (directionX / distance) * speed
            velocityY = (directionY / distance) * speed
            bulletUrl = Qt.resolvedUrl("../entities/BossBullet3.qml")
            shootPosition = Qt.point(_boss3.x+_boss3.width/2, _boss3.y+_boss3.height/2)
            Ctrler.shootBullet(bulletUrl, shootPosition, Qt.point(velocityX, velocityY), 30)
            bulletTimer.start()
            }
        }
    }

    Timer {
        id: bulletTimer
        interval: 100
        repeat: true
        property int num: 0
        onTriggered: {
            Ctrler.shootBullet(attackTimer.bulletUrl, attackTimer.shootPosition, Qt.point(attackTimer.velocityX, attackTimer.velocityY), 30)
            num++
            if(num === 2){
                num = 0
                bulletTimer.stop()
            }
        }
    }
}
