import QtQuick 2.0
import Felgo 4.0
import "../Controller.js" as Ctrler

Enemy{
    id:_snow

    entityType: "enemySnow"
    source: Qt.resolvedUrl("../../assets/img/snow/snow.png")
    width: 60
    height: 58
    attackPower: 30

    boxCollider.fixture.onBeginContact: (other, contactNormal)=>{
                                            Ctrler.entityBeginCrash(other,contactNormal)
                                         }


    Timer{
        id:snowRotation
        interval: 300
        running: true
        repeat: true
        onTriggered: {
            if((Math.abs(player.x-_snow.x)<=300)&&(Math.abs(player.y-_snow.y)<=200))
            {
                snowAttack.start()
            }
            else{
                snowAttack.stop()
            }
        }
    }
    Timer{
        id:snowAttack
        interval: 2500
        running: false
        repeat: true
        onTriggered: {
            var directionX = player.x - _snow.x
            var directionY = player.y - _snow.y
            var distance = Math.sqrt(directionX * directionX + directionY * directionY)
            var speed = 200
            var velocityX = (directionX / distance) * speed
            var velocityY = (directionY / distance) * speed
            var bulletUrl = Qt.resolvedUrl("../entities/SnowBullet.qml")
            var shootPosition = Qt.point(_snow.x+_snow.width/2, _snow.y+_snow.height/2)

            Ctrler.shootBullet(bulletUrl, shootPosition, Qt.point(velocityX, velocityY), 30)
          }
    }
}
