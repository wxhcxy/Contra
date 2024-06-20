import QtQuick 2.0
import Felgo 4.0

EntityBase{
    id:_bullet
    entityId: "bullet"
    entityType: "bullet"

    x:shootPosition.x
    y:shootPosition.y


    property point shootPosition    //子弹的发射位置
    property point velocity  //子弹的速度矢量
    property int bulletType: 0  //子弹样式，就是不同的子弹图片，得到一些奖励机制后，可能会升级子弹


    Rectangle{
        id:bulletImg
        width: 12
        height: 12
        radius: 6
    }

    /*
    Image {
        id:bulletImg
        width: 14
        height: 14
        rotation: 90
        //anchors.centerIn: parent
        source: {
                    if(bulletType===0)
                    {
                        return "../../assets/img/bullet0.png"
                    }
                    if(bulletType===1)
                    {
                        return "../../assets/img/bullet1.png"
                    }
        }

    }
    */
    onEntityDestroyed: {
        console.log("子弹被销毁")
    }

    BoxCollider{
        id:boxCollider
        width: bullet.width
        height: bullet.height
        //anchors.fill: parent
        collisionTestingOnlyMode: true

        fixture.onBeginContact: (other, contactNormal)=>{   //子弹发生碰撞后触发的效果
                                    //console.log("Bullet BeginContact")
                                    var collidedEntity = other.getBody().target;//获取碰撞的实体other
                                    var otherEntityId = collidedEntity.entityId;//获取碰撞实体的entityId
                                    var otherEntityParent = collidedEntity.parent;//获取碰撞实体的父对象
                                    //console.log(otherEntityId)

                                    /*if(otherEntityId!=="ground"){   //如果子弹碰撞的对象不是地面场景，就销毁子弹
                                        //_bullet.destroy()            //因为子弹只有在撞击到玩家，敌人这些才有伤害效果
                                    }*/
                                    if(otherEntityId==="player"){  //如果子弹击中坦克
                                        console.log("子弹击中坦克")
                                        _bullet.destroy()
                                    }
                                }
    }


    MovementAnimation{      //子弹沿x轴移动的动画，设置目标为bullet,速度的x矢量方向
        target: _bullet
        property: "x"
        velocity: _bullet.velocity.x
        //minVelocity: 50
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

    /*Timer{
        running: true
        interval: 20
        onTriggered: {
            console.log(mo.velocity)
        }
    }*/
}


