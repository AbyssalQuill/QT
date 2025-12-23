import QtQuick 6.5
import QtQuick.Window 6.5

Rectangle {
    id:borderRect
    width: 200
    height: 100
    color: "black"
    Rectangle {
        id:innerRect
        anchors.fill: parent
        anchors.topMargin:0
        anchors.bottomMargin:0
        anchors.leftMargin:0
        anchors.rightMargin:5
         color: "blue"
    }
}
