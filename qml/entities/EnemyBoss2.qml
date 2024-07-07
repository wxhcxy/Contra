import QtQuick
import Felgo
import "../Controller.js" as Ctrler
EntityBase {
    id:_boss2
    entityId: "boss"
    entityType: "enemyBoss2"
    property alias boss2Sprite: _boss2Sprite
    property int attackPower: 200
    property int blood: 3000
    implicitWidth: _boss2Sprite.width
    implicitHeight: _boss2Sprite.height






    GameSpriteSequence {
        id:_boss2Sprite
        anchors.centerIn: parent
        defaultSource: Qt.resolvedUrl("../../assets/img/boss/boss2.png")
        GameSprite{
            name:"Attack"
            frameWidth: 64
            frameHeight: 62
            frameCount: 4
            frameDuration: 125
        }
        GameSprite{
            name:"SquatAndFire"
            frameWidth: 52
            frameHeight: 49
            frameCount: 2
            frameX: 104
            frameY: 62
            frameDuration: 25
        }
        GameSprite{
            name:"Run"
            frameWidth: 42
            frameHeight: 62
            frameCount: 8
            frameY: 186
            frameDuration: 200
        }
        GameSprite{
            name:"Fire"
            frameWidth: 63
            frameHeight: 61
            frameCount: 4
            frameY: 248
            frameDuration: 25
        }


    }

    state:"Fire"

    states: [
        State {
            name: "Attack"
            PropertyChanges {
                target: _boss2Sprite
            }
        },
        State{
            name: "Fire"
            PropertyChanges {
                target: _boss2Sprite
            }
        },
        State{
            name: "Run"
            PropertyChanges {
                target: _boss2Sprite
            }
        },
        State{
            name: "SquatAndFire"
            PropertyChanges {
                target: _boss2Sprite
            }
        }

    ]

    BoxCollider {
        id:_collider
        anchors.fill: _boss2Sprite
        bodyType: Body.Dynamic
        fixture.onBeginContact: (other,contactNormal)=>{
                                    Ctrler.entityBeginCrash(other,contactNormal)
                            }
        fixture.onEndContact: (other,contactNormal)=>{
                                    Ctrler.bossEndCrash(other,contactNormal)

                            }
    }

    NumberAnimation {
        target: _boss2
        property: "x"
        duration: 4000
        easing.type: Easing.Linear
    }


    Timer{
        id:_boss2Actions
        interval: 1000
        running: true
        repeat: true
        onTriggered: {
            Ctrler.boss2Actions()
        }
    }

    onEntityDestroyed: {
            gameOver()
        }

}
