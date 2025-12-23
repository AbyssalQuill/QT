import QtQuick 6.8
import QtQuick.Window 6.8
import QtQuick.Controls 6.8
import QtQuick.Controls.Basic 6.8

// 1. 核心基础：创建窗口（Window 关键字）
Window {
    id: mainWindow
    visible: true // 控制窗口是否显示，必选关键字
    width: 600    // 窗口宽度，数值型属性
    height: 400   // 窗口高度
    title: qsTr("QT Quick 关键字实战") // 窗口标题，支持国际化的字符串

    // 2. 布局基础：Item 容器（通用容器关键字）
    Item {
        id: contentContainer
        anchors.fill: parent // 锚点布局，填充父组件（anchors 核心关键字）
        anchors.margins: 20  // 内边距，锚点关联属性

        // 3. 文本组件：Text 关键字（显示文本）
        Text {
            id: helloText
            // 位置布局：x/y 绝对定位（与 anchors 二选一）
            x: 20
            y: 30
            // 文本内容与样式
            text: "基础文本示例"
            font.family: "微软雅黑" // 字体家族
            font.pointSize: 14      // 字体大小（点）
            font.bold: true         // 粗体
            font.italic: false      // 斜体
            // 自动换行
            wrapMode: Text.NoWrap
            color: "#333333"        // 字体颜色（十六进制）
            horizontalAlignment: Text.AlignLeft // 水平对齐
        }

        // 4. 字体大小动态修改：绑定 + Button 关键字
        Button {
            id: resizeBtn
            x: 20
            y: 80
            text: "增大字体"
            width: 120
            height: 40
            // 点击事件（onClicked 信号关键字）
            onClicked: {
                helloText.font.pointSize += 2 // 字体大小自增2
                if (helloText.font.pointSize > 24) {
                    helloText.font.pointSize = 14 // 重置上限
                }
            }
        }

        // 5. 格式化文本：Text 高级属性
        Text {
            id: formatText
            x: 20
            y: 140
            // 多行文本 + 换行
            text: "多行文本示例\n第二行内容\n数值格式化：π = " + (3.1415926).toFixed(2)
            font.family: "宋体"
            font.pointSize: 12
            color: "#666666"
            width: 200
            wrapMode: Text.WordWrap // 自动换行
        }

        // 6. 样式美化：Rectangle 背景 + Text 组合
        Rectangle {
            id: textBg
            x: 20
            y: 220
            width: 250
            height: 60
            color: "#f5f5f5"       // 背景色
            border.color: "#dddddd"// 边框色
            border.width: 1
            radius: 8              // 圆角

            Text {
                id: styledText
                anchors.centerIn: parent // 居中锚点
                text: "带背景的美化文本"
                font.family: "Arial"
                font.pointSize: 13
                font.weight: Font.Medium // 中等粗细
                color: "#2d7d9a"
            }
        }

        // 7. 动态文本：绑定属性值
        Text {
            id: bindText
            x: 20
            y: 300
            // 绑定窗口宽度，实时显示
            text: "当前窗口宽度：" + mainWindow.width
            font.pointSize: 11
            color: "#999999"
        }
    }

    // 8. 窗口大小变化监听（onWidthChanged 信号关键字）
    onWidthChanged: {
        console.log("窗口宽度变为：", width) // 控制台输出（console 关键字）
    }
}