import QtQuick 6.5
import QtQuick.Window 6.5
import QtQuick.Controls 6.5
import QtQuick.Layouts 6.5

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    RowLayout {
        anchors.fill: parent
        Button {
            text: "Button 1"
        }
        Button {
            text: "Button 2"
        }
        Button {
            text: "Button 3"
        }
    }

}