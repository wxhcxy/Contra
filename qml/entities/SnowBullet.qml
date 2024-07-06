import QtQuick 2.0
import Felgo 4.0
import "../Controller.js" as Ctrler

Bullet{
    id:_snowBullet

    entityType: "snowBullet"
    rotation: 0
    imageSource: Qt.resolvedUrl("../../assets/img/bullet/snowbullet.png")
    imageWeight: 24
    imageHeight: 24

    boxCollider.fixture.onBeginContact: (other, contactNormal)=>{   //子弹发生碰撞后触发的效果
                                            Ctrler.entityBeginCrash(other,contactNormal)
                                        }

    Connections{
        target: gameScene
        function onGameOver(){
            _snowBullet.destroy()
        }
    }
}
