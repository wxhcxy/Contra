import Felgo 4.0
import QtQuick 2.0
import "../entities"
import "../common"

Item {
    id: level

    width: 10 * gameScene.gridSize


    //底部地面
    Ground { x:0; y:370; size: 200;path:"stone"}

    //跳跃距离应该为100
    /*悬空道路*/
    Ground { x:0; y:270; size: 5;path:"stone"}
    Ground { x:180; y:160; size: 4;path:"stone"}
    Ground { x:350; y:240; size: 3;path:"stone"}
    Ground { x:480; y:180; size: 3;path:"stone"}
    Ground { x:630; y:220; size: 3;path:"stone"}
    Ground { x:830; y:280; size: 3;path:"stone"}
    Ground { x:960; y:210; size: 3;path:"stone"}
    Ground { x:1130; y:240; size: 3;path:"stone"}
    Ground { x:1280; y:180; size: 5;path:"stone"}
    Ground { x:1480; y:270; size: 3;path:"stone"}
    /*悬空道路*/

    Ground {id:rightWall; x:Math.abs(container.x-596) ; y:0; size: 20;path:"stone"; rotation: 90; opacity: 0}
    Ground {id:leftWall; x:Math.abs(container.x-2) ; y:0; size: 19;path:"stone"; rotation: 90; opacity: 0}
    Ground {x:2220 ; y:0; size: 18;path:"stone"; rotation: 90; opacity: 0}

    //顶部墙壁阻止越界
    Ground { x:0; y:-20; size: 100;path:"stone"}
    //左侧墙壁阻止越界
    Ground { x:0; y:0; size: 19; rotation: 90;path:"stone"}


    EnemyZombie{x:360; y:220; width: 55; height: 25}
    EnemyZombie{x:660; y:350; width: 55; height: 25}
    EnemyZombie{x:850; y:350; width: 55; height: 25}
    EnemyZombie{x:1160; y:220; width: 55; height: 25}

    EnemyTank{x:500; y:160}
    EnemyTank{x:500; y:350}
    EnemyTank{x:850; y:260}
    EnemyTank{x:1060; y:350}
    EnemyTank{x:1260; y:-8}
    EnemyTank{x:1400; y:350}

    EnemyBird {x: 340; y: 100}
    EnemyBird {x: 1500; y: 200}
    EnemyBird {x: 1100; y: 70}


    EnemyBoss1{x:2100; y:250; width: 100; height: 100}

    Reward{x:280; y:350; width: 30; height: 30; treasureMode: 1}
    Reward{x:400; y:350; width: 30; height: 30; treasureMode: 2;
    source:Qt.resolvedUrl("../../assets/img/reward/multibullet.png")}


    BackgroundMusic{
        id:tankExplosion
        source: Qt.resolvedUrl("../../assets/audio/tankExp.wav")
        loops: 1
        autoPlay: false
        volume: 0.4
    }

    GameAnimatedSprite{
        id:squaby
        running: false
        visible: false
        width: 90
        height: 90
        loops: 1
        frameWidth: 66
        frameHeight: 66
        frameCount: 11
        frameRate: 24
        source: Qt.resolvedUrl("../../assets/img/tank/tankExp.png")
    }

    Component.onCompleted: {
        camera.limitRight = 2200
        camera.limitBottom = 400
        player.x = 100
        player.y = 240
    }

}
