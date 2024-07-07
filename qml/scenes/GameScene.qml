import Felgo 4.0
import QtQuick 2.0
import QtQuick.Controls
import "../Controller.js" as Ctrler
import "../game"
import "../common"
import "../entities"

SceneBase {
    id: gameScene
    // the "logical size" - the scene content is auto-scaled to match the GameWindow size
    width: 480
    height: 320
    gridSize: 32

    signal gameOver()
    signal nextLevel(int background)
    signal leaveLevel(int background)

    property alias loader: loader
    property alias bgLoader: bgLoader
    property alias gameOverRectangle: gameOverRectangle
    property int background: 0
    property string activeLevelFileName

    function setLevel(fileName) {
        activeLevelFileName = fileName
    }

    EntityManager {
      id: entityManager
      entityContainer: container
      poolingEnabled: true
    }

    PhysicsWorld {
        id: physicsWorld
        debugDrawVisible: false    // enable this for physics debugging
        gravity.y:98.1
    } 

    // 运行时加载关卡的背景图片
    Loader{
        id: bgLoader
        source: background ? "Background.qml" : ""
    }

    Keys.forwardTo: player.controller

    Item {
      id: container
      property double originX: container.x

      // 运行时加载关卡
      Loader {
          id: loader
          source: activeLevelFileName ? "../game/" + activeLevelFileName : ""
          onLoaded: {
              bloodProgress.value = 1
              gameScene.gameOverRectangle.visible = false
              gameScene.gameOverRectangle.winVisible = false
              gameScene.gameOverRectangle.gameoverVisible = false
              gameScene.gameOverRectangle.pauseVisible = false
              //console.log(bg.sourceImage)
          }
      }

      // the player entity
      Player {
        id: player
        x: 100; y:250
        onBloodChange: {
            bloodProgress.value = player.blood/3000
            //console.log(bloodProgress.value)
        }
      }

    }

    // 血条
    Row {
        id: bloodRow
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.topMargin: 5
        anchors.leftMargin: 5
        Image {
            source: Qt.resolvedUrl("../../assets/img/Player/player.png")
        }
        Rectangle {
            id: _playerBlood
            height: 10
            width: 96
            color: "transparent"
            ProgressBar {
                id: bloodProgress
                anchors.fill: parent
                indeterminate: true
                value: 1
                contentItem: Rectangle {
                    width: bloodProgress.value / bloodProgress.to * bloodProgress.width
                    height: bloodProgress.height
                    radius: 20
                    color: "red"
                }

                background: Rectangle{
                    implicitWidth: bloodProgress.width
                    implicitHeight: bloodProgress.height
                    radius: 20
                    color: "gray"
                }
                onValueChanged: {
                    if(value <= 0){
                    gameOverRectangle.gameoverVisible = true
                    gameOverRectangle.visible = true
                    //rectangleTimer.start()
                    }
                }
            }
        }
        Text{
            id:money
            text: qsTr("$:"+player.money)
        }
    }

    onActiveLevelFileNameChanged: {
        if(activeLevelFileName==="Level1.qml"){
            camera.limitRight = 2200
            camera.limitBottom = 400
            player.x = 100
            player.y = 240
            tmpLeft = 0
            leftCameraTimer.start()
        }
        else{
            leftCameraTimer.stop()
        }
    }

    //定时器更新摄像机的左边位置，玩家前进之后，不能再回到窗口左边未显示的场景
    property int tmpLeft: 0
    Timer{
        id:leftCameraTimer
        running: false
        repeat: true
        interval: 300
        onTriggered: {
            if(Math.abs(container.x)>tmpLeft){
                tmpLeft = Math.abs(container.x)
                camera.limitLeft = tmpLeft
            }
            camera.limitLeft = tmpLeft
        }
    }


    Camera {
      id: camera

      // set the gameWindowSize and entityContainer required for the camera
      gameWindowSize: Qt.point(gameScene.gameWindowAnchorItem.width, gameScene.gameWindowAnchorItem.height)
      entityContainer: container

      // the camera follows the player
      focusedObject: player


      // set the camera's limits
      limitLeft: 0

      limitTop: 0
      limitBottom: 1024
    }

    Rectangle {
        id: gameOverRectangle
        property alias pauseVisible: pauseText.visible
        property alias winVisible: winText.visible
        property alias gameoverVisible: gameoverText.visible
        x: parent.width/2 - width/2
        y: parent.height/2 -height/2
        width: parent.width*0.7
        height: parent.height*0.7
        visible: false
        opacity: 0.8
        color: "#1a1c17"
      Column{
          anchors.centerIn: parent
          Text {
              id: pauseText
              visible: false
              x: parent.width/2 - width/2
              y: parent.height/2 -height
              text: qsTr("Exit")
              font.family: fontLoader.name
              font.pixelSize: 76
          }
          Text {
              id: winText
              visible: false
              x: parent.width/2 - width/2
              y: parent.height/2 -height
              text: qsTr("Win")
              font.family: fontLoader.name
              font.pixelSize: 76
          }
          Text {
              id: gameoverText
              visible: false
              x: parent.width/2 - width/2
              y: parent.height/2 -height
              text: qsTr("Game Over")
              font.family: fontLoader.name
              font.pixelSize: 76
          }
        Text {
            x: parent.width/2 - width/2
            text: qsTr("Next Level?")
            font.family: fontLoader.name
            font.pixelSize: 44
        }
        Row{
            x: parent.width/2 - width/2
            // y: parent.height/2 -height
            spacing: 40
          Button {
              id: yesBtn
              width: 40
              height: 30
             // property bool isPressed: false
              Text {
                  anchors.centerIn: parent
                  text: qsTr("YES")
                  font.family: fontLoader.name
                  font.pixelSize: 23
                  color: "black"
              }
              background: Rectangle {
                  color: "transparent"
              }
              onClicked: {
                  player.x = 100
                  player.y = 255
                  player.blood = player.originalBlood
                  // isPressed = true
                  if(gameScene.background < 3){
                      nextLevel(++gameScene.background)
                     // gameOverRectangle.visible = false
                  } else{
                      gameWindow.state = "menu"
                      hintPopup.open()
                      hintTimer.start()
                  }
//                  gameOverRectangle.winVisible = false
//                  gameOverRectangle.gameoverVisible = false
//                  gameOverRectangle.pauseVisible = false
              }
          }
          Button {
              id: noBtn
              width: 40
              height: 30
              //property bool isPressed: false
              Text {
                  anchors.centerIn: parent
                  text: qsTr("NO")
                  font.family: fontLoader.name
                  font.pixelSize: 23
                  color: "black"
              }
              background: Rectangle {
                  color: "transparent"
              }

              onClicked: {
                  gameWindow.state = "menu"
//                  gameOverRectangle.visible = false
//                  gameOverRectangle.winVisible = false
//                  gameOverRectangle.gameoverVisible = false
//                  gameOverRectangle.pauseVisible = false
                  leftCameraTimer.stop()
                  //tmpLeft = 0
                  camera.limitLeft = 0
                  player.x = 100
                  player.y = 255
                  //isPressed = true
                  player.blood = player.originalBlood
                  activeLevelFileName=""
              }
          }
        }
      }

    }

//    Timer {
//        id: rectangleTimer
//        interval: 100
//        repeat: true
//        onTriggered: {
//            if(noBtn.isPressed || yesBtn.isPressed) {
//            gameOverRectangle.visible = false
//            gameOverRectangle.winVisible = false
//            gameOverRectangle.gameoverVisible = false
//            gameOverRectangle.pauseVisible = false
//            noBtn.isPressed = false
//            yesBtn.isPressed = false
//           }
//        }
//    }

    onGameOver: {
        gameOverRectangle.winVisible = true
        gameOverRectangle.visible = true
    }

    Keys.onPressed: (event)=> {
        if(event.key === Qt.Key_Space){
           gameOverRectangle.pauseVisible = true
           gameOverRectangle.visible = true
           // rectangleTimer.start()
        }
    }

    Popup {
        id: hintPopup
        anchors.centerIn: parent
        background: Rectangle {
            opacity: 0.8
            color: "#1a1c17"
        }
        Text {
            color: "black"
            text: qsTr("That's the last Level")
            font.family: fontLoader.name
            font.pixelSize: 50
        }

        Timer {
            id :hintTimer
            interval: 1500   // hintPopup显示1.5秒
            repeat: false
            onTriggered: hintPopup.close()
        }
    }

}
