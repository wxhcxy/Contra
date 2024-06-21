import QtQuick
import Felgo

Enemy{
    entityType: "zombie"
    entityId: "zombie"
    id:_zombie

        source:Qt.resolvedUrl("../../assets/img/enemyWalk.png")


    TwoAxisController{
        id:controller
    }

    BoxCollider{
        id:collider
        bodyType: Body.Static
        implicitHeight: parent.width
        implicitWidth: parent.height

        fixture.onBeginContact: (other, contactNormal)=>{
                                    var collidedEntity = other.getBody().target;
                                    var otherEntityId = collidedEntity.entityId;
                                    var otherEntityParent = collidedEntity.parent;

                                    if(otherEntityId==="player"){//检测zombie与player碰撞
                                        console.log("Zombie attack player")
                                        source = Qt.resolvedUrl("../../assets/img/enemyAttack.png")
                                }
                                    if(otherEntityId==="playerBullet"){//检测zombie与bullet碰撞
                                        console.log("Zombie dead!")
                                        _zombie.destroy()
                                        bodyType = Body.Dynamic//将类型设置为动态(可以穿过)
                                    }

    }
     fixture.onEndContact: (other, contactNormal)=>{
                               var collidedEntity = other.getBody().target;
                               var otherEntityId = collidedEntity.entityId;
                               var otherEntityParent = collidedEntity.parent;

                               if(otherEntityId==="player"){//检测zombie与player碰撞

                                   source = Qt.resolvedUrl("../../assets/img/enemyWalk.png")
                           }


}



}
}
