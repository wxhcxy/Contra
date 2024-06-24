import Felgo
import QtQuick
import "../entities"
import "../common"

Item {
    id: level3

    //底部地面
   // Ground { x:0; y:370; size: 200}

    // 跳跃距离应该为100
    /*悬空道路*/
    Ground { x:0; y:280; size: 5;path:"ground2"}
    Ground { x:180; y:580; size: 4;path:"ground2"}
    Ground { x:250; y:640; size: 3;path:"ground2"}
    Ground { x:300; y:780; size: 3;path:"ground2"}
    Ground { x:420; y:820; size: 3;path:"ground2"}
    Ground { x:140; y:980; size: 3;path:"ground2"}
    Ground { x:240; y:310; size: 3;path:"ground2"}
    Ground { x:300; y:440; size: 3;path:"ground2"}
    Ground { x:420; y:380; size: 5;path:"ground2"}
    Ground { x:120; y:580; size: 5;path:"ground2"}
    Ground { x:220; y:680; size: 5;path:"ground2"}
    Ground { x:320; y:780; size: 5;path:"ground2"}
    Ground { x:420; y:880; size: 5;path:"ground2"}
    Ground { x:120; y:980; size: 5;path:"ground2"}
    Ground { x:180; y:1080; size: 4;path:"ground2"}
    Ground { x:250; y:1140; size: 3;path:"ground2"}
    Ground { x:300; y:1280; size: 3;path:"ground2"}
    Ground { x:420; y:1320; size: 3;path:"ground2"}
    Ground { x:140; y:1480; size: 3;path:"ground2"}
    Ground { x:240; y:1510; size: 3;path:"ground2"}
    Ground { x:300; y:1640; size: 3;path:"ground2"}
    Ground { x:420; y:1780; size: 5;path:"ground2"}
    Ground { x:120; y:1880; size: 5;path:"ground2"}
    Ground { x:220; y:1980; size: 5;path:"ground2"}
    Ground { x:320; y:2080; size: 5;path:"ground2"}
    Ground { x:420; y:2080; size: 5;path:"ground2"}
    Ground { x:120; y:2280; size: 5;path:"ground2"}
    /*悬空道路*/


    //顶部墙壁阻止越界
    Ground { x:0; y:-20; size: 50;path:"ground2"}
    //左侧墙壁阻止越界
    Ground { x:-34; y:0; size: 1;path:"ground2"}
    Ground { x:-34 ; y:20; size: 1;path:"ground2"}
    Ground { x:-34 ; y:40; size: 1;path:"ground2"}
    Ground { x:-34 ; y:60; size: 1;path:"ground2"}
    Ground { x:-34 ; y:80; size: 1;path:"ground2"}
    Ground { x:-34 ; y:100; size: 1;path:"ground2"}
    Ground { x:-34 ; y:120; size: 1;path:"ground2"}
    Ground { x:-34 ; y:140; size: 1;path:"ground2"}
    Ground { x:-34 ; y:160; size: 1;path:"ground2"}
    Ground { x:-34 ; y:180; size: 1;path:"ground2"}
    Ground { x:-34 ; y:200; size: 1;path:"ground2"}
    Ground { x:-34 ; y:220; size: 1;path:"ground2"}
    Ground { x:-34 ; y:240; size: 1;path:"ground2"}
    Ground { x:-34 ; y:260; size: 1;path:"ground2"}
    Ground { x:-34 ; y:280; size: 1;path:"ground2"}
    Ground { x:-34 ; y:300; size: 1;path:"ground2"}
    Ground { x:-34 ; y:320; size: 1;path:"ground2"}
    Ground { x:-34 ; y:340; size: 1;path:"ground2"}
    Ground { x:-34 ; y:360; size: 1;path:"ground2"}
    //左侧墙壁阻止越界

    EnemyZombie{
       x:360
       y:220
       width: 55
       height: 25
    }
    /*
    EnemyZombie{
       x:400
       y:350
       width: 55
       height: 25
    }

    EnemyZombie{
       x:880
       y:350
       width: 55
       height: 25
    }
    */

    EnemyTank{
        id:tank
        x:500
        y:160
    }

    EnemyTank{
        id:tank2
        x:840
        y:260
    }
    /*
    EnemyTank{
        id:tank3
        x:1100
        y:350
    }
    */
    EnemyTank{
        id:tank4
        x:1400
        y:-8
    }
    /*
    EnemyTank{
        id:tank5
        x:1600
        y:350
    }
    */

    EnemyBird {
        x: 340
        y: 100
        id: birdEnemy1
    }

    EnemyBird {
        x: 480
        y: 60
        id: birdEnemy2
    }
    EnemyBird {
        x: 1500
        y: 200
        id: birdEnemy3
    }

    Component.onCompleted: {
        camera.limitBottom = 12000
    }

}
