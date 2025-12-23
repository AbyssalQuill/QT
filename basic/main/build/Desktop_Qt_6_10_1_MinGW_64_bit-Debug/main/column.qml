import QtQuick 6.5
import QtQuick.Window 6.5

Window {
    width: 300
    height: 200
    visible: true
    title: qsTr("Column")
    Column {
        anchors.centerIn: parent
        spacing: 15
        Rectangle {
            width: 100
            height: 100
            color: "red"
        }
        Rectangle {
            width: 100
            height: 100
            color: "green"
        }
        Rectangle {
            width: 100
            height: 100
            color: "blue"
        }
    }
}
