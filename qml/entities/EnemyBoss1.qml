import QtQuick 2.0
import Felgo 4.0
import "../Controller.js" as Ctrler

Enemy{
    id:_boss1

    entityType: "enemyBoss1"
    property int attackMode: 0  //BOSS的攻击模式

    width: 38
    height: 34
    blood: 3000

    Rectangle{
        width: 100
        height: 100
        color: "red"
    }

    boxCollider.fixture.onBeginContact: (other, contactNormal)=>{   //子弹发生碰撞后触发的效果
                                            Ctrler.entityBeginCrash(other,contactNormal)
                                         }

    Timer{
        id:tankRotation
        interval: 2
        running: true
        repeat: true
        onTriggered: {
            if((Math.abs(player.x-_boss1.x)>300)||(Math.abs(player.y-_boss1.y)>300))
            {
                tankAttack.stop()
            }
            if((Math.abs(player.x-_boss1.x)<=300)||(Math.abs(player.y-_boss1.y)<=300))
            {
                tankAttack.start()
            }
        }
    }
    Timer{
        id:tankAttack
        interval: 1300
        running: true
        repeat: true
        property  int num : 0
        onTriggered: {
            var bulletUrl = Qt.resolvedUrl("../entities/BulletEnemy.qml")
            var shootPosition = Qt.point(_boss1.x+_boss1.width/2, _boss1.y+_boss1.height/2)
            var startAngle = 90 //子弹最初开始射出的角度
            var angleStep = 360/26
            var radius = 150
            var vd = 1 //这个值是来改变下一颗子弹的速度大小的，以达到裴波那契螺旋线的效果

            if(num===3){
                attackMode=1
            }
            if(num===0){
                attackMode=0
            }

            if(attackMode===0){
                for(var i = 0; i<26; ++i){
                    var angle = startAngle + i*angleStep;
                    var radians = angle*Math.PI/180;
                    var velocityX = Math.cos(radians)*radius;
                    var velocityY = Math.sin(radians)*radius;
                    var velocity = Qt.point(velocityX, velocityY);
                    Ctrler.shootBullet(bulletUrl, shootPosition, Qt.point(velocityX*vd, velocityY*vd), 30)
                    vd+=0.2 //改变下一颗子弹的速度
                }
                num++
            }
            if(attackMode===1){
                for(i = 0; i<26; ++i){
                    radius=300
                    angle = i*angleStep;
                    radians = angle*Math.PI/180;
                    velocityX = Math.cos(radians)*radius;
                    velocityY = Math.sin(radians)*radius;
                    velocity = Qt.point(velocityX, velocityY);
                    Ctrler.shootBullet(bulletUrl, shootPosition, Qt.point(velocityX, velocityY), 30)
                }
                num=0
            }
        }
    }



}
