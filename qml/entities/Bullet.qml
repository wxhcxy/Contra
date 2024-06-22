import QtQuick 2.0
import Felgo 4.0
import "../Controller.js" as Ctrler
EntityBase{
    id:_bullet
    entityId: "bullet"
    entityType: "bullet"

    property alias boxCollider: _boxCollider

    x:shootPosition.x
    y:shootPosition.y


    property point shootPosition    //子弹的发射位置
    property point velocity  //子弹的速度矢量
    property int bulletType: 0  //子弹样式，就是不同的子弹图片，得到一些奖励机制后，可能会升级子弹
    property int attackPower   //子弹攻击力

    Image {
        id:bulletImg
        width: 70
        height: 70
        //rotation: 90
        //anchors.fill: parent
        anchors.centerIn: parent
        source: {
            return "../../assets/img/tankBullet1.png"
            /*
                    if(bulletType===0)
                    {
                        return "../../assets/img/bullet0.png"
                    }
                    if(bulletType===1)
                    {
                        return "../../assets/img/bullet1.png"
                    }
                    */
        }

    }

    onEntityDestroyed: {
        //console.log("子弹被销毁")
    }

    BoxCollider{
        id:_boxCollider
        width: bullet.width
        height: bullet.height
        collisionTestingOnlyMode: true
        fixture.onBeginContact:(other,contactNormal)=>{
                        Ctrler.entityBeginCrash(other,contactNormal)

                }
    }


    MovementAnimation{      //子弹沿x轴移动的动画，设置目标为bullet,速度的x矢量方向
        target: _bullet
        property: "x"
        velocity: _bullet.velocity.x
        running: true
    }

    MovementAnimation{      //子弹沿y轴移动的动画，设置目标为bullet,速度的y矢量方向
        target: _bullet
        property: "y"
        velocity: _bullet.velocity.y
        running: true
        onStopped: {        //当这个y方向动画停止时，销毁子弹
            _bullet.destroy()
            console.log("onStopped")
        }
    }

    Timer{  //子弹发射3秒后，就销毁子弹实体
        running: true
        interval: 3000
        onTriggered: {
            _bullet.destroy()
        }
    }
}


