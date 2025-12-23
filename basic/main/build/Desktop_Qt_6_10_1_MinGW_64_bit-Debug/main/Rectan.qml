import QtQuick 6.5
import QtQuick.Window 6.5

Window {
    visible: true
    width: 800
    height: 600
    title: qsTr("Rectancle全示例")
    color: "#F5F5F5"
    // 基础属性
    Column {
        anchors.top:parent.top
        anchors.left:parent.left
        anchors.margins:20
        spacing: 15
        Text {
            text: "=====基础属性====="
            font.pointSize: 16
            font.bold: true
        }
        Rectangle {
            width: 150
            height: 80
            color: "#FF6B6B"
        }

        Text {
            anchors.centerIn:parent
            text:"宽150 高80"
            font.pointSize: 12
            color: '#f3e9e9'
        }
        Rectangle {
            x:30
            y:10
            width: 150
            height: 80
            color: "#FF6B6B"
            Text {
                anchors.centerIn:parent
                text:"x30 y10\n绝对坐标"
                font.pointSize: 12
                color: '#333'
            }
        }
    }

    // 锚定操作
    Column {
        anchors.top:parent.top
        anchors.left:parent.left
        anchors.margins:20
        spacing: 15
        Text {
            text: "=====锚定操作====="
            font.pointSize: 16
            font.bold: true
        }
        Rectangle {
            width: 150
            height: 80
            color: "#FF6B6B"
            anchors.centerIn:parent
        }
        Text {
            anchors.centerIn:parent
            text:"居中"
            font.pointSize: 12
            color: '#2e2a2a'
        }
    }
    
}
