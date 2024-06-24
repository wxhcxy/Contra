import QtQuick 2.0
import Felgo

Column{
    id:_goods
    property alias source: _img.source
    property int cost: 0
    MultiResolutionImage{
        id:_img
        source: Qt.resolvedUrl("")
    }
    Text{
        id:_text
        text:"Goods1"
        font.pixelSize: 20
        color:"white"
    }
}
