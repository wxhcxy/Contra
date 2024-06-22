import QtQuick 2.0
import Felgo 4.0
import "../Controller.js" as Ctrler

Enemy{
    id:_tank

    entityType: "enemyTank"
    source: Qt.resolvedUrl("../../assets/img/tank1.png")

    Image {
        id:_tankGun
        x:4.6
        y:10
        width: 36
        height: 16
        source: "../../assets/img/tankGun1.png"
    }

    boxCollider.fixture.onBeginContact: (other, contactNormal)=>{   //子弹发生碰撞后触发的效果
                                            Ctrler.entityBeginCrash(other,contactNormal)
                                         }

    //rotation: 0

    Timer{
        id:tankRotation
        interval: 2
        running: true
        repeat: true
        onTriggered: {
            _tankGun.rotation = Math.atan2(player.y-_tank.y,player.x-_tank.x)*(180/Math.PI)
            //这个定时器跟踪玩家的移动，然后旋转坦克射击方向，坦克会动态跟踪人物的移动位置射击
            //console.log("x: "+Math.abs((player.x-tank.x)/2))
            //console.log("y: "+Math.abs((player.y-tank.y)/2))
            if(Math.abs(player.x-_tank.x)>330)
            {
                tankAttack.stop()
            }
            if(Math.abs(player.x-_tank.x)<=330)
            {
                tankAttack.start()
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

            entityManager.createEntityFromUrlWithProperties(Qt.resolvedUrl("../entities/BulletEnemy.qml"), {
            "shootPosition": Qt.point(_tank.x+_tank.width/2, _tank.y+_tank.height/2),
            "velocity": Qt.point(velocityX, velocityY)
                  });
          }
    }
}
