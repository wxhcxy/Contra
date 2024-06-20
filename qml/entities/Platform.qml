import QtQuick 2.0
import Felgo 4.0

TiledEntityBase {
  id: platform
  entityType: "platform"

  size: 2

  Row {
    id: tileRow
    Tile {
      pos: "left"
      image: Qt.resolvedUrl("../../assets/img/platform.png")
    }
    Repeater {
      model: size-2
      Tile {
        pos: "mid"
        image: Qt.resolvedUrl("../../assets/img/platform.png")
      }
    }
    Tile {
      pos: "right"
      image: Qt.resolvedUrl("../../assets/img/platform.png")
    }
  }

  BoxCollider {
    id: collider
    anchors.fill: parent
    bodyType: Body.Static

    fixture.onBeginContact: (other, contactNormal) => {
      var otherEntity = other.getBody().target
      if(otherEntity.entityType === "player") {
        console.debug("contact platform begin")

        // increase the number of active contacts the player has
        player.contacts++
      }
    }

    fixture.onEndContact: other => {
      var otherEntity = other.getBody().target
      if(otherEntity.entityType === "player") {
        console.debug("contact platform end")

        // if the player leaves a platform, we decrease its number of active contacts
        player.contacts--
      }
    }
  }
}
