import QtQuick 6.5
import QtQuick.Window 6.5
import QtQuick.Controls 6.5
import QtQuick.Layouts 6.5

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    GridLayout {
        id: grid
        anchors.fill: parent
        columns: 2  //2列
        rows: 2     //2行
        rowSpacing: 10  // 行间距
        columnSpacing: 10  // 列间距
        flow: GridLayout.LeftToRight

        Button {
            text: "Button 1"
        }

        Button {
            text: "Button 2"
        }

        Button {
            text: "Button 3"
        }

        Button {
            text: "Button 4"
        }
    }
}