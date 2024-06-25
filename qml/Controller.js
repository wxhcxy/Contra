//该方法适用于实体的fixture.onBeginContact方法
//otherEntity为与该实体发生碰撞的实体
//contactNormal矢量包含两个对象在水平轴（如果contactNormal.x为1或-1）或垂直轴（如果contactNormal.y为1或+1）上碰撞时的信息。未受影响的轴将为0。
function entityBeginCrash(otherEntity,contactNormal) {
    var collidedEntity = otherEntity.getBody().target;//获取碰撞的实体other
    var otherEntityId = collidedEntity.entityId;//获取碰撞实体的entityId
    var otherEntityParent = collidedEntity.parent;//获取碰撞实体的父对象
    var otherEntityType = collidedEntity.entityType
    if(otherEntity.width===640){ //玩家子弹跑到窗口右侧边界时销毁，防止打到后面未出现的敌人
        this.destroy()
    }
    if(this.entityType === "playerBullet"&&otherEntity.entityType==="player1"){//检测该实体是否为子弹
        console.log("34514")
        return
    }
    else if(this.entityId === "player"){ //检测该实体是否为玩家
        playerBeginCrash(this,collidedEntity,contactNormal)
    }
    //console.log("this.entityId: "+this.entityId)
    else if(this.entityId === "enemy"){ //检测该实体是否为敌人
        enemyBeginCrash(this,collidedEntity,contactNormal)
    }
    else if(this.entityType === "playerBullet"){//检测该实体是否为子弹
        bulletPlayerBeginCrash(this,collidedEntity,contactNormal)
    }
    else if(this.entityType === "enemyBullet"){//检测该实体是否为子弹
        bulletEnemyBeginCrash(this,collidedEntity,contactNormal)    //敌人子弹打到玩家，敌人子弹会销毁
    }
}


//玩家开始碰撞的处理
//currentEntity为该实体
//otherEntity为发生碰撞的实体
function playerBeginCrash(currentEntity,otherEntity,contactNormal){
    if(otherEntity.entityId === "enemy"){//检测该otherEntity是否为enemy
        //console.log(currentEntity.entityType+" crash "+otherEntity.entityType)
    }
    else if(otherEntity.entityType === "enemyBullet"){//检测该otherEntity是否为enemy
        bloodCalculate(currentEntity,otherEntity,contactNormal) //敌人子弹打中玩家，计算玩家血量
        //console.log(currentEntity.entityType+" crash "+otherEntity.entityType)
    }
    else if(otherEntity.entityId === "ground"){//检测该otherEntity是否为ground
        //console.log(currentEntity.entityType+" crash "+otherEntity.entityType)
        currentEntity.state = "Idle"
    }

}

//通过检测玩家按下键，改变状态，并做出反应
function playerInputPressed(input){
        if(input==="fire")
        {
            this.state = "Fire"
            console.log("Player fire!")
            playerActions(this.state)
        }
        else if(input === "jump"){
            this.state ="Jump"
            playerActions(this.state)
        }

        // 通过判断按下的按键来确定移动的方向
        else if(input === "up"){
            player.shootUp = true
            player.direction = Qt.point(0,-1)
            console.log("Player up!")
        }
        else if(input === "down"){
            player.shootDown = true
            player.direction = Qt.point(0,1)
            console.log("Player down!")

        }
        else if(input === "left"){
            player.shootRight = false
            player.shootLeft = true
            this.state = "Left"
            player.direction = Qt.point(-1,0)
            playerActions(this.state)
            console.log("Player left!")
        }
        else if(input === "right"){
            player.shootLeft = false
            player.shootRight = true
            this.state = "Right"
            player.direction = Qt.point(1,0)
            playerActions(this.state)
            console.log("Player right!")
        }
        else if(input === "right" && "down"){
            player.direction = Qt.point(1,1)
            console.log("Player right and down!")
        }
        else if(input === "right" && "up"){
            player.direction = Qt.point(1,-1)
            console.log("Player right and up!")
        }
        else if(input === "left" && "up"){
            player.direction = Qt.point(-1,-1)
            console.log("Player left and up!")
        }
        else if(input === "left" && "down"){
            player.direction = Qt.point(-1,1)
            console.log("Player left and down!")
        }
}

//通过检测玩家释放键，改变状态，并做出反应
function playerInputReleased(input){

        this.state = "Idle"
        if(input === "up"){
            player.shootUp = false
        }
        else if(input === "down"){
            player.shootDown = false
        }

}




function shootBullet(bulletUrl, shootPosition, velocity, attackPower){
    entityManager.createEntityFromUrlWithProperties(bulletUrl, {
         //动态创建一个新的子弹实体，并为其设置初始属性
         "shootPosition" : shootPosition,
         "velocity" : velocity,
         "attackPower" : attackPower  //子弹的攻击力
         //子弹的速度方向是用这个坐标计算的,
         //如（30,0）x方向为30,y方向为0,那么子弹就向x方向运动，
         //如果（30,30），那么子弹就向右下角运动，矢量和
     });
}

