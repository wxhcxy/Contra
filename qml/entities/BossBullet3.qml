import QtQuick 2.0
import Felgo 4.0
import "../Controller.js" as Ctrler

Bullet{
    id:_bossBullet3

    entityType: "bossBullet3"
    rotation: 0
    imageSource: Qt.resolvedUrl("../../assets/img/bullet/boss3bullet.png")
    imageWeight: 24
    imageHeight: 24

    boxCollider.fixture.onBeginContact: (other, contactNormal)=>{   //子弹发生碰撞后触发的效果
                                            Ctrler.entityBeginCrash(other,contactNormal)
                                        }

    Connections{
        target: gameScene
        function onGameOver(){
            _bossBullet3.destroy()
        }
    }
}
