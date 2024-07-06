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
    else if(this.entityType === "snowBullet"){//检测该实体是否为雪花
        bulletEnemyBeginCrash(this,collidedEntity,contactNormal)
    }
    if(otherEntityId==="reward"&&this.entityId==="player") //只有玩家碰到宝箱，宝箱才会销毁
    {
        if(collidedEntity.treasureMode===1) player.attackMode=1 //捡到第一种宝箱，更换玩家攻击模式
        if(collidedEntity.treasureMode===2) player.attackMode=2 //捡到第二种宝箱，更换玩家攻击模式
        collidedEntity.destroy() //销毁宝箱
        return
    }
}


//玩家开始碰撞的处理
//currentEntity为该实体
//otherEntity为发生碰撞的实体
function playerBeginCrash(currentEntity,otherEntity,contactNormal){
    if(otherEntity.entityId === "enemy"){//检测该otherEntity是否为enemy
        bloodCalculate(currentEntity,otherEntity,contactNormal)
        //console.log(currentEntity.entityType+" crash "+otherEntity.entityType)
    }
    else if(otherEntity.entityId === "laser"){//检测该otherEntity是否为ground
        bloodCalculate(currentEntity,otherEntity,contactNormal)
    }
    else if(otherEntity.entityType === "enemyBullet"){//检测该otherEntity是否为enemy
        bloodCalculate(currentEntity,otherEntity,contactNormal) //敌人子弹打中玩家，计算玩家血量
        //console.log(currentEntity.entityType+" crash "+otherEntity.entityType)
    }
    else if(otherEntity.entityType === "snowBullet"){
        player.playerSnow.visible = true
        img.jumpTo("Idle")
        player.fire = false
        player.collider.bodyType = Body.Static
        disablePlayerKeyboardInput() //雪花打到玩家，玩家被冰冻，键盘失效
        bloodCalculate(currentEntity,otherEntity,contactNormal)
        player.pauseSnowPlayer.start()
    }
    else if(otherEntity.entityId === "ground"){//检测该otherEntity是否为ground
        //console.log(currentEntity.entityType+" crash "+otherEntity.entityType)
        if(otherEntity.entityType === "ground2"){
            player.jump =false
        }
    }

}

//通过检测玩家按下键，改变状态，并做出反应
function playerInputPressed(input){
    if(input==="fire")
    {
        player.continuousShoot = true
        continuousShootTimer.start()
        player.fire = true
        console.log("Player fire!")
        playerActions()
    }
    else if(input === "jump"){
        if(!player.jump){
            player.jump = true
            collider.linearVelocity.y = -1500
            playerActions()

       }
    }

    // 通过判断按下的按键来确定移动的方向
    else if(input === "up"){
        player.shootUp = true
        player.direction = Qt.point(0,-1)

        playerActions()
    }
    else if(input === "down"){
        player.shootDown = true
        player.faceDown = true
        player.direction = Qt.point(0,1)
        playerActions()
    }
    else if(input === "left"){
        player.shootLeft = true
        player.faceLeft = true
        player.faceRight = false
        player.direction = Qt.point(-1,0)
        img.mirrorX = true
        playerActions()
    }
    else if(input === "right"){
        player.shootLeft = false
        player.shootRight = true
        player.faceRight = true
        player.faceLeft = false
        player.direction = Qt.point(1,0)
        img.mirrorX = false
        playerActions()
    }else if(input === "squat"){
        if(!player.jump){
            player.squat = true
            player.y+=18
            playerActions()
        }
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
    if(input === "up"){
        player.shootUp = false
    }
    else if(input === "down"){
        player.shootDown = false
        player.faceDown = false
    }
    else if(input === "left"){
        player.faceLeft = false

    }
    else if(input === "right"){
        player.faceRight = false
    }else if(input === "fire"){
        player.continuousShoot = false
        continuousShootTimer.stop()
        player.fire = false
        if(!player.squat){
        collider.bodyType = Body.Dynamic
            if(player.faceLeft ){
                img.jumpTo("Run")
                img.mirrorX = true
           }if(player.faceRight ){
                img.jumpTo("Run")
                img.mirrorX = false
           }
        }
        else{
            img.jumpTo("Squat")
        }


    }else if(input === "jump"){

    }else if(input === "squat"){

        player.squat = false
        collider.bodyType = Body.Dynamic
        if(player.fire){
            img.jumpTo("Fire")
        }
        if(player.faceLeft || player.faceRight){
                    img.jumpTo("Run")
       }
    }

}

// 玩家被雪花打到会被冰冻1秒，此时键盘没有效果
function disablePlayerKeyboardInput() {
    player.controller.inputActionsToKeyCode = {
        "up": Qt.Key_unknown,
        "down": Qt.Key_unknown,
        "left": Qt.Key_unknown,
        "right": Qt.Key_unknown,
        "fire": Qt.Key_unknown,
        "jump": Qt.Key_unknown,
        "squat": Qt.Key_unknown
    };
}

// 冰冻1秒后玩家恢复
function enablePlayerKeyboardInput() {
    player.controller.inputActionsToKeyCode = {
        "up": Qt.Key_W,
        "down": Qt.Key_S,
        "left": Qt.Key_A,
        "right": Qt.Key_D,
        "fire": Qt.Key_J,
        "jump": Qt.Key_K,
        "squat": Qt.Key_Shift
    };
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
   if(player.fire){
       var bulletUrl = Qt.resolvedUrl("./entities/PlayerBullet.qml")
       var shootPosition = Qt.point(player.x + player.width/2 , player.y + player.height / 2 -10)
       var bulletsX = 300
       var bulletsY = 0

       if(player.shootRight){bulletsX=300; bulletsY=0}
       if(player.shootLeft){bulletsX=-300; bulletsY=0}
       if(player.shootRight&&player.shootUp){ bulletsX=200; bulletsY=-200}
       if(player.shootRight&&player.shootDown){ bulletsX=200; bulletsY=200}
       if(player.shootLeft&&player.shootUp){bulletsX=-200; bulletsY=-200}
       if(player.shootLeft&&player.shootDown){bulletsX=-200; bulletsY=200}
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

       if(!player.jump){
            if(player.squat){
            img.jumpTo("SquatAndFire")
            collider.bodyType = Body.Static
            }
            else{
            img.jumpTo("Fire")
            collider.bodyType = Body.Static
           }
       }else{
           if(!player.squat){
               img.jumpTo("Fire")
           }
       }

   }
   else if(player.faceLeft){
      img.mirrorX = true
      if(!player.squat){
          img.jumpTo("Run")
      }else{
          if(!player.jump){
          collider.bodyType = Body.Static
          img.jumpTo("Squat")
          }
      }

  }
   else if(player.faceRight){

       img.mirrorX = false
       if(!player.squat){
           img.jumpTo("Run")
       }else{
           if(!player.jump){
           collider.bodyType = Body.Static
           img.jumpTo("Squat")
           }
       }


   }
   else if(player.squat){
       if(!player.jump){
       collider.bodyType = Body.Static
       img.jumpTo("Squat")

       }

   }else if(player.faceDown){

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

