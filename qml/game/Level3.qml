import Felgo
import QtQuick
import "../entities"
import "../common"

Item {
    id: level3

    //底部地面
   // Ground { x:0; y:370; size: 200}

    //顶部墙壁阻止越界
    Ground { x:0; y:-25; size: 50;path:"ground3"}
    //左侧墙壁阻止越界
    Ground { x:0; y:0; size: 1000;path:"ground3";rotation: 90}

    //右侧墙壁阻止越界
    Ground { x:1125; y:0; size: 1000;path:"ground3";rotation: 90}

    /*悬空道路*/
    Ground { x:0; y:200; height:10; width: 139; path: "Level3_right1";entityType: "ground2"}
    Ground { x:0; y:400; height:10; width: 230; path: "Level3_right3";entityType: "ground2"}
    Ground { x:200; y:600; height:10; width: 350; path: "Level3_mid1";entityType: "ground2"}

    // 楼梯
    Ground { x:152; y:600; height:24; width: 48; path: "ground3";entityType: "ground2"}
    Ground { x:104; y:624; height:24; width: 48; path: "ground3";entityType: "ground2"}
    Ground { x:56; y:648; height:24; width: 48; path: "ground3";entityType: "ground2"}
    //Ground { x:8; y:672; height:24; width: 48; path: "ground3";entityType: "ground2"}
    Ground { x:0; y:760; height:24; width: 48; path: "ground3";entityType: "ground2"}
    Ground { x:48; y:782; height:24; width: 48; path: "ground3";entityType: "ground2"}
    Ground { x:96; y:804; height:24; width: 48; path: "ground3";entityType: "ground2"}
    //Ground { x:200; y:826; height:24; width: 48; path: "ground3";entityType: "ground2"}


    Ground { x:50; y:900; height:10; width: 500; path: "Level3_mid2";entityType: "ground2"}
    Ground { x:0; y: 1050; height:10; width: 414; path: "Level3_right2";entityType: "ground2"}

    Ground { x:700; y:800; height:10; width: 470; path:"Level3_left1";entityType: "ground2"}

    Ground { x:500; y:1150; height:10; width: 262; path: "Level3_mid3";entityType: "ground2"}
    Ground{ x:700; y:1300; height:10; width: 500; path:"Level3_left2";entityType: "ground2"}
    Ground { x:480; y:1550; height:10; width: 470; path:"Level3_mid2";entityType: "ground2"}

    // 敌人
    EnemyZombie{x: 120; y: 600; width: 55; height: 25}
    EnemyZombie{x: 350; y: 870; width: 55; height: 25}
    EnemyZombie{x: 400; y: 870; width: 55; height: 25}
    EnemyZombie{x: 900; y: 770; width: 55; height: 25}
    EnemyZombie{x: 950; y: 770; width: 55; height: 25}
    EnemyZombie{x: 1000; y: 770; width: 55; height: 25}
    EnemyZombie{x: 1050; y: 770; width: 55; height: 25}
    EnemyZombie{x: 730; y: 1520; width: 55; height: 25}
    EnemyZombie{x: 770; y: 1520; width: 55; height: 25}
    EnemyZombie{x: 810; y: 1520; width: 55; height: 25}
    EnemyZombie{x: 850; y: 1520; width: 55; height: 25}
    EnemyZombie{x: 890; y: 1520; width: 55; height: 25}
    EnemyZombie{x: 930; y: 1520; width: 55; height: 25}
    EnemyTank{x: 300; y: 570}
    EnemyTank{x: 96; y: 774}
    EnemyTank{x: 250; y: 870}
    EnemyTank{x: 300; y: 1020}
    EnemyTank{x: 580; y: 1120}
    EnemyBoss1{x:1005; y:1030}

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

    BackgroundMusic{
        id:bgm3
        source: Qt.resolvedUrl("../../assets/audio/bgm1.mp3")
        autoPlay: false
        volume: 0.3
    }

    BackgroundMusic{
        id:tankExplosion
        source: Qt.resolvedUrl("../../assets/audio/tankExp.wav")
        loops: 1
        autoPlay: false
        volume: 0.4
    }

    Reward{x:5; y:375; width: 30; height: 30; treasureMode: 1}
    Reward{x:150; y:375; width: 30; height: 30; treasureMode: 2;
    source:Qt.resolvedUrl("../../assets/img/reward/multibullet.png")}

    Component.onCompleted: {
        bgm3.play()
        player.money = 400
        camera.limitBottom = 12000
        camera.limitRight = 1100
    }

}
