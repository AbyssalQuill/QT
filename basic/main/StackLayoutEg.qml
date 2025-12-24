import QtQuick 6.5
import QtQuick.Window 6.5
import QtQuick.Layouts 6.5
import QtQuick.Controls 6.5

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("StackLayout Example")
    
    StackLayout {
        id: stack
        anchors.fill: parent
        currentIndex: 0
        
        Rectangle {
            color: "purple"
            Text {
                text: "Page 1"
                anchors.centerIn: parent
            }
        }
        Rectangle {
            color: "yellow"
            Text {
                text: "Page 2"
                anchors.centerIn: parent
            }
        }
    }
    
    // 独立的控制按钮，放在StackLayout下方
    Button {
        id: pageSwitchButton
        text: "翻页"
        width: 100
        height: 50
        z:15
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        onClicked: stack.currentIndex = stack.currentIndex == 0 ? 1 : 0
    }
}