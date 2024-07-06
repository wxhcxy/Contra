import QtQuick 2.0
import Felgo 4.0
import "../Controller.js" as Ctrler

Enemy{
    id:_ironPlate

    entityType: "ironPlate"
    width: 60
    height: 150
    blood: 200
    z:-1
    source:Qt.resolvedUrl("../../assets/img/laser/ironplate.png")
    attackPower: 80


    boxCollider.fixture.onBeginContact: (other, contactNormal)=>{
                                            Ctrler.entityBeginCrash(other,contactNormal)
                                         }
}
