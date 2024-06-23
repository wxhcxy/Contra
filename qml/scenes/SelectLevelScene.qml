import Felgo
import QtQuick
import QtQuick.Controls

SceneBase {
    id: selectLevelScene
    anchors.fill: parent

    signal levelPressed(string selectedLevel)

    Image {
        z: -2
        anchors.centerIn: parent
        anchors.fill: parent
        source: Qt.resolvedUrl("../../assets/img/bg4.png")
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
        spacing: 2
        columns: 2

        Repeater {
          model: 2
          delegate: Rectangle {
            width: 52
            height: 52
            radius: 12
            color: "white"

            Rectangle {
              width: 44
              height: 44
              anchors.centerIn: parent
              radius: 11
              color: "#54A4BF"

              Rectangle {
                width: 40
                height: 40
                anchors.centerIn: parent
                radius: 10
                color: "white"

                Button {
                  property int level: index + 1 // index holds values from 0 to 1 (we set our repeater model to 2)
                  text: level
                  width: 36
                  height: 36
                  anchors.centerIn: parent
                  onClicked: {
                    var levelFile = "Level"+level+".qml";
                    if(level < 2)
                      levelFile = "Level"+level+".qml";
                    levelPressed(levelFile)
                  }
                }
              }
            }
          }
        }
    }

}
