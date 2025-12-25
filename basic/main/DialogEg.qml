import QtQuick 6.5
import QtQuick.Controls 6.5
import QtQuick.Window 6.5

Window {
    title: "Dialog"
    visible: true
    width: 640
    height: 480

    Dialog {
        visible: true
        title: "提示"
        width: 400
        height: 200
        modal: true//模态，必须先关闭对话框才能继续操作
        anchors.centerIn: parent
        standardButtons: Dialog.Ok | Dialog.Cancel
        onAccepted: {
            console.log("点击了确定")
        }
        onRejected: {
            console.log("点击了取消")
        }
    }
}