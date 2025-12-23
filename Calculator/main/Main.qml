import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Window {
    id: calculatorWindow
    visible: true
    width: 320
    height: 480
    title: qsTr("简易计算器")
    color: '#f0f2f5'
    minimumWidth: 280
    minimumHeight: 420
    maximumWidth: 320
    maximumHeight: 480

    // 计算核心变量
    property string currentInput: ""  // 当前输入
    property real firstNumber: 0      // 第一个运算数
    property string operatorType: ""  // 运算符（+、-、*、/）
    property bool isOperatorClicked: false  // 是否已点击运算符
    property bool isResultDisplayed: false // 是否显示计算结果

    // 限制输入长度
    function limitInputLength(text) {
        if (text.length > 12) {
            return text.substring(0, 12);
        }
        return text;
    }

    // 格式化数字显示
    function formatNumber(num) {
        // 去除末尾的.0和多余的零
        if (num % 1 === 0) {
            return String(num);
        }
        // 处理小数，最多显示6位
        let str = num.toString();
        if (str.indexOf('.') !== -1) {
            let parts = str.split('.');
            if (parts[1].length > 6) {
                return parseFloat(num).toFixed(6);
            }
        }
        // 处理科学计数法
        if (str.indexOf('e') !== -1 || str.indexOf('E') !== -1) {
            return parseFloat(num).toFixed(6);
        }
        return str;
    }

    // 主容器（网格布局）
    GridLayout {
        id: mainGrid
        anchors.fill: parent
        anchors.margins: 15
        columns: 4  // 4列布局（匹配计算器按钮矩阵）
        rowSpacing: 10
        columnSpacing: 10

        // 显示屏幕容器
        Rectangle {
            Layout.row: 0
            Layout.columnSpan: 4
            Layout.preferredHeight: 70
            radius: 12
            color: '#ffffff'
            
            // 添加阴影效果
            Rectangle {
                anchors.fill: parent
                radius: 12
                color: "#0000001a"
                z: -1
                anchors.margins: -3
            }
            
            // 显示屏幕
            TextField {
                anchors.fill: parent
                anchors.margins: 15
                text: calculatorWindow.currentInput || "0"
                font.family: "微软雅黑"
                font.pointSize: 28
                horizontalAlignment: Text.AlignRight
                verticalAlignment: Text.AlignVCenter
                readOnly: true
                color: '#2d3748'
                background: Rectangle { color: "transparent" }
                
                // 限制输入长度
                onTextChanged: {
                    calculatorWindow.currentInput = limitInputLength(this.text);
                }
            }
        }

        // 功能按钮：清零（C）
        Button {
            id: clearButton
            Layout.row: 1
            Layout.column: 0
            Layout.columnSpan: 2
            Layout.preferredHeight: Math.min(width, 60)
            Layout.fillWidth: true
            text: "C"
            font.pointSize: 18
            font.bold: true
            contentItem: Text {
                text: clearButton.text
                font: clearButton.font
                color: "#ffffff"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
            background: Rectangle {
                color: clearButton.pressed ? "#e53e3e" : "#f56565"
                radius: 12
            }
            
            // 添加阴影效果
            Rectangle {
                anchors.fill: parent
                radius: 12
                color: "#0000001a"
                z: -1
                anchors.margins: -2
            }
            
            onClicked: {
                calculatorWindow.currentInput = ""
                calculatorWindow.firstNumber = 0
                calculatorWindow.operatorType = ""
                calculatorWindow.isOperatorClicked = false
                calculatorWindow.isResultDisplayed = false
            }
        }

        // 功能按钮：除法（/）
        Button {
            id: divideButton
            Layout.row: 1
            Layout.column: 2
            Layout.preferredHeight: Math.min(width, 60)
            Layout.fillWidth: true
            text: "÷"
            font.pointSize: 18
            font.bold: true
            contentItem: Text {
                text: divideButton.text
                font: divideButton.font
                color: "#ffffff"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
            background: Rectangle {
                color: divideButton.pressed ? "#3182ce" : "#4299e1"
                radius: 12
            }
            
            // 添加阴影效果
            Rectangle {
                anchors.fill: parent
                radius: 12
                color: "#0000001a"
                z: -1
                anchors.margins: -2
            }
            
            onClicked: {
                // 支持连续运算
                if (calculatorWindow.currentInput !== "" || calculatorWindow.isResultDisplayed) {
                    if (calculatorWindow.isResultDisplayed) {
                        calculatorWindow.firstNumber = parseFloat(calculatorWindow.currentInput);
                        calculatorWindow.isResultDisplayed = false;
                    } else {
                        calculatorWindow.firstNumber = parseFloat(calculatorWindow.currentInput);
                    }
                    calculatorWindow.operatorType = "/"
                    calculatorWindow.isOperatorClicked = true
                    calculatorWindow.currentInput = ""
                }
            }
        }

        // 功能按钮：乘法（*）
        Button {
            id: multiplyButton
            Layout.row: 1
            Layout.column: 3
            Layout.preferredHeight: Math.min(width, 60)
            Layout.fillWidth: true
            text: "×"
            font.pointSize: 18
            font.bold: true
            contentItem: Text {
                text: multiplyButton.text
                font: multiplyButton.font
                color: "#ffffff"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
            background: Rectangle {
                color: multiplyButton.pressed ? "#3182ce" : "#4299e1"
                radius: 12
            }
            
            // 添加阴影效果
            Rectangle {
                anchors.fill: parent
                radius: 12
                color: "#0000001a"
                z: -1
                anchors.margins: -2
            }
            
            onClicked: {
                if (calculatorWindow.currentInput !== "" || calculatorWindow.isResultDisplayed) {
                    if (calculatorWindow.isResultDisplayed) {
                        calculatorWindow.firstNumber = parseFloat(calculatorWindow.currentInput);
                        calculatorWindow.isResultDisplayed = false;
                    } else {
                        calculatorWindow.firstNumber = parseFloat(calculatorWindow.currentInput);
                    }
                    calculatorWindow.operatorType = "*"
                    calculatorWindow.isOperatorClicked = true
                    calculatorWindow.currentInput = ""
                }
            }
        }

        // 数字按钮通用组件
        component NumberButton: Button {
            Layout.preferredHeight: Math.min(width, 60)
            Layout.fillWidth: true
            font.pointSize: 18
            font.bold: true
            contentItem: Text {
                text: parent.text
                font: parent.font
                color: "#2d3748"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
            background: Rectangle {
                color: parent.down ? "#e2e8f0" : "#ffffff"
                radius: 12
            }
            
            // 添加阴影效果
            Rectangle {
                anchors.fill: parent
                radius: 12
                color: "#0000001a"
                z: -1
                anchors.margins: -2
            }
        }

        // 数字按钮：7
        NumberButton {
            Layout.row: 2
            Layout.column: 0
            text: "7"
            onClicked: {
                if (calculatorWindow.isResultDisplayed) {
                    calculatorWindow.currentInput = "";
                    calculatorWindow.isResultDisplayed = false;
                }
                calculatorWindow.currentInput += "7"
            }
        }

        // 数字按钮：8
        NumberButton {
            Layout.row: 2
            Layout.column: 1
            text: "8"
            onClicked: {
                if (calculatorWindow.isResultDisplayed) {
                    calculatorWindow.currentInput = "";
                    calculatorWindow.isResultDisplayed = false;
                }
                calculatorWindow.currentInput += "8"
            }
        }

        // 数字按钮：9
        NumberButton {
            Layout.row: 2
            Layout.column: 2
            text: "9"
            onClicked: {
                if (calculatorWindow.isResultDisplayed) {
                    calculatorWindow.currentInput = "";
                    calculatorWindow.isResultDisplayed = false;
                }
                calculatorWindow.currentInput += "9"
            }
        }

        // 功能按钮：减法（-）
        Button {
            id: minusButton
            Layout.row: 2
            Layout.column: 3
            Layout.preferredHeight: Math.min(width, 60)
            Layout.fillWidth: true
            text: "−"
            font.pointSize: 22
            font.bold: true
            contentItem: Text {
                text: minusButton.text
                font: minusButton.font
                color: "#ffffff"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
            background: Rectangle {
                color: minusButton.pressed ? "#3182ce" : "#4299e1"
                radius: 12
            }
            
            // 添加阴影效果
            Rectangle {
                anchors.fill: parent
                radius: 12
                color: "#0000001a"
                z: -1
                anchors.margins: -2
            }
            
            onClicked: {
                // 支持负数输入
                if (calculatorWindow.currentInput === "" && !calculatorWindow.isOperatorClicked) {
                    calculatorWindow.currentInput = "-";
                    return;
                }
                
                if (calculatorWindow.currentInput !== "" || calculatorWindow.isResultDisplayed) {
                    if (calculatorWindow.isResultDisplayed) {
                        calculatorWindow.firstNumber = parseFloat(calculatorWindow.currentInput);
                        calculatorWindow.isResultDisplayed = false;
                    } else {
                        calculatorWindow.firstNumber = parseFloat(calculatorWindow.currentInput);
                    }
                    calculatorWindow.operatorType = "-"
                    calculatorWindow.isOperatorClicked = true
                    calculatorWindow.currentInput = ""
                }
            }
        }

        // 数字按钮：4
        NumberButton {
            Layout.row: 3
            Layout.column: 0
            text: "4"
            onClicked: {
                if (calculatorWindow.isResultDisplayed) {
                    calculatorWindow.currentInput = "";
                    calculatorWindow.isResultDisplayed = false;
                }
                calculatorWindow.currentInput += "4"
            }
        }

        // 数字按钮：5
        NumberButton {
            Layout.row: 3
            Layout.column: 1
            text: "5"
            onClicked: {
                if (calculatorWindow.isResultDisplayed) {
                    calculatorWindow.currentInput = "";
                    calculatorWindow.isResultDisplayed = false;
                }
                calculatorWindow.currentInput += "5"
            }
        }

        // 数字按钮：6
        NumberButton {
            Layout.row: 3
            Layout.column: 2
            text: "6"
            onClicked: {
                if (calculatorWindow.isResultDisplayed) {
                    calculatorWindow.currentInput = "";
                    calculatorWindow.isResultDisplayed = false;
                }
                calculatorWindow.currentInput += "6"
            }
        }

        // 功能按钮：加法（+）
        Button {
            id: plusButton
            Layout.row: 3
            Layout.column: 3
            Layout.preferredHeight: Math.min(width, 60)
            Layout.fillWidth: true
            text: "+"
            font.pointSize: 18
            font.bold: true
            contentItem: Text {
                text: plusButton.text
                font: plusButton.font
                color: "#ffffff"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
            background: Rectangle {
                color: plusButton.pressed ? "#3182ce" : "#4299e1"
                radius: 12
            }
            
            // 添加阴影效果
            Rectangle {
                anchors.fill: parent
                radius: 12
                color: "#0000001a"
                z: -1
                anchors.margins: -2
            }
            
            onClicked: {
                if (calculatorWindow.currentInput !== "" || calculatorWindow.isResultDisplayed) {
                    if (calculatorWindow.isResultDisplayed) {
                        calculatorWindow.firstNumber = parseFloat(calculatorWindow.currentInput);
                        calculatorWindow.isResultDisplayed = false;
                    } else {
                        calculatorWindow.firstNumber = parseFloat(calculatorWindow.currentInput);
                    }
                    calculatorWindow.operatorType = "+"
                    calculatorWindow.isOperatorClicked = true
                    calculatorWindow.currentInput = ""
                }
            }
        }

        // 数字按钮：1
        NumberButton {
            Layout.row: 4
            Layout.column: 0
            text: "1"
            onClicked: {
                if (calculatorWindow.isResultDisplayed) {
                    calculatorWindow.currentInput = "";
                    calculatorWindow.isResultDisplayed = false;
                }
                calculatorWindow.currentInput += "1"
            }
        }

        // 数字按钮：2
        NumberButton {
            Layout.row: 4
            Layout.column: 1
            text: "2"
            onClicked: {
                if (calculatorWindow.isResultDisplayed) {
                    calculatorWindow.currentInput = "";
                    calculatorWindow.isResultDisplayed = false;
                }
                calculatorWindow.currentInput += "2"
            }
        }

        // 数字按钮：3
        NumberButton {
            Layout.row: 4
            Layout.column: 2
            text: "3"
            onClicked: {
                if (calculatorWindow.isResultDisplayed) {
                    calculatorWindow.currentInput = "";
                    calculatorWindow.isResultDisplayed = false;
                }
                calculatorWindow.currentInput += "3"
            }
        }

        // 功能按钮：等于（=）
        Button {
            id: equalsButton
            Layout.row: 4
            Layout.column: 3
            Layout.rowSpan: 2
            Layout.preferredHeight: Math.min(width, 130)
            Layout.fillWidth: true
            text: "="
            font.pointSize: 18
            font.bold: true
            contentItem: Text {
                text: equalsButton.text
                font: equalsButton.font
                color: "#ffffff"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
            background: Rectangle {
                color: equalsButton.pressed ? "#38b2ac" : "#48bb78"
                radius: 12
            }
            
            // 添加阴影效果
            Rectangle {
                anchors.fill: parent
                radius: 12
                color: "#0000001a"
                z: -1
                anchors.margins: -2
            }
            
            onClicked: {
                if (calculatorWindow.currentInput !== "" && calculatorWindow.operatorType !== "") {
                    var secondNumber = parseFloat(calculatorWindow.currentInput)
                    var result = 0
                    
                    // 除以零处理
                    if (calculatorWindow.operatorType === "/" && secondNumber === 0) {
                        calculatorWindow.currentInput = "错误"
                        calculatorWindow.operatorType = ""
                        calculatorWindow.firstNumber = 0
                        calculatorWindow.isOperatorClicked = false
                        calculatorWindow.isResultDisplayed = true
                        return
                    }
                    
                    switch (calculatorWindow.operatorType) {
                        case "+":
                            result = calculatorWindow.firstNumber + secondNumber
                            break
                        case "-":
                            result = calculatorWindow.firstNumber - secondNumber
                            break
                        case "*":
                            result = calculatorWindow.firstNumber * secondNumber
                            break
                        case "/":
                            result = calculatorWindow.firstNumber / secondNumber
                            break
                    }
                    
                    // 格式化结果
                    calculatorWindow.currentInput = formatNumber(result)
                    calculatorWindow.operatorType = ""
                    calculatorWindow.firstNumber = result
                    calculatorWindow.isOperatorClicked = false
                    calculatorWindow.isResultDisplayed = true
                }
            }
        }

        // 数字按钮：0
        NumberButton {
            Layout.row: 5
            Layout.column: 0
            Layout.columnSpan: 2
            Layout.preferredHeight: Math.min(width, 60)
            text: "0"
            onClicked: {
                if (calculatorWindow.isResultDisplayed) {
                    calculatorWindow.currentInput = "";
                    calculatorWindow.isResultDisplayed = false;
                }
                // 避免开头多个零
                if (calculatorWindow.currentInput !== "0") {
                    calculatorWindow.currentInput += "0"
                }
            }
        }

        // 数字按钮：小数点
        NumberButton {
            Layout.row: 5
            Layout.column: 2
            Layout.preferredHeight: Math.min(width, 60)
            text: "."
            onClicked: {
                if (calculatorWindow.isResultDisplayed) {
                    calculatorWindow.currentInput = "";
                    calculatorWindow.isResultDisplayed = false;
                }
                // 确保只有一个小数点
                if (calculatorWindow.currentInput.indexOf(".") === -1) {
                    // 如果当前为空，先加0
                    if (calculatorWindow.currentInput === "") {
                        calculatorWindow.currentInput = "0."
                    } else {
                        calculatorWindow.currentInput += "."
                    }
                }
            }
        }
    }
}