import QtQuick
import Felgo

EntityBase {
    id:_ground
    // 可设置不同类型的地面资源
    property url source: "../../assets/img/Barriers/"+path+".png"
    property string path
    property int column: 0
    property int row: 0
    property int size
    entityId: "ground"
    entityType: "ground1"

    // 没有直接修改图片的x和y值，引入了 row 和 column 以便更容易定位，Level.qml使用它们
    //x: row*gameScene.gridSize
    //y: level.height - (column+1)*gameScene.gridSize
    width: gameScene.gridSize * size
    height: 32          // 设置高度为图片高度以便更好的进行碰撞

    Row {
        Repeater {
            model: size
            delegate: Image {
                source: "../../assets/img/Barriers/"+path+".png"
            }
        }
    }

    BoxCollider{
        id:collider
        width: _ground.width
        height: _ground.height
        anchors.fill:parent
        bodyType: Body.Static
    }
}
