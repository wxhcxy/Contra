import QtQuick
import Felgo
import "../Controller.js" as Ctrler

Enemy {
    id: birdEnemy
    entityType: "bird"
    entityId: "bird"
    width: 30
    height: 60

Item {
    id:_birdItem
    width: bird.width ; height: bird.width
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.verticalCenter: parent.verticalCenter

    /*TapHandler {
        onTapped: {
         birdEnemy.destroy()
        }
    }*/
        SequentialAnimation {
            id: _birdBegin
            ScriptAction { script: bird.goalSprite = "6"; }
            loops: Animation.Infinite    // 设置动画为无限循环
        }

        SpriteSequence {
            id: bird; width: 96; height: 96; goalSprite: ""
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            Sprite{
                name: "1"; source: "../../assets/img/Bird/00.png"
                frameDuration: 200
                to: {"2":1}
            }

            Sprite{
                name: "2"; source: "../../assets/img/Bird/01.png"
                frameDuration: 200
                to: {"3":1}
            }
            Sprite{
                name: "3"; source: "../../assets/img/Bird/02.png"
                frameDuration: 200
                to: {"4":1}
            }
            Sprite{
                name: "4"; source: "../../assets/img/Bird/03.png"
                frameDuration: 200
                to: {"5":1}
            }
            Sprite{
                name: "5"; source: "../../assets/img/Bird/04.png"
                frameDuration: 200
                to: {"6":1}
            }

            Sprite{
                name: "6"; source: "../../assets/img/Bird/05.png"
                frameDuration: 200
                to: {"1":1}
            }
        }

        // 添加gif图片发现有背景图
        /* AnimatedImage {
            width: 32
            height: 32
            id:_birdEnemy
            source: Qt.resolvedUrl("../../assets/img/bird_die.gif")
            paused: false
        } */

    }


    BoxCollider {
        id:_birdCollider
        bodyType: Body.Static
        implicitHeight: parent.width
        implicitWidth: parent.height

        fixture.onBeginContact: (other, contactNormal)=>{
                                    var collidedEntity = other.getBody().target;
                                    var otherEntityId = collidedEntity.entityId;
                                    var otherEntityParent = collidedEntity.parent;

                                    if(otherEntityId==="player"){       //检测bird与player碰撞
                                        console.log("bird attack player")
                                        Ctrler.moveBack(20)      // 暂时还没完善被攻击后退的功能
                                }
                                    if(otherEntityId==="playerBullet"){    //检测bird与bullet碰撞
                                        console.log("bird dead!")
                                        birdEnemy.destroy()
                                        bodyType = Body.Dynamic   //将类型设置为动态(可以穿过)
                                    }

    }

        fixture.onEndContact: (other, contactNormal)=>{
                                  var collidedEntity = other.getBody().target;
                                  var otherEntityId = collidedEntity.entityId;
                                  var otherEntityParent = collidedEntity.parent;

                                  if(otherEntityId==="player"){//检测bird与player碰撞

                              }


   }
    }
}

