import Felgo
import QtQuick
import QtQuick.Controls

SceneBase {
    id: settingScene
    anchors.fill: parent

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
            source: Qt.resolvedUrl("../../assets/img/Settings/Back.png")
        }
        z: 10
        anchors.right: gameWindowAnchorItem.right
        anchors.verticalCenter: gameWindowAnchorItem.verticalCenter
        onClicked: {
            selectLevelScene.backButtonPressed()
        }
    }

    Column {
        x: parent.width/2 - width
        y: parent.height/2 - height/2
        spacing: 20

        Text {
            font.pixelSize: 66
            font.family: fontLoader.name
            text: qsTr("Settings")
            color: "black"
        }

        Text {
            font.pixelSize: 46
            font.family: fontLoader.name
            text: qsTr("Background Music")
            color: "black"
        }

        Text {
            font.pixelSize: 46
            font.family: fontLoader.name
            text: qsTr("Sound Effects")
            color: "black"
        }
    }

    Column {
        x: parent.width/2 + width
        y: parent.height/2 - height/2 + 30
        spacing: 15

        Button {
            width: 100
            height: 50
            property bool active: true
            property string activeString: active ? "on" : "off"
            background: Rectangle {
                color: "transparent"
            }
            Text {
                font.pixelSize: 66
                font.family: fontLoader.name
                text: qsTr(parent.activeString)
            }
            onClicked: active = !active
        }

        Button {
            width: 100
            height: 50
            property bool active: true
            property string activeString: active ? "on" : "off"
            background: Rectangle {
                color: "transparent"
            }
            Text {
                font.pixelSize: 66
                font.family: fontLoader.name
                text: qsTr(parent.activeString)
            }
            onClicked: active = !active
        }

    }


}
