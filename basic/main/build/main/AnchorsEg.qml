import QtQuick 6.5
import QtQuick.Window 2.15

Window {
        width: 1200
        height: 600
        visible: true
        title: qsTr("anchors 全功能示例")
        color: "#F5F5F5" // 窗口背景色
        Rectangle {
                anchors.fill: parent
                color: '#38dbe4'              
                Rectangle {
                        anchors.centerIn: parent  
                        id: mainRect
                        color: '#98ca0f'
                        width: 100
                        height: 100
                        Rectangle {
                        id: pinkRect
                        anchors.left: mainRect.right
                        anchors.verticalCenter: mainRect.verticalCenter// 垂直居中
                        color: '#f0f'  // 粉色矩形
                        width: 50
                        height: 50
                        }
                        Rectangle {
                        id: blueRect
                        anchors.right: mainRect.left
                        anchors.verticalCenter: mainRect.verticalCenter// 垂直居中
                        color: '#09f'  // 蓝色矩形
                        width: 50
                        height: 50
                        }
                        Rectangle {
                        id: yellowRect
                        anchors.top: mainRect.bottom
                        anchors.horizontalCenter: mainRect.horizontalCenter// 水平居中
                        color: '#ff0'  // 黄色矩形
                        width: 50
                        height: 50
                        }
                        Rectangle {
                        id: greenRect
                        anchors.bottom: mainRect.top
                        anchors.horizontalCenter: mainRect.horizontalCenter// 水平居中
                        color: '#0f0'  // 绿色矩形
                        width: 50
                        height: 50
                        }
                }
        }
        Rectangle {
                id: pinkRect2
                x:mainRect.x-200
                y:mainRect.y+200
                width: 100
                height: 100
                color: '#f0f'
                Rectangle{
                        id: blueRect2
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                        color: '#09f'
                        width: 50
                        height: 50
                }
        }

}
