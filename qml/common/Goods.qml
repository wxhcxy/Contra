import QtQuick
import Felgo
import "../Controller.js" as Ctrler



Rectangle{
    implicitWidth: _goods.width
    implicitHeight: _goods.height
    property alias source: _img.source
    property int cost: 0
    property string type:""
    property int numValue: 0
Column{
    id:_goods

    MultiResolutionImage{
        id:_img
        source: Qt.resolvedUrl("")
    }
    Text{
        id:_text
        text:type+" + " +numValue+"\n"+"$: "+cost
        font.pixelSize: 5
        color:"green"

    }


}
     border.width: 1
     border.color: "black"
     color:"pink"
    TapHandler{
        onTapped: {
            Ctrler.buyGoods()

        }
    }
}

