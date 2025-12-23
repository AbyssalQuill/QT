import QtQuick 6.8
import QtQuick.Window 6.8
// 1. 核心基础：创建窗口（Window 关键字）
Window {
    id: mainWindow
    visible: true // 控制窗口是否显示，必选关键字
    width: 600    // 窗口宽度，数值型属性
    height: 400   // 窗口高度
    title: qsTr("QT Quick 关键字实战")
    Rectangle {
        id: mainRect
        width: parent.width
        height: parent.height
        color: "white"
    }
}