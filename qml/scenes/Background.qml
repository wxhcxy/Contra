import Felgo
import QtQuick

ParallaxScrollingBackground {
    sourceImage: Qt.resolvedUrl( "../../assets/img/background/bg" + gameScene.background + ".png")
    anchors.bottom: parent.bottom
    // player.x 大于 240（滚动开始的阈值），ParallaxScrollingBackground将
    // 以 -player.horizontalVelocity（与player水平速度相反的速度）移动，且垂直速度为 0。否则，ParallaxScrollingBackground 将保持静止（速度为 0,0）
    movementVelocity: player.x > 240 ? Qt.point(-player.horizontalVelocity,0) : Qt.point(0,0)
    // 视差滚动的效果比率,水平方向的比率是 0.3 ParallaxScrollingBackground将在水平方向上以player速度的 30% 滚动。垂直方向的比率为 0，垂直方向上没有视差效果
    ratio: Qt.point(0.3,0)
}
