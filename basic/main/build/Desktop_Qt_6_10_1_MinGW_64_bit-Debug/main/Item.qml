import QtQuick 6.5
import QtQuick.Window 6.5

Window {
    width: 640
    height: 480
    visible: true
    title: "Item Window"

    Item {
        width: 200
        height: 150
        enabled: true
        z: 10
        scale: 0.9
        rotation: 10
        opacity: 0.9
        transformOrigin: Item.TopLeft
        anchors.centerIn: parent

        Text {
            text: "Item子组件"
            anchors.centerIn: parent
        }
    }
}