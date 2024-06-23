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
        source: Qt.resolvedUrl("../../assets/img/bg4.png")
    }

    Button {
        id: menuButton1
        width: 150
        height:80
        anchors.centerIn: parent
        anchors.bottomMargin: 50
        text: qsTr("Play")
        font.pointSize: 26
        background: Rectangle {
            color: "transparent"
        }

        onClicked: selectLevelPressed()
    }

}
