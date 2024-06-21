import QtQuick 2.0
import Felgo 4.0


Bullet{
    id:_playerBullet

    entityId: "playerBullet"
    entityType: "playerBullet"
    width: 12
    height: 12
    rotation: 0

    boxCollider.fixture.onBeginContact: (other)=>{   //子弹发生碰撞后触发的效果
                                            console.log("PlayerBullet BeginContact")
                                            var collidedEntity = other.getBody().target;//获取碰撞的实体other
                                            var otherEntityId = collidedEntity.entityId;//获取碰撞实体的entityId
                                            var otherEntityParent = collidedEntity.parent;//获取碰撞实体的父对象
                                            console.log(otherEntityId)

                                            if(otherEntityId==="zombie"){  //如果子弹击中坦克
                                                console.log("子弹击中坦克")
                                                _playerBullet.destroy()
                                                }
                                        }


}
