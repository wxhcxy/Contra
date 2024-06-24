import QtQuick
import Felgo
import "../common"
import "../Controller.js" as Ctrler
EntityBase {

    entityId: "npc"
    entityType: "npc"

    property string path
    property alias dialog: _dialog
    property alias npc: _npc
    property alias shop : _shop
    implicitWidth: _npc.width
    implicitHeight: _npc.height
    Text {
            id: _dialog
            x:parent.x
            y:parent.y-30
            font.pixelSize: 20

            visible: false
            }

    GameSpriteSequence{
        id:_npc
        defaultSource: Qt.resolvedUrl("../../assets/img/Npcs/npc3"+path+".png")
        GameSprite{
            name:"Appro"
            frameWidth: 36
            frameHeight: 65
            frameCount: 6
            frameDuration: 200
            to:{"Idle1":0.3}
        }
        GameSprite{
            name:"Idle1"
            frameX: 216
            frameWidth: 36
            frameHeight: 65
            frameCount: 6
            frameDuration: 1000
            to:{"Appro":0.2}
         }



    }

    BoxCollider{
        id:_npcCollider
        implicitHeight: _npc.height
        implicitWidth: _npc.width
        bodyType: Body.Static

    }

    TapHandler{
        onTapped: {
            _shop.visible = true
        }

    }

    ShopPage{
        id:_shop
        x:parent.x + 20
        visible: false
        opacity: 0.8
        z:1
        TapHandler{
            onDoubleTapped: {_shop.visible = false}
        }
    }


}
