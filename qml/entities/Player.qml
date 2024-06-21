import QtQuick
import Felgo 4.0

EntityBase {
    id:player
    entityId: "player"
    entityType: "player1"
    property alias controller: controller

    MultiResolutionImage{
        id:_player
        source: Qt.resolvedUrl("../../assets/img/0.png")
    }


    BoxCollider{
        anchors.fill: parent
        force: Qt.point(player.controller.xAxis * 2000, -player.controller.yAxis * 2000)
        linearDamping: 15   //调节这个值，可以改变人物移动的速度，值越小，移动速度越快
    }

    // this controller helps to move the player
    TwoAxisController {
      id: controller
      inputActionsToKeyCode: {
          "up":Qt.Key_Up,
          "down":Qt.Key_Down,
          "left":Qt.Key_Left,
          "right":Qt.Key_Right,
          "fire":Qt.Key_D
      }


      // this controller helps to move the player
      onInputActionPressed: (input)=>{

                                if(input==="fire")
                                {

                                    entityManager.createEntityFromUrlWithProperties(Qt.resolvedUrl("../entities/Bullet.qml"), {
                                         //动态创建一个新的子弹实体，并为其设置初始属性
                                         "shootPosition" : Qt.point(player.x + player.width , player.y + player.height / 2 -10),
                                         "velocity" : Qt.point(300,0)
                                         //子弹的速度方向是用这个坐标计算的,
                                         //如（30,0）x方向为30,y方向为0,那么子弹就向x方向运动，
                                         //如果（30,30），那么子弹就向右下角运动，矢量和
                                     });
                                }
                            }
      onInputActionReleased: (input)=>{

                             }
    }

}
