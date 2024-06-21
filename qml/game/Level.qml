import Felgo 4.0
import QtQuick 2.0
import "../entities"
import "../common"

Item {
    id: level

    width: 10 * gameScene.gridSize

    //底部地面
    Ground { x:0; y:370; size: 200}

    /*悬空道路*/
    Ground { x:0; y:280; size: 5}
    Ground { x:180; y:180; size: 4}
    Ground { x:350; y:250; size: 3}
    Ground { x:480; y:180; size: 3}
    Ground { x:630; y:220; size: 3}
    Ground { x:830; y:270; size: 3}
    Ground { x:930; y:210; size: 3}
    Ground { x:1130; y:240; size: 3}
    Ground { x:1250; y:180; size: 5}
    Ground { x:1430; y:260; size: 3}
    /*悬空道路*/


    //顶部墙壁阻止越界
    Ground { x:0; y:-20; size: 50}
    //左侧墙壁阻止越界
    Ground { x:-32; y:0; size: 1}
    Ground { x:-32 ; y:20; size: 1}
    Ground { x:-32 ; y:40; size: 1}
    Ground { x:-32 ; y:60; size: 1}
    Ground { x:-32 ; y:80; size: 1}
    Ground { x:-32 ; y:100; size: 1}
    Ground { x:-32 ; y:120; size: 1}
    Ground { x:-32 ; y:140; size: 1}
    Ground { x:-32 ; y:160; size: 1}
    Ground { x:-32 ; y:180; size: 1}
    Ground { x:-32 ; y:200; size: 1}
    Ground { x:-32 ; y:220; size: 1}
    Ground { x:-32 ; y:240; size: 1}
    Ground { x:-32 ; y:260; size: 1}
    Ground { x:-32 ; y:280; size: 1}
    Ground { x:-32 ; y:300; size: 1}
    Ground { x:-32 ; y:320; size: 1}
    Ground { x:-32 ; y:340; size: 1}
    Ground { x:-32 ; y:360; size: 1}
    //左侧墙壁阻止越界

    EnemyZombie{
       x:360
       y:230
       width: 55
       height: 25
    }

    EnemyTank{
        id:tank
        x:400
        y:100
        width: 30
        height: 30

        Timer{
            id:tankRotation
            interval: 2
            running: true
            repeat: true
            onTriggered: {
                tank.rotation = Math.atan2(player.y-tank.y,player.x-tank.x)*(180/Math.PI)
                //这个定时器跟踪玩家的移动，然后旋转坦克射击方向，坦克会动态跟踪人物的移动位置射击
                //console.log("x: "+Math.abs((player.x-tank.x)/2))
                //console.log("y: "+Math.abs((player.y-tank.y)/2))
                if(Math.abs(player.x-tank.x)>300)
                {
                    tankAttack.stop()
                }
                if(Math.abs(player.x-tank.x)<=300)
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
                var directionX = player.x - tank.x
                var directionY = player.y - tank.y
                var distance = Math.sqrt(directionX * directionX + directionY * directionY)
                var speed = 200
                var velocityX = (directionX / distance) * speed
                var velocityY = (directionY / distance) * speed

                entityManager.createEntityFromUrlWithProperties(Qt.resolvedUrl("../entities/BulletEnemy.qml"), {
                "shootPosition": Qt.point(tank.x, tank.y),
                "velocity": Qt.point(velocityX, velocityY)
                      });
              }
        }

    }
}
