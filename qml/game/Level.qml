import Felgo 4.0
import QtQuick 2.0
import "../entities"
import "../common"

Item {
    id: level

    width: 10 * gameScene.gridSize

    //底部地面
    Ground { x:0; y:370; size: 200}

    /*悬空道路*/
    Ground { x:0; y:280; size: 5}
    Ground { x:180; y:180; size: 4}
    Ground { x:350; y:250; size: 3}
    Ground { x:480; y:180; size: 3}
    Ground { x:630; y:220; size: 3}
    Ground { x:830; y:270; size: 3}
    Ground { x:930; y:210; size: 3}
    Ground { x:1130; y:240; size: 3}
    Ground { x:1250; y:180; size: 5}
    Ground { x:1430; y:260; size: 3}
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

    Zombie{
       x:360
       y:230
       width: 55
       height: 25
    }

    EnemyTank{
        id:tank
        x:500
        y:160
        width: 40
        height: 38
    }

    EnemyTank{
        id:tank2
        x:400
        y:100
        width: 40
        height: 38
    }


}
