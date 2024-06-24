import Felgo
import QtQuick
import"entities"
import "scenes"

GameWindow {
  id: gameWindow
  state: "menu"
  activeScene: menuScene

  EntityManager {
      entityContainer: gameScene
  }

  FontLoader {
      id: fontLoader
      source: Qt.resolvedUrl("fonts/contra.ttf")
  }

 MenuScene {
      id: menuScene
      onSelectLevelPressed: gameWindow.state = "selectLevel"
      onSettingsPressed: gameWindow.state = "Settings"
  }

 SettingScene {
     id: settingScene
     onBackButtonPressed: gameWindow.state = "menu"
 }

  SelectLevelScene {
      id: selectLevelScene
      onLevelPressed: selectedLevel => {
                          gameScene.setLevel(selectedLevel)
                          gameWindow.state = "game"
                      }
      onBackButtonPressed: gameWindow.state = "menu"
  }

   GameScene {
    id: gameScene

    // set scene alignment
    sceneAlignmentX: "left"
    sceneAlignmentY: "top"
  }



  states: [
    State {
          name: "menu"
          PropertyChanges { target: menuScene; opacity: 1}
          PropertyChanges { target: gameWindow; activeScene: menuScene}
      },
    State{
          name: "selectLevel"
          PropertyChanges {target: selectLevelScene; opacity: 1 }
          PropertyChanges { target: gameWindow; activeScene:selectLevelScene }
      },
    State {
          name: "Settings"
          PropertyChanges { target: settingScene; opacity: 1}
          PropertyChanges { target: gameWindow; activeScene: settingScene}
      },
    State {
          name: "game"
          PropertyChanges { target: gameScene; opacity: 1}
          PropertyChanges { target: gameWindow; activeScene: gameScene}
      }
   ]

}
