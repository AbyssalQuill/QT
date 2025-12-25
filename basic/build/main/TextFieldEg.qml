import QtQuick 6.5
import QtQuick.Window 6.5
import QtQuick.Controls 6.5

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("输入框")

    Column {
        anchors.centerIn: parent
        spacing: 20

        TextField {
            id: textField
            placeholderText: "请输入用户名"
            placeholderTextColor: "purple"  // 使用标准颜色名称
            maximumLength: 20
            // 移除不合适的validator，因为这是文本输入框
            width: 200
        }

        Button {
            text: "清空"
            onClicked: textField.clear()
        }
    }
}