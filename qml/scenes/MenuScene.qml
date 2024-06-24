import Felgo
import QtQuick
import QtMultimedia
import QtQuick.Controls

SceneBase {
    id: menuScene
    width: 480
    height: 320
    anchors.fill: parent

    signal selectLevelPressed
    signal settingsPressed

    BackgroundImage {
        z: -2
        anchors.centerIn: parent
        anchors.fill: parent
        source: Qt.resolvedUrl("../../assets/img/background/bg4.png")
    }

    Button {
        id: menuButton1
        width: 150
        height:80
        x: parent.width/2 - width/2
        y: parent.height/2 - height
        text: qsTr("Play")
        font.pixelSize: 46
        font.family: fontLoader.name
        background: Rectangle {
            color: "transparent"
        }

        onClicked: selectLevelPressed()
    }

    Button {
        id: menuButton2
        width: 200
        height:80
        x: parent.width/2 - width/2
        y: parent.height/2 + height/4
        text: qsTr("Settings")
        font.family: fontLoader.name
        font.pixelSize: 46
        background: Rectangle {
            color: "transparent"
        }

        onClicked: settingsPressed()
    }

}
