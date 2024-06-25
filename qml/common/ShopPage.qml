import QtQuick 2.0

Rectangle {
    id:_shopPage
    implicitHeight: _grid.height
    implicitWidth: _grid.width
    Grid{
        id:_grid
        rows:3
        columns: 3
        Goods{
            type:"life"
            numValue: 100
            cost:200
        }
        Goods{
            type:"speed"
            numValue: 1
            cost:200
        }
        Goods{
            type:"life"
            numValue: 100
            cost:200
        }
        Goods{
            type:"life"
            numValue: 100
            cost:200
        }
        Goods{
            type:"life"
            numValue: 100
            cost:200
        }
        Goods{
            type:"life"
            numValue: 100
            cost:200
        }
        Goods{
            type:"speed"
            numValue: 1
            cost:200
        }
        Goods{
            type:"speed"
            numValue: 1
            cost:200
        }
        Goods{
            type:"speed"
            numValue: 1
            cost:200
        }





    }
}
