import QtQuick 2.0
import Felgo 4.0
import "../Controller.js" as Ctrler

Bullet{
    id:_playerBullet

    entityType: "playerBullet"
    //width: 70
    //height: 70
    rotation: 0

    boxCollider.fixture.onBeginContact: (other, contactNormal)=>{   //子弹发生碰撞后触发的效果
                                            Ctrler.entityBeginCrash(other,contactNormal)
                                         }

    GameSoundEffect{

    }

    /*
    BackgroundMusic{
        id:playerShootMusic
        source: Qt.resolvedUrl("../../assets/audio/playerShoot.wav")
        loops: 1
        autoPlay: false
        volume: 0.2
    }

    onEntityCreated: {
        playerShootMusic.play()
    }
    */
}
