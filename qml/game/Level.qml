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
    Ground { x:300; y:270; size: 3}
    Ground { x:400; y:180; size: 3}
    Ground { x:600; y:220; size: 3}
    Ground { x:800; y:270; size: 3}
    Ground { x:900; y:210; size: 3}
    Ground { x:1100; y:240; size: 3}
    Ground { x:1220; y:180; size: 5}
    Ground { x:1400; y:260; size: 3}
    /*悬空道路*/


    //顶部墙壁阻止越界
    Ground { x:0; y:-20; size: 50}
    //左侧墙壁阻止越界
    Ground { x:-32; y:0; size: 1}
    Ground { x:-32 ; y:20; size: 1}
    Ground { x:-32 ; y:40; size: 1}
    Ground { x:-32 ; y:60; size: 1}
    Ground { x:-32 ; y:80; size: 1}
    Ground { x:-32 ; y:100; size: 1}
    Ground { x:-32 ; y:120; size: 1}
    Ground { x:-32 ; y:140; size: 1}
    Ground { x:-32 ; y:160; size: 1}
    Ground { x:-32 ; y:180; size: 1}
    Ground { x:-32 ; y:200; size: 1}
    Ground { x:-32 ; y:220; size: 1}
    Ground { x:-32 ; y:240; size: 1}
    Ground { x:-32 ; y:260; size: 1}
    Ground { x:-32 ; y:280; size: 1}
    Ground { x:-32 ; y:300; size: 1}
    Ground { x:-32 ; y:320; size: 1}
    Ground { x:-32 ; y:340; size: 1}
    Ground { x:-32 ; y:360; size: 1}
    //左侧墙壁阻止越界

    Zombie{
       x:300
       y:240
       width: 55
       height: 25
    }
}
