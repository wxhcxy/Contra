import Felgo 4.0
import QtQuick 2.0
import "../entities"
import "../common"

Item {
    id: level

    //底部地面
    Ground { x:0; y:370; size: 200}

    //跳跃距离应该为100
    /*悬空道路*/

    Ground { x:1130; y:240; size: 3}
    Ground { x:1280; y:180; size: 5}
    Ground { x:1480; y:270; size: 3}
    /*悬空道路*/


    //顶部墙壁阻止越界
    Ground { x:0; y:-20; size: 50}
    //左侧墙壁阻止越界
    Ground { x:-34; y:0; size: 1}
    Ground { x:-34 ; y:20; size: 1}
    Ground { x:-34 ; y:40; size: 1}
    Ground { x:-34 ; y:60; size: 1}
    Ground { x:-34 ; y:80; size: 1}
    Ground { x:-34 ; y:100; size: 1}
    Ground { x:-34 ; y:120; size: 1}
    Ground { x:-34 ; y:140; size: 1}
    Ground { x:-34 ; y:160; size: 1}
    Ground { x:-34 ; y:180; size: 1}
    Ground { x:-34 ; y:200; size: 1}
    Ground { x:-34 ; y:220; size: 1}
    Ground { x:-34 ; y:240; size: 1}
    Ground { x:-34 ; y:260; size: 1}
    Ground { x:-34 ; y:280; size: 1}
    Ground { x:-34 ; y:300; size: 1}
    Ground { x:-34 ; y:320; size: 1}
    Ground { x:-34 ; y:340; size: 1}
    Ground { x:-34 ; y:360; size: 1}
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



}
