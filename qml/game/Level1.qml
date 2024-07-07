import Felgo 4.0
import QtQuick 2.0
import "../entities"
import "../common"

Item {
    id: level

    width: 10 * gameScene.gridSize

    BackgroundMusic{
        id:bgm1
        source: Qt.resolvedUrl("../../assets/audio/bgm1.mp3")
        autoPlay: false
        volume: 0.3
    }

    //底部地面
    Ground { x:0; y:370; size: 200;path:"stone";entityType: "ground2"}

    //跳跃距离应该为100
    /*悬空道路*/
    Ground { x:0; y:270; size: 5;path:"stone";entityType: "ground2"}
    Ground { x:180; y:160; size: 4;path:"stone";entityType: "ground2"}
    Ground { x:350; y:240; size: 3;path:"stone";entityType: "ground2"}
    Ground { x:480; y:180; size: 3;path:"stone";entityType: "ground2"}
    Ground { x:630; y:220; size: 3;path:"stone";entityType: "ground2"}
    Ground { x:830; y:260; size: 3;path:"stone";entityType: "ground2"}
    Ground { x:960; y:210; size: 3;path:"stone";entityType: "ground2"}
    Ground { x:1130; y:240; size: 3;path:"stone";entityType: "ground2"}
    Ground { x:1280; y:180; size: 5;path:"stone";entityType: "ground2"}
    Ground { x:1480; y:270; size: 3;path:"stone";entityType: "ground2"}
    Ground { x:1700; y:270; size: 3;path:"stone";entityType: "ground2"}
    Ground { x:1850; y:170; size: 5;path:"stone";entityType: "ground2"}
    Ground { x:2010; y:90; size: 6;path:"stone";entityType: "ground2"}
    Ground { x:2010; y:0; size: 4;path:"stone"; rotation: 90}
    /*悬空道路*/

    Ground {id:rightWall; x:Math.abs(container.x-646) ; y:0; size: 20;path:"stone"; rotation: 90; opacity: 1}
    Ground {id:leftWall; x:Math.abs(container.x-2) ; y:0; size: 19;path:"stone"; rotation: 90; opacity: 0}
    Ground {x:2220 ; y:0; size: 18;path:"stone"; rotation: 90; opacity: 0}

    //顶部墙壁阻止越界
    Ground { x:0; y:-20; size: 100;path:"stone"}
    //左侧墙壁阻止越界
    Ground { x:0; y:0; size: 19; rotation: 90;path:"stone"}




    EnemyIronPlate{x:370; y:250; width: 60; height: 150}
    EnemyIronPlate{x:650; y:0; width: 60; height: 250}
    EnemyIronPlate{x:850; y:0; width: 60; height: 280}
    EnemyIronPlate{x:1220; y:0; width: 60; height: 280}
    EnemyIronPlate{x:1600; y:20; width: 60; height: 400}
    EnemyIronPlate{x:1800; y:120; width: 60; height: 260}

    Laser{x:410; y:0; z:2}
    Laser{x:300; y:390; z:2; elongateHeight:100; rotation:180}
    Laser{x:880; y:390; z:2; elongateHeight:70; rotation:180}
    Laser{x:1900; y:0; z:2; elongateHeight:180}



    EnemyZombie{x:360; y:220; width: 55; height: 25}
    EnemyZombie{x:660; y:340; width: 55; height: 25}
    EnemyZombie{x:1160; y:220; width: 55; height: 25}

    EnemySnow{x:880; y:330}
    EnemySnow{x:1580; y:330}
    EnemySnow{x:1880; y:130}

    EnemyTank{x:500; y:160}
    EnemyTank{x:500; y:330}
    EnemyTank{x:850; y:260}
    EnemyTank{x:1060; y:330}
    EnemyTank{x:1260; y:-8}
    EnemyTank{x:1350; y:150}
    EnemyTank{x:1400; y:330}
    EnemyTank{x:2030; y:50}
    EnemyTank{x:2130; y:50}

    EnemyBird {x: 340; y: 100}
    EnemyBird {x: 1500; y: 200}
    EnemyBird {x: 1100; y: 70}

    EnemyBoss1{x:2120; y:140}


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
        bgm1.play()
        player.attackMode = 0
        camera.limitRight = 2200
        camera.limitBottom = 400
        player.x = 100
        player.y = 250
        player.money = 400
    }

}
