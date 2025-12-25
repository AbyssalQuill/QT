import QtQuick 6.5
import QtQuick.Window 6.5
import QtQuick.Controls 6.5

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("QML窗口")
    flags:Qt.Window | Qt.WindowMaximizeButtonHint
    opacity: 0.9
    color: '#0496ff'
    Button {
        width: 100
        height: 50
        text: "关闭"
        anchors.centerIn: parent
        onClicked: {
            Qt.quit()
        }
    }
}


