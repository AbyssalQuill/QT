import QtQuick 6.5
import QtQuick.Window 6.5

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Rainbow Gradient Example")
    color: "white"
    
    Rectangle {
        width: 400
        height: 200
        anchors.fill: parent
        
        gradient: Gradient {
            GradientStop { position: 0.0; color: "red" }
            GradientStop { position: 0.16; color: "orange" }
            GradientStop { position: 0.33; color: "yellow" }
            GradientStop { position: 0.5; color: "green" }
            GradientStop { position: 0.66; color: "blue" }
            GradientStop { position: 0.83; color: "indigo" }
            GradientStop { position: 1.0; color: "violet" }
        }
    }
}