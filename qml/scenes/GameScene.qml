import Felgo 4.0
import QtQuick 2.0
import "../game"
import "../common"
import "../entities"

Scene {
    id: gameScene
    // the "logical size" - the scene content is auto-scaled to match the GameWindow size
    width: 480
    height: 320
    gridSize: 48

    property int offsetBeforeScrollingStarts: 240

    EntityManager {
        id: entityManager
    }

    Rectangle {
        anchors.fill: gameScene.gameWindowAnchorItem
        color: "#000000"
    }

    Item {
        id: viewPort
        height: level.height
        width: level.width
        anchors.bottom: gameScene.gameWindowAnchorItem.bottom
        x: player.x > offsetBeforeScrollingStarts ? offsetBeforeScrollingStarts-player.x : 0

        PhysicsWorld {
            id: physicsWorld
            gravity: Qt.point(0, 25)
            debugDrawVisible: false    // enable this for physics debugging

            onPreSolve: contact => {
              var entityA = contact.fixtureA.getBody().target
              var entityB = contact.fixtureB.getBody().target
              if(entityB.entityType === "platform" && entityA.entityType === "player" &&
                  entityA.y + entityA.height > entityB.y) {
                //by setting enabled to false, they can be filtered out completely
                //-> disable cloud platform collisions when the player is below the platform
                contact.enabled = false
              }
            }
        }

        Level {
            id: level
        }

        Player {
            id: player
            x: 20
            y: 100
        }

        ResetSensor {
          width: player.width
          height: 10
          x: player.x
          anchors.bottom: viewPort.bottom
          // if the player collides with the reset sensor, he goes back to the start
          onContact: {
            player.x = 20
            player.y = 100
          }
          // this is just for you to see how the sensor moves, in your real game, you should position it lower, outside of the visible area
          Rectangle {
            anchors.fill: parent
            color: "yellow"
            opacity: 0.5
          }
        }
    }

    Rectangle {
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        height: 50
        width: 150
        color: "blue"
        opacity: 0.4

        Rectangle {
          anchors.centerIn: parent
          width: 1
          height: parent.height
          color: "white"
        }
        MultiPointTouchArea {
          anchors.fill: parent
          onPressed: touchPoints => {
            if(touchPoints[0].x < width/2)
              controller.xAxis = -1
            else
              controller.xAxis = 1
          }
          onUpdated: touchPoints => {
            if(touchPoints[0].x < width/2)
              controller.xAxis = -1
            else
              controller.xAxis = 1
          }
          onReleased: controller.xAxis = 0
        }
    }

    Rectangle {
      // same as the above input control
      //visible: !system.desktopPlatform
      //enabled: visible
      anchors.left: parent.left
      anchors.bottom: parent.bottom
      height: 100
      width: 100
      color: "green"
      opacity: 0.4

      Text {
        anchors.centerIn: parent
        text: "jump"
        color: "white"
        font.pixelSize: 9
      }
      MouseArea {
        anchors.fill: parent
        onPressed: player.jump()
      }
    }

    // on desktops, you can move the player with the arrow keys, on mobiles we are using our custom inputs above to modify the controller axis values. With this approach, we only need one actual logic for the movement, always referring to the axis values of the controller
    Keys.forwardTo: controller
    TwoAxisController {
      id: controller
      onInputActionPressed: (actionName, isPressed) => {
        console.debug("key pressed actionName " + actionName)
        if(actionName == "up") {
          player.jump()
        }
      }
    }
}
