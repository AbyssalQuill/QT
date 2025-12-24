import QtQuick 6.5
import QtQuick.Controls 6.5
import QtQuick.Window 6.5

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Button {
        text: "确认"
        width: 100
        height: 50
        font.pointSize: 20
        anchors.centerIn: parent
        flat: true//设置按钮无背景
        background: Rectangle {
            color: "blue"
            radius: 4
        }
        checkable: true//设置按钮可点击
        onClicked: {
            Qt.quit()
        }
    }
}