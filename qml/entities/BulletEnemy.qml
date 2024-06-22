import QtQuick 2.0
import Felgo 4.0
import "../Controller.js" as Ctrler

Bullet{
    id:_enemyBullet

    entityType: "enemyBullet"
    width: 12
    height: 12
    rotation: 0

    boxCollider.fixture.onBeginContact: (other, contactNormal)=>{   //子弹发生碰撞后触发的效果
                                            Ctrler.entityBeginCrash(other,contactNormal)
                                        }
}
