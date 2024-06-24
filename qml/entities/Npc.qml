import QtQuick
import Felgo

EntityBase {

    entityId: "npc"
    entityType: "npc"

    property string path: value
    implicitWidth: _npc.width
    implicitHeight: _npc.height
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
        bodyType: Body.Dynamic
    }


}
