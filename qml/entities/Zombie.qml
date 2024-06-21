import QtQuick
import Felgo
import "../Controller.js" as Ctrler
Enemy{
    entityType: "zombie"

    id:_zombie

        source:Qt.resolvedUrl("../../assets/img/enemyWalk.png")


    TwoAxisController{
        id:controller
    }

    boxCollider.fixture.onBeginContact: (other, contactNormal)=>{   //子弹发生碰撞后触发的效果
                                            Ctrler.entityBeginCrash(other,contactNormal)
                                         }
}