function playerActions(status){
   if(status === "Fire"){
       var bulletUrl = Qt.resolvedUrl("./entities/PlayerBullet.qml")
       var shootPosition = Qt.point(player.x + player.width+10 , player.y + player.height / 2 -20)
       var bulletsX = 300
       var bulletsY = 0

       if(player.shootRight){bulletsX=300; bulletsY=0}
       if(player.shootLeft){bulletsX=-300; bulletsY=0}
       if(player.shootRight&&player.shootUp){ bulletsX=300; bulletsY=-300}
       if(player.shootRight&&player.shootDown){ bulletsX=300; bulletsY=300}
       if(player.shootLeft&&player.shootUp){bulletsX=-300; bulletsY=-300}
       if(player.shootLeft&&player.shootDown){bulletsX=-300; bulletsY=300}
       var shootDirection = Qt.point(bulletsX,bulletsY)
       var bullets = [
                   {velocity: Qt.point(bulletsX,bulletsY),attackPower: 30},
                   {velocity: Qt.point(bulletsX-10,bulletsY-40),attackPower: 30},
                   {velocity: Qt.point(bulletsX-10,bulletsY+40),attackPower: 30}
               ];
       if(player.attackMode===0) //一颗普通子弹
       {
           shootBullet(bulletUrl, shootPosition, shootDirection, 30)
       }
       else if(player.attackMode===1) //一颗强化子弹
       {
           shootBullet(bulletUrl, shootPosition, shootDirection, 50)
       }
       else if(player.attackMode===2) //三颗强化子弹
       {
           for(var i = 0; i < bullets.length; ++i){
               shootBullet(bulletUrl, shootPosition, bullets[i].velocity, bullets[i].attackPower)
           }
       }

   }
   if(status === "Jump"){
       collider.linearVelocity.y = -1200
   }

}




//敌人开始碰撞的处理
//currentEntity为该实体
//otherEntity为发生碰撞的实体
function enemyBeginCrash(currentEntity,otherEntity,contactNormal){
    //console.log("otherEntity.entityType:"+otherEntity.entityType)
    if(otherEntity.entityId === "player"){
        //console.log(currentEntity.entityType+" crash "+otherEntity.entityType)
    }
    else if(otherEntity.entityType === "playerBullet"){
        console.log("playerBullet")
        bloodCalculate(currentEntity,otherEntity,contactNormal)
        //console.log(currentEntity.entityType+" crash "+otherEntity.entityType)
        //console.log(currentEntity.entityType+" hp--")
    }
}

//子弹碰撞到敌人时，计算伤害，生命值
function bloodCalculate(currentEntity,otherEntity,contactNormal){
    //console.log(currentEntity.entityId)
    //console.log(otherEntity.attackPower) //子弹的攻击力
    //console.log("this.blood: "+currentEntity.blood) //生命值
    currentEntity.blood -= otherEntity.attackPower //生命值计算，生命值减去当前子弹的攻击力
    console.log(currentEntity.entityId+"  blood: "+currentEntity.blood)
    if(currentEntity.blood<=0&&currentEntity.entityId!=="player")
    {
        currentEntity.destroy() //生命值小于等于0,就销毁它
    }
}


//子弹开始碰撞的处理
//currentEntity为该实体
//otherEntity为发生碰撞的实体
function bulletPlayerBeginCrash(currentEntity,otherEntity,contactNormal){
    if(otherEntity.entityId === "enemy"){
        currentEntity.destroy()
        //console.log(currentEntity.entityType+" crash "+otherEntity.entityType)
    }
    else if(otherEntity.entityId === "ground"){
        //console.log(currentEntity.entityType+" crash "+otherEntity.entityType)

    }
}

function bulletEnemyBeginCrash(currentEntity,otherEntity,contactNormal){
    if(otherEntity.entityId === "player"){
        currentEntity.destroy()
        return
    }
}

// 添加了player的moveback功能
function moveBack(distance) {
    // player有一个"direction"的属性来表示面向方向
    var backDirection = Qt.point(-player.direction.x, -player.direction.y); // 获取后退方向

    // 计算新的位置（直接基于方向移动）
    var newPosX = player.x + backDirection.x * distance;
    var newPosY = player.y + backDirection.y * distance;

    // player图片大小为63*61
    if(player.x < 0){ player.x = 0; newPosX = player.x}
    if(player.y > 370){ player.y = 370 - 63; newPosY = player.y}

    // 设置新的位置
    player.x = newPosX;
    player.y = newPosY;

    // 输出新的位置
    console.log("Player moved back to:", newPosX, newPosY);
    }

function buyGoods(){
   if(player.money >= this.cost){
       player.money -= this.cost
   switch(this.type){
   case "life":
       player.blood += this.numValue
       console.log(player.blood)
       break;
   case "speed":
       player.collider.linearDamping -=this.numValue
       break;
    default:
        break;
   }
   _text.text = "售完"
   _text.color = "red"
   type =""
   }else{
       console.log("current money:"+player.money)
   }


}

