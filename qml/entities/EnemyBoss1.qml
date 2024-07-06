import QtQuick 2.0
import Felgo 4.0
import "../Controller.js" as Ctrler

Enemy{
    id:_boss1

    entityType: "enemyBoss1"
    property int attackMode: 0  //BOSS的攻击模式
    property int startAngleMode1: 135 // boss attackMode1扇形的起始角度
    property int endAngleMode1: 235 // boss attackMode1扇形的结束角度
    blood: 3000
    implicitWidth: _boss.width
    implicitHeight: _boss.height
    attackPower: 100

    Image {
        id:_boss
        width: 100
        height: 300
        source: Qt.resolvedUrl("../../assets/img/boss/boss1.png")
    }

    boxCollider.fixture.onBeginContact: (other, contactNormal)=>{   //子弹发生碰撞后触发的效果
                                            Ctrler.entityBeginCrash(other,contactNormal)
                                         }

    onEntityDestroyed: {
        gameOver()
    }


    Timer{
        id:bossTrack    //判断玩家与boss的距离，距离达到时，boss开始攻击
        interval: 1000
        running: true
        repeat: true
        onTriggered: {
            if((Math.abs(player.x-_boss1.x)<=310))
            {
                bossAttack.start()
                zombieCreate.start()
            }
        }
    }
    Timer{
        id:bossAttack
        interval: 1300
        running: false
        repeat: true
        property  int num : 0
        onTriggered: {
            bossTrack.stop()
            var bulletUrl = Qt.resolvedUrl("../entities/BulletEnemy.qml")
            var shootPosition = Qt.point(_boss1.x+_boss1.width/2, _boss1.y+_boss1.height/2)
            var startAngle = 90 //子弹最初开始射出的角度
            var angleStep = 360/26
            var radius = 150
            var vd = 1 //这个值是来改变下一颗子弹的速度大小的，以达到裴波那契螺旋线的效果


            if(num>=0&&num<3){
                attackMode=0
            }
            else if(num===3){
                attackMode=1
            }
            else if(num===4){
                attackMode=2
            }

            if(attackMode===0){
                for(var i = 0; i<26; ++i){
                    var angle = startAngle + i*angleStep
                    var radians = angle*Math.PI/180
                    var velocityX = Math.cos(radians)*radius
                    var velocityY = Math.sin(radians)*radius
                    var velocity = Qt.point(velocityX, velocityY)
                    Ctrler.shootBullet(bulletUrl, shootPosition, Qt.point(velocityX*vd, velocityY*vd), 30)
                    vd+=0.2 //改变下一颗子弹的速度
                }
                num++
            }

            if(attackMode===1){
                var numBullets = 7 // 扇形子弹的数量
                var angle2
                var radiussArr = [300,240,180]
                angleStep = (endAngleMode1 - startAngleMode1) / numBullets; // 每个子弹之间的角度差
                for(var j =0;j<radiussArr.length; ++j){
                    var radius2 = radiussArr[j] //给每一扇形子弹不同的速度，达到多圈扇形子弹的效果
                    for (i = 0; i < numBullets; ++i) {
                        radians = 300
                        angle2 = startAngleMode1 + i * angleStep
                        radians = angle2 * Math.PI / 180
                        velocityX = Math.cos(radians) * radius2 // 子弹的初始速度为radius2
                        velocityY = Math.sin(radians) * radius2
                        Ctrler.shootBullet(bulletUrl, shootPosition, Qt.point(velocityX, velocityY), 30)
                    }
                }
                num++
            }

            if(attackMode===2){
                for(i = 0; i<26; ++i){
                    radius=300
                    angle = i*angleStep
                    radians = angle*Math.PI/180
                    velocityX = Math.cos(radians)*radius
                    velocityY = Math.sin(radians)*radius
                    velocity = Qt.point(velocityX, velocityY)
                    Ctrler.shootBullet(bulletUrl, shootPosition, Qt.point(velocityX, velocityY), 30)
                }
                num=0
            }
        }
    }

    Timer{
        id:zombieCreate
        interval: 3000
        running: false
        repeat: true
        onTriggered: {
            entityManager.createEntityFromUrlWithProperties(Qt.resolvedUrl( "../entities/EnemyZombie.qml"), {
                 "x":2200,
                 "y":350,
                 "width":55,
                 "height":25,
                 "bossCreateZombie":true
             });
        }
    }



}
