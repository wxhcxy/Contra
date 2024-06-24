import QtQuick 2.0

Rectangle {
    id:_shopPage
    implicitHeight: _grid.height
    implicitWidth: _grid.width
    color:"green"
    Grid{
        id:_grid
        columns: 3
        rows: 3
        Goods{}
        Goods{}
        Goods{}
        Goods{}
        Goods{}
        Goods{}
        Goods{}
        Goods{}
        Goods{}
    }
}
