import QtQuick 2.0
import Felgo 4.0
import "../Controller.js" as Ctrler

Enemy{
    id:_tank

    entityType: "enemyTank"
    source: Qt.resolvedUrl("../../assets/img/tank1.png")
    width: 60
    height: 58
    attackPower: 20


    Image {
        id:_tankGun
        x:14
        y:14
        width: 46
        height: 26
        source: Qt.resolvedUrl("../../assets/img/tankGun1.png")
    }

    boxCollider.fixture.onBeginContact: (other, contactNormal)=>{   //子弹发生碰撞后触发的效果
                                            Ctrler.entityBeginCrash(other,contactNormal)
                                         }

    onEntityDestroyed: {
        squaby.x = _tank.x - _tank.width/2
        squaby.y = _tank.y - _tank.height/2
        squaby.z = 2
        squaby.running = true
        squaby.visible = true
        if(settings.soundEnabled){
        tankExplosion.play()
        }
    }


    Timer{
        id:tankRotation
        interval: 50
        running: true
        repeat: true
        onTriggered: {
            _tankGun.rotation = Math.atan2(player.y-_tank.y,player.x-_tank.x)*(180/Math.PI)
            //这个定时器跟踪玩家的移动，然后旋转坦克射击方向，坦克会动态跟踪人物的移动位置射击
            if((Math.abs(player.x-_tank.x)<=300)&&(Math.abs(player.y-_tank.y)<=200))
            {
                tankAttack.start()
            }
            else{
                tankAttack.stop()
            }
        }
    }
    Timer{
        id:tankAttack
        interval: 1000
        running: true
        repeat: true
        onTriggered: {
            //这个定时器控制坦克发射子弹，每隔1秒朝玩家位置发射一颗炮弹
            var directionX = player.x - _tank.x
            var directionY = player.y - _tank.y
            var distance = Math.sqrt(directionX * directionX + directionY * directionY)
            var speed = 200
            var velocityX = (directionX / distance) * speed
            var velocityY = (directionY / distance) * speed
            var bulletUrl = Qt.resolvedUrl("../entities/BulletEnemy.qml")
            var shootPosition = Qt.point(_tank.x+_tank.width/2, _tank.y+_tank.height/2)

            Ctrler.shootBullet(bulletUrl, shootPosition, Qt.point(velocityX, velocityY), 30)
          }
    }
}
