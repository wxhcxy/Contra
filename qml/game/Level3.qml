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

    // 跳跃距离应该为100
    /*悬空道路*/
    Ground { x:0; y:200; height:10; width: 139; path: "Level3_right1"}
    Ground { x:0; y:400; height:10; width: 230; path: "Level3_right3"}
    Ground { x:200; y:600; height:10; width: 350; path: "Level3_mid1"}

    // 楼梯
    Ground { x:152; y:600; height:24; width: 48; path: "ground3"}
    Ground { x:104; y:624; height:24; width: 48; path: "ground3"}
    Ground { x:56; y:648; height:24; width: 48; path: "ground3"}
    //Ground { x:8; y:672; height:24; width: 48; path: "ground3"}
    Ground { x:0; y:760; height:24; width: 48; path: "ground3"}
    Ground { x:48; y:782; height:24; width: 48; path: "ground3"}
    Ground { x:96; y:804; height:24; width: 48; path: "ground3"}
    //Ground { x:200; y:826; height:24; width: 48; path: "ground3"}


    Ground { x:50; y:900; height:10; width: 500; path: "Level3_mid2"}
    Ground { x:0; y: 1050; height:10; width: 414; path: "Level3_right2"}

    Ground { x:700; y:800; height:10; width: 470; path:"Level3_left1"}

    Ground { x:500; y:1150; height:10; width: 262; path: "Level3_mid3"}
    Ground{ x:700; y:1300; height:10; width: 500; path:"Level3_left2"}
    Ground { x:480; y:1550; height:10; width: 470; path:"Level3_mid2"}


    Component.onCompleted: {
        camera.limitBottom = 12000
        camera.limitRight = 1100
    }

}
