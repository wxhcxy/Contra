import Felgo
import QtQuick
import QtQuick.Controls

SceneBase {
    id: selectLevelScene
    anchors.fill: parent
    property int backgroundIndex

    signal levelPressed(string selectedLevel)

    Image {
        z: -2
        anchors.centerIn: parent
        anchors.fill: parent
        source: Qt.resolvedUrl("../../assets/img/background/bg4.png")
    }

    Button {
        height: 45
        width: 45
        background: Image {
            source: Qt.resolvedUrl("../../assets/img/Back.png")
        }
        // color: "transparent"
        z: 10
        anchors.right: gameWindowAnchorItem.right
        anchors.verticalCenter: gameWindowAnchorItem.verticalCenter
        onClicked: {
            selectLevelScene.backButtonPressed()
        }
    }

    Grid {
        anchors.centerIn: parent
        spacing: 8
        columns: 5

        Repeater {
          model: 3
          delegate: Rectangle {
            width: 66
            height: 66
            radius: 12
            color: "white"

            Rectangle {
              width: 58
              height: 58
              anchors.centerIn: parent
              radius: 11
              color: "#54A4BF"

              Rectangle {
                width: 54
                height: 54
                anchors.centerIn: parent
                radius: 10
                color: "white"

                Button {
                  property int level: index + 1 // index holds values from 0 to 1 (we set our repeater model to 2)
                  text: level
                  font.pixelSize: 46
                  font.family: fontLoader.name
                  width: 50
                  height: 50
                  anchors.centerIn: parent
                  onClicked: {
                    var levelFile = "Level"+level+".qml";
                    selectLevelScene.backgroundIndex = level;
                    gameScene.background = level;
                    //console.log(gameScene.background)
                    levelFile = "Level"+level+".qml";
                    levelPressed(levelFile);
                  }
                }
              }
            }
          }
        }
    }

}
