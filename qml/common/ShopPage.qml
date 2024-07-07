import QtQuick 2.0

Rectangle {
    id:_shopPage
    implicitHeight: _grid.height
    implicitWidth: _grid.width
    Grid{
        id:_grid
        rows:3
        columns:3
        Goods{
            type:"reward1"

            cost:100
        }
        Goods{
            type:"reward2"

            cost:200
        }

    }
}
