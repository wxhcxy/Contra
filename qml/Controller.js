//该方法适用于实体的fixture.onBeginContact方法
//otherEntity为与该实体发生碰撞的实体
//contactNormal矢量包含两个对象在水平轴（如果contactNormal.x为1或-1）或垂直轴（如果contactNormal.y为1或+1）上碰撞时的信息。未受影响的轴将为0。
function entityBeginCrash(otherEntity,contactNormal) {
    var collidedEntity = otherEntity.getBody().target;//获取碰撞的实体other
    var otherEntityId = collidedEntity.entityId;//获取碰撞实体的entityId
    var otherEntityParent = collidedEntity.parent;//获取碰撞实体的父对象
    var otherEntityType = collidedEntity.entityType
    if(this.entityId === "player"){ //检测该实体是否为玩家
        playerBeginCrash(this,collidedEntity,contactNormal)
    }
    if(this.entityId === "enemy"){ //检测该实体是否为敌人
        enemyBeginCrash(this,collidedEntity,contactNormal)
    }
    if(this.entityId === "playerBullet"){//检测该实体是否为子弹
        bulletBeginCrash(this,collidedEntity,contactNormal)
    }


}


//玩家开始碰撞的处理
//currentEntity为该实体
//otherEntity为发生碰撞的实体
function playerBeginCrash(currentEntity,otherEntity,contactNormal){
    if(otherEntity.entityId === "enemy"){//检测该otherEntity是否为enemy
        console.log(currentEntity.entityType+" crash "+otherEntity.entityType)
    }
    if(otherEntity.entityId === "ground"){//检测该otherEntity是否为ground
        console.log(currentEntity.entityType+" crash "+otherEntity.entityType)
        currentEntity.state = "Walk"
    }

}

//
function playerInputPressed(input){
        if(input==="fire")
        {
            this.state = "Fire"
            console.log("Player fire!")
            playerActions(this.state)
        }

}

function playerActions(status){
   if(status === "Fire"){
       entityManager.createEntityFromUrlWithProperties(Qt.resolvedUrl("./entities/PlayerBullet.qml"), {
            //动态创建一个新的子弹实体，并为其设置初始属性
            "shootPosition" : Qt.point(player.x + player.width , player.y + player.height / 2 -10),
            "velocity" : Qt.point(300,0)
            //子弹的速度方向是用这个坐标计算的,
            //如（30,0）x方向为30,y方向为0,那么子弹就向x方向运动，
            //如果（30,30），那么子弹就向右下角运动，矢量和
        });

   }

}




//敌人开始碰撞的处理
//currentEntity为该实体
//otherEntity为发生碰撞的实体
function enemyBeginCrash(currentEntity,otherEntity,contactNormal){
    if(otherEntity.entityId === "player"){
        console.log(currentEntity.entityType+" crash "+otherEntity.entityType)
    }
    if(otherEntity.entityId === "playerBullet"){
        console.log(currentEntity.entityType+" crash "+otherEntity.entityType)
        console.log(currentEntity.entityType+" hp--")
    }
}

//子弹开始碰撞的处理
//currentEntity为该实体
//otherEntity为发生碰撞的实体
function bulletBeginCrash(currentEntity,otherEntity,contactNormal){
    if(otherEntity.entityId === "enemy"){
        console.log(currentEntity.entityType+" crash "+otherEntity.entityType)

    }
    if(otherEntity.entityId === "ground"){
        console.log(currentEntity.entityType+" crash "+otherEntity.entityType)

    }
}


