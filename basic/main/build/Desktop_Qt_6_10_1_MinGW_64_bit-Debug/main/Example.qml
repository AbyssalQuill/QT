import QtQuick 6.5
import QtQuick.Window 6.5
Window {
    width:640
    height:480
    visible:true
    title:qsTr("Example")
    color:"white"

    Rectangle {
        id:rect1
        width:100
        height:100
        color:'#ad49db'
    }

    Rectangle {
        id:rect2
        width:100
        height:100
        anchors.left:rect1.right
        anchors.margins:20
        color:'#ad49db'
    }

    Rectangle {
        id:rect3
        width:100
        height:100
        anchors.top:rect1.bottom
        color:'#ad49db'
    }

        

}
