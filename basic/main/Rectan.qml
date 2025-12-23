import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 1200
    height: 800
    visible: true
    title: qsTr("Rectangle 全功能示例")
    color: "#F5F5F5" // 窗口背景色

    // 一、基础核心属性（width/height/color等）
    Column {
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.margins: 30
        spacing: 20
        width: 300

        Text { 
            text: "=== 1. 基础核心属性 ==="; 
            font.bold: true;              // 加粗
            font.pixelSize: 16;           // 像素大小
            font.family: "微软雅黑";       // 字体族 
            font.italic: true;            // 斜体
            font.weight: Font.Bold;       // 字体粗细
            font.pointSize: 12;           // 点大小
            font.underline: true;         // 下划线
            font.overline: true;          // 上划线
            font.strikeout: true;         // 删除线
            font.capitalization: Font.SmallCaps; // 大写形式
            // font.stretch: Font.UltraCondensed; // 缩放 - 此属性不存在，已移除
            font.wordSpacing: 2;          // 词间距
            font.letterSpacing: 1;        // 字间距
            font.hintingPreference: Font.PreferFullHinting; // 提示偏好
            font.kerning: true;           // 字距调整
            font.styleName: "Regular";    // 样式名称（如果可用）
            color: "#2c3e50";            // 文字颜色
            opacity: 0.9;                // 透明度
            wrapMode: Text.WordWrap;     // 换行模式
            horizontalAlignment: Text.AlignHCenter; // 水平对齐
            verticalAlignment: Text.AlignVCenter;   // 垂直对齐
            }

        // 1. width/height：尺寸控制
        Rectangle {
            id: rect1
            width: 150    // 宽度（固定值）
            height: 80    // 高度（固定值）
            color: "#FF6B6B" // 背景色（十六进制）
            x: 0  // 初始位置
            y: 0
            Text {
                anchors.centerIn: parent
                text: "width:150\nheight:80\n坐标:(" + parent.x.toFixed(2) + "," + parent.y.toFixed(2) + ")"
                color: "#FFFFFF"
                font.pixelSize: 10
            }
            
            MouseArea {
                anchors.fill: parent
                drag.target: parent
                drag.axis: Drag.XAndYAxis
                onPositionChanged: {
                    // 更新文本以显示实时坐标
                    parent.children[0].text = "width:150\nheight:80\n坐标:(" + parent.x.toFixed(2) + "," + parent.y.toFixed(2) + ")"
                }
            }
        }

        // 2. color/opacity/visible：显示控制
        Rectangle {
            id: rect2
            width: 150
            height: 80
            color: "#4ECDC4" // 青绿色
            opacity: 0.7     // 透明度（0-1，1为不透明）
            visible: true    // 是否显示（true=显示，false=隐藏）
            x: 0
            y: 0
            Text {
                anchors.centerIn: parent
                text: "opacity:0.7\ncolor:青绿色\n坐标:(" + rect2.x + "," + rect2.y + ")"
                color: "#FFFFFF"
                font.pixelSize: 10
            }
            
            MouseArea {
                anchors.fill: parent
                drag.target: parent
                drag.axis: Drag.XAndYAxis
                onPositionChanged: {
                    // 更新文本以显示实时坐标
                    parent.children[0].text = "opacity:0.7\ncolor:青绿色\n坐标:(" + parent.x.toFixed(2) + "," + parent.y.toFixed(2) + ")"
                }
            }
        }

        // 3. x/y：绝对坐标（相对于父组件）
        Rectangle {
            id: rect3
            width: 150
            height: 80
            color: "#FFD166"
            x: 30  // 设置相对于父组件的x坐标
            y: 10  // 设置相对于父组件的y坐标
            Text {
                anchors.centerIn: parent
                text: "x:30 y:10\n绝对坐标\n坐标:(" + rect3.x + "," + rect3.y + ")"
                color: "#333"
                font.pixelSize: 10
            }
            
            MouseArea {
                anchors.fill: parent
                drag.target: parent
                drag.axis: Drag.XAndYAxis
                onPositionChanged: {
                    // 更新文本以显示实时坐标
                    parent.children[0].text = "x:30 y:10\n绝对坐标\n坐标:(" + parent.x.toFixed(2) + "," + parent.y.toFixed(2) + ")"
                }
            }
        }
    }

    // 二、锚定系统（anchors 全属性）
    Column {
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.margins: 30
        spacing: 20
        width: 250

        Text { text: "=== 2. 锚定系统（anchors） ==="; font.bold: true; font.pixelSize: 16 }

        // 1. anchors.fill：填充父组件
        Rectangle {
            id: rect4
            width: 200
            height: 60
            color: "#6A0572"
            opacity: 0.6
            x: 0
            y: 0
            Text {
                anchors.centerIn: parent
                text: "anchors.fill: parent\n坐标:(" + rect4.x + "," + rect4.y + ")"
                color: "#FFFFFF"
                font.pixelSize: 10
            }
            
            MouseArea {
                anchors.fill: parent
                drag.target: parent
                drag.axis: Drag.XAndYAxis
                onPositionChanged: {
                    // 更新文本以显示实时坐标
                    parent.children[0].text = "anchors.fill: parent\n坐标:(" + parent.x.toFixed(2) + "," + parent.y.toFixed(2) + ")"
                }
            }
        }

        // 2. anchors.centerIn：居中父组件
        Rectangle {
            id: rect5
            width: 150
            height: 60
            color: "#AB83A1"
            x: 0
            y: 0
            Text {
                anchors.centerIn: parent
                text: "anchors.centerIn: parent\n坐标:(" + rect5.x.toFixed(2) + "," + rect5.y + ")"
                color: "#FFFFFF"
                font.pixelSize: 10
            }
            
            MouseArea {
                anchors.fill: parent
                drag.target: parent
                drag.axis: Drag.XAndYAxis
                onPositionChanged: {
                    // 更新文本以显示实时坐标，保留两位小数
                    parent.children[0].text = "anchors.centerIn: parent\n坐标:(" + parent.x.toFixed(2) + "," + parent.y.toFixed(2) + ")"
                }
            }
        }

        // 3. 边缘锚定（left/top/right/bottom）+ 边距
        Rectangle {
            id: rect6
            width: 150
            height: 60
            color: "#F15BB5"
            x: 0
            y: 0
            Text {
                anchors.centerIn: parent
                text: "left+top+margin\n坐标:(" + rect6.x + "," + rect6.y + ")"
                color: "#FFFFFF"
                font.pixelSize: 10
            }
            
            MouseArea {
                anchors.fill: parent
                drag.target: parent
                drag.axis: Drag.XAndYAxis
                onPositionChanged: {
                    // 更新文本以显示实时坐标
                    parent.children[0].text = "left+top+margin\n坐标:(" + parent.x.toFixed(2) + "," + parent.y.toFixed(2) + ")"
                }
            }
        }

        // 4. 相对锚定（锚定到其他组件）
        Item {
            width: 200
            height: 100

            Rectangle {
                id: refRect // 参考组件
                width: 80
                height: 40
                color: "#9B5DE5"
                x: 0
                y: 0
                Text { 
                    anchors.centerIn: parent
                    text: "参考\n坐标:(" + refRect.x + "," + refRect.y + ")"
                    color: "#FFFFFF"
                    font.pixelSize: 10
                }
                anchors.left: parent.left
                
                MouseArea {
                    anchors.fill: parent
                    drag.target: parent
                    drag.axis: Drag.XAndYAxis
                    onPositionChanged: {
                        // 更新文本以显示实时坐标
                        parent.children[0].text = "参考\n坐标:(" + parent.x.toFixed(2) + "," + parent.y.toFixed(2) + ")"
                    }
                }
            }
            
            Rectangle {
                id: relativeRect
                width: 80
                height: 40
                anchors.left: refRect.right // 左边缘对齐参考组件右边缘
                anchors.leftMargin: 10      // 间距10
                anchors.verticalCenter: refRect.verticalCenter // 垂直居中对齐
                color: "#00BBF9"
                x: 90  // 初始位置
                y: 30
                Text { 
                    anchors.centerIn: parent
                    text: "相对锚定\n坐标:(" + relativeRect.x + "," + relativeRect.y + ")"
                    color: "#FFFFFF"
                    font.pixelSize: 10
                }
                
                MouseArea {
                    anchors.fill: parent
                    drag.target: parent
                    drag.axis: Drag.XAndYAxis
                    onPositionChanged: {
                        // 更新文本以显示实时坐标
                        parent.children[0].text = "相对锚定\n坐标:(" + parent.x.toFixed(2) + "," + parent.y.toFixed(2) + ")"
                    }
                }
            }
        }
    }

    // 三、样式相关属性（border/radius/gradient）
    Column {
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.margins: 30
        spacing: 20
        width: 200

        Text { text: "=== 3. 样式属性 ==="; font.bold: true; font.pixelSize: 16 }

        // 1. border：边框（颜色+宽度）
        Rectangle {
            id: rect7
            width: 150
            height: 80
            color: "#F8F9FA"
            border.color: "#343A40" // 边框颜色
            border.width: 3         // 边框宽度
            x: 0
            y: 0
            Text {
                anchors.centerIn: parent
                text: "border.width:3\nborder.color:黑色\n坐标:(" + rect7.x + "," + rect7.y + ")"
                color: "#333"
                font.pixelSize: 10
            }
            
            MouseArea {
                anchors.fill: parent
                drag.target: parent
                drag.axis: Drag.XAndYAxis
                onPositionChanged: {
                    // 更新文本以显示实时坐标
                    parent.children[0].text = "border.width:3\nborder.color:黑色\n坐标:(" + parent.x.toFixed(2) + "," + parent.y.toFixed(2) + ")"
                }
            }
        }

        // 2. radius：圆角（单个值/四角分别设置）
        Rectangle {
            id: rect8
            width: 150
            height: 80
            color: "#20C997"
            radius: 15 // 四角统一圆角
            x: 0
            y: 0
            // 四角单独设置（Qt 5.12+支持）
            // topLeftRadius: 20; topRightRadius: 5; bottomLeftRadius: 5; bottomRightRadius: 20
            Text {
                anchors.centerIn: parent
                text: "radius:15\n统一圆角\n坐标:(" + rect8.x + "," + rect8.y + ")"
                color: "#FFFFFF"
                font.pixelSize: 10
            }
            
            MouseArea {
                anchors.fill: parent
                drag.target: parent
                drag.axis: Drag.XAndYAxis
                onPositionChanged: {
                    // 更新文本以显示实时坐标
                    parent.children[0].text = "radius:15\n统一圆角\n坐标:(" + parent.x.toFixed(2) + "," + parent.y.toFixed(2) + ")"
                }
            }
        }

        // 3. gradient：渐变背景（替代color）
        Rectangle {
            id: rect9
            width: 150
            height: 80
            gradient: Gradient {
                GradientStop { position: 0.0; color: "#FF7E5F" } // 顶部渐变起点
                GradientStop { position: 1.0; color: "#FEB47B" } // 底部渐变终点
            }
            x: 0
            y: 0
            Text {
                anchors.centerIn: parent
                text: "gradient 渐变\n坐标:(" + rect9.x + "," + rect9.y + ")"
                color: "#FFFFFF"
                font.pixelSize: 10
            }
            
            MouseArea {
                anchors.fill: parent
                drag.target: parent
                drag.axis: Drag.XAndYAxis
                onPositionChanged: {
                    // 更新文本以显示实时坐标
                    parent.children[0].text = "gradient 渐变\n坐标:(" + parent.x.toFixed(2) + "," + parent.y.toFixed(2) + ")"
                }
            }
        }
    }

    // 四、常用函数与交互
    Column {
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.margins: 30
        spacing: 20
        width: 250

        Text { text: "=== 4. 函数与交互 ==="; font.bold: true; font.pixelSize: 16 }

        // 1. 点击交互（结合MouseArea）+ 动态修改属性
        Rectangle {
            id: interactiveRect
            width: 150
            height: 80
            color: "#E74C3C"
            radius: 8
            x: 0
            y: 0
            Text {
                id: interactText
                anchors.centerIn: parent
                text: "点击修改属性\n坐标:(" + interactiveRect.x + "," + interactiveRect.y + ")"
                color: "#FFFFFF"
                font.pixelSize: 10
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    // 动态修改width/color属性
                    interactiveRect.width = 180;
                    interactiveRect.color = "#8E44AD";
                    interactText.text = "已修改：width=180\ncolor=紫色\n坐标:(" + interactiveRect.x + "," + interactiveRect.y + ")";
                    // 调用update()强制重绘（属性变化时自动调用，特殊场景手动触发）
                    interactiveRect.update();
                }
                onDoubleClicked: {
                    // 恢复默认状态
                    interactiveRect.width = 150;
                    interactiveRect.color = "#E74C3C";
                    interactText.text = "双击恢复默认\n坐标:(" + interactiveRect.x + "," + interactiveRect.y + ")";
                }
                drag.target: parent
                drag.axis: Drag.XAndYAxis
                onPositionChanged: {
                    // 更新文本以显示实时坐标
                    parent.children[0].text = "点击修改属性\n坐标:(" + parent.x.toFixed(2) + "," + parent.y.toFixed(2) + ")";
                }
            }
        }

        // 2. 函数示例：contains（判断点是否在组件内）
        Rectangle {
            id: containRect
            width: 150
            height: 80
            color: "#3498DB"
            x: 0
            y: 0
            Text {
                id: containText
                anchors.centerIn: parent
                text: "点击判断是否在内部\n坐标:(" + containRect.x + "," + containRect.y + ")"
                color: "#FFFFFF"
                font.pixelSize: 10
            }

            MouseArea {
                anchors.fill: parent
                onClicked: function(mouse) {
                    // contains(x,y)：判断坐标是否在组件内
                    let isInside = containRect.contains(mouse.x, mouse.y);
                    containText.text = isInside ? "在内部" : "在外部\n坐标:(" + containRect.x + "," + containRect.y + ")";
                }
                drag.target: parent
                drag.axis: Drag.XAndYAxis
                onPositionChanged: {
                    // 更新文本以显示实时坐标
                    parent.children[0].text = "点击判断是否在内部\n坐标:(" + parent.x.toFixed(2) + "," + parent.y.toFixed(2) + ")";
                }
                
            }
        }
    }

    // 相对于窗口的绝对坐标
    Rectangle {
        id: windowRelativeRect
        width: 150
        height: 80
        color: "#9B5DE5"
        x: 500  // 相对于窗口的x坐标
        y: 580  // 相对于窗口的y坐标
        border.color: "#343A40"// 边框颜色
        border.width: 2// 边框宽度
        radius: 5

        Text {
            anchors.centerIn: parent
            text: "小窗口绝对坐标\nx:500 y:580\n坐标:(" + windowRelativeRect.x + "," + windowRelativeRect.y + ")"
            color: "#FFFFFF"
            font.pixelSize: 10
        }

        MouseArea {
            anchors.fill: parent
            drag.target: parent
            drag.axis: Drag.XAndYAxis
            onPositionChanged: {
                // 更新文本以显示实时坐标
                parent.children[0].text = "窗口绝对坐标\nx:500 y:580\n坐标:(" + parent.x.toFixed(2) + "," + parent.y.toFixed(2) + ")"
            }
        }
    }

    // 五、进阶属性（clip/mapToItem等）
    Rectangle {
        id: advancedRect
        anchors.centerIn: parent
        anchors.verticalCenterOffset: -20
        width: 300
        height: 300
        color: "#F5F5F5"
        border.width: 2
        border.color: "#DDD"
        x: 0
        y: 0

        Text {
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            text: "=== 5. 进阶属性 ===\n坐标:(" + advancedRect.x.toFixed(2) + "," + advancedRect.y.toFixed(2) + ")"; font.bold: true; font.pixelSize: 14
        }

        // clip：裁剪子组件（超出父组件部分隐藏）
        Rectangle {
            id: clipRect
            width: 180
            height: 180
            anchors.centerIn: parent
            color: "#FAFAFA"
            clip: true // 开启裁剪
            border.width: 1
            border.color: "#999"
            x: 0
            y: 0

            Rectangle {
                id: innerRect
                width: 200 // 超出父组件宽度
                height: 200 // 超出父组件高度
                color: "#FF6B6B"
                opacity: 0.6
                x: 0
                y: 0
                Text {
                    anchors.centerIn: parent
                    text: "clip:true\n超出部分裁剪\n坐标:(" + innerRect.x + "," + innerRect.y + ")"
                    color: "#FFFFFF"
                    font.pixelSize: 10
                }
                
                MouseArea {
                    anchors.fill: parent
                    drag.target: parent
                    drag.axis: Drag.XAndYAxis
                    onPositionChanged: {
                        // 更新文本以显示实时坐标
                        parent.children[0].text = "clip:true\n超出部分裁剪\n坐标:(" + parent.x + "," + parent.y + ")"
                    }
                }
            }

            // mapToItem：坐标转换（子组件→父组件）
            Component.onCompleted: {
                let childRect = children[0];
                // 将子组件的(0,0)坐标转换为当前组件的坐标
                let mappedPos = childRect.mapToItem(this, 0, 0);
                console.log("子组件(0,0)映射到父组件：", mappedPos.x, mappedPos.y);
            }
        }
        
        MouseArea {
            anchors.fill: parent
            drag.target: parent
            drag.axis: Drag.XAndYAxis
            onPositionChanged: {
                // 更新文本以显示实时坐标
                parent.children[0].text = "=== 5. 进阶属性 ===\n坐标:(" + parent.x + "," + parent.y + ")";
            }
        }
    }
}