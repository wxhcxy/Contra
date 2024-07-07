import Felgo 4.0
import QtQuick 2.0
import "../entities"
import "../common"

Item {
    id: level
    //地图大小2048*1024
    //上边界
    Ground{x:0;y:0;size:64;path:"ground2"}



    //左边界
    Ground{x:0;y:0;size:32;path:"ground2";rotation: 90}



    Ground{x:0;y:1024;size:1;path:"stone"}
    Ground{x:0;y:0;size:1;path:"stone"}
    Ground{x:2048;y:1024;size:1;path:"stone"}
    Ground{x:2048;y:0;size:1;path:"stone"}
    //玩家起点

    //上层
    //左
    Ground{x:64;y:192;size:3;path:"stone";entityType: "ground2"}
    Reward{x:92; y:160; width: 30; height: 30; treasureMode: 2;
    source:Qt.resolvedUrl("../../assets/img/reward/multibullet.png")}

    EnemyBird{x:240;y:100}
    EnemyBird{x:300;y:130}
    EnemyBird{x:400;y:100}
    EnemyBird{x:500;y:130}
    EnemyBird{x:450;y:100}

    Ground{x:224;y:160;size:1;path:"stone";entityType: "ground2"}
    Ground{x:320;y:192;size:1;path:"stone";entityType: "ground2"}
    Ground{x:416;y:160;size:1;path:"stone";entityType: "ground2"}
    Ground{x:512;y:192;size:1;path:"stone";entityType: "ground2"}

    //中
    Ground{x:640;y:192;size:1;path:"corner12";entityType: "ground2"}
    Ground{x:672;y:192;size:10;path:"ground11";entityType: "ground2"}
    Ground{x:672;y:224;size:10;path:"solid"}
    Ground{x:672;y:256;size:10;path:"solid"}
    Ground{x:672;y:288;size:10;path:"solid"}
    Ground{x:640;y:320;size:1;path:"corner13"}
    Ground{x:672;y:320;size:10;path:"ground13"}
    EnemyTank{x:702; y:320}
    EnemyTank{x:802; y:320}
    EnemyTank{x:902; y:320}
    Ground{x:992;y:320;size:1;path:"corner14"}
    Ground{x:992;y:192;size:1;path:"corner11";entityType: "ground2"}
    Ground{x:1024;y:224;size:3;path:"ground11";rotation: 90}
    Ground{x:672;y:224;size:3;path:"ground13";rotation:90}
    EnemyZombie{x:672;y:160;width: 55;height: 55;mirrorX: true}
    EnemyZombie{x:750;y:160;width: 55;height: 55;mirrorX: true}
    EnemyZombie{x:800;y:160;width: 55;height: 55;mirrorX: true}
    EnemyZombie{x:870;y:160;width: 55;height: 55;mirrorX: true}
    Ground{x:1024;y:256;size:2;path:"ground2";entityType: "ground2"}
    Ground{x:1212;y:224;size:1;path:"corner12";entityType: "ground2"}

    //EnemyZombie{x:1244;y:200;width: 55;height: 55}
    //EnemyZombie{x:1300;y:200;width: 55;height: 55}
    Ground{x:1244;y:224;size:3;path:"ground11";entityType: "ground2"}
    Ground{x:1340;y:224;size:1;path:"corner11";entityType: "ground2"}
    Ground{x:1244;y:256;size:3;path:"solid"}
    Ground{x:1148;y:256;size:3;path:"ground2";entityType: "ground2"}
    Ground{x:1212;y:288;size:1;path:"corner13"}
    Ground{x:1244;y:288;size:3;path:"ground13"}
    Ground{x:1340;y:288;size:1;path:"corner14"}
    Ground{x:1340;y:256;size:1;path:"stone"}
    Portal{x:1310;y:170;portX: 1200;portY: 750}
    //中间层
    //左
    Npc{x:50;y:768-npc.height}
    Ground{x:0;y:512;size:15;path:"ground11";entityType: "ground2"}
    EnemyIronPlate{x:400;y:768;width: 20;height: 100;rotation: 180}
    Ground{x:480;y:512;size:1;path:"corner11"}
    Ground{x:512;y:544;size:3;path:"ground11";rotation: 90}
    Ground{x:512;y:640;size:1;path:"corner11";rotation: 90}
    Ground{x:480;y:672;size:2;path:"ground11";rotation: 180}
    Ground{x:416;y:672;size:1;path:"corner11";rotation: 180}
    Ground{x:384;y:640;size:1;path:"ground11";rotation: -90}
    Ground{x:416;y:608;size:1;path:"corner21";rotation: -180}
    Ground{x:0;y:544;size:15;path:"solid"}
    Ground{x:416;y:576;size:2;path:"solid"}
    Ground{x:416;y:608;size:2;path:"solid"}
    Ground{x:384;y:608;size:13;path:"ground11";rotation: 180}
    //中
    Ground{x:640;y:544;size:1;path:"corner11";rotation: -90}
    Ground{x:672;y:512;size:8;path:"ground11";entityType: "ground2"}
    Ground{x:928;y:512;size:1;path:"corner11"}
    Ground{x:640;y:544;size:9;path:"solid"}
    Ground{x:928;y:512;size:1;path:"corner11"}
    Ground{x:960;y:544;size:1;path:"ground11";rotation: 90}
    Ground{x:960;y:576;size:1;path:"corner11";rotation: 90}
    Ground{x:928;y:608;size:7;path:"ground11";rotation: 180}
    Ground{x:672;y:576;size:1;path:"corner24"}
    Ground{x:672;y:608;size:1;path:"ground12"}
    Ground{x:672;y:640;size:1;path:"ground12"}
    Ground{x:672;y:672;size:1;path:"ground12"}
    Ground{x:640;y:736;size:6;path:"ground11";rotation: -90}
    Ground{x:640;y:736;size:6;path:"ground11";rotation: -90}
    Ground{x:640;y:704;size:1;path:"corner13"}
    Ground{x:672;y:704;size:1;path:"corner14"}
    Ground{x:704;y:704;size:15;path:"ground1";entityType: "ground2"}
    Ground{x:1152;y:704;size:10;path:"ground1";rotation: -37;entityType: "ground2"}
    Ground{x:1410;y:510;size:2;path:"ground1";entityType: "ground2"}




    //底层
    //左
    Ground{x:0;y:768;size:15;path:"ground11";entityType: "ground2"}
    Ground{x:0;y:800;size:15;path:"solid"}
    Ground{x:0;y:832;size:15;path:"solid"}
    Ground{x:0;y:864;size:15;path:"solid"}
    Ground{x:0;y:896;size:15;path:"solid"}
    Ground{x:0;y:928;size:15;path:"solid"}
    Ground{x:0;y:960;size:64;path:"solid"}
    Ground{x:0;y:992;size:64;path:"solid"}
    Ground{x:480;y:768;size:1;path:"corner11"}
    Ground{x:512;y:800;size:4;path:"ground11";rotation: 90}
    Ground{x:480;y:928;size:1;path:"corner21"}
    Ground{x:512;y:928;size:3;path:"ground11";entityType: "ground2"}
    Ground{x:602;y:928;size:5;path:"ground11";rotation: -45;entityType: "ground2"}
    //中
    Ground{x:602;y:928;size:46;path:"stone";entityType: "ground2"}
    Laser{x:750; y:724; z:2; elongateHeight:90}
    Laser{x:834; y:834; z:2; elongateHeight:90;rotation: 180}
    Laser{x:898; y:724; z:2; elongateHeight:90}
    Laser{x:1000; y:834; z:2; elongateHeight:90;rotation: 180}
    Laser{x:1080; y:724; z:2; elongateHeight:90}
    EnemyIronPlate{x:1150;y:730;width: 32;height: 85}

    Reward{x:1200; y:790; width: 30; height: 30; treasureMode: 1}

    Reward{x:1250; y:790; width: 30; height: 30; treasureMode: 1}

    Portal{x:1350;y:770;portX: 1250;portY: 180}
    EnemyBoss2{x:1700;y:800}
    Ground{x:718;y:814;size:23;path:"ground11";entityType: "ground2"}

    Ground{x:1474;y:510;size:15;path:"stone";rotation: 90}

    //右边界
    Ground{x:2080;y:0;size:32;path:"ground2";rotation: 90}

    //下边界
    Ground{x:0;y:1024;size:64;path:"ground2"}


    BackgroundMusic{
        id:bgm2
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
        bgm2.play()
        player.money = 400
        camera.limitLeft = 0
        camera.limitTop = 0
        camera.limitBottom = 1024
    }
}
